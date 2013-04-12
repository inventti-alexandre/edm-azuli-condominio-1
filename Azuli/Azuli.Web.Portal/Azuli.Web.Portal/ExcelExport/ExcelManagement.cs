﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using System.Text;

namespace Azuli.Web.Portal.ExcelExport
{
    public class ExcelManagement:BaseManagement
    {
        #region Variables

        /// <summary>
        /// Variable which contains excel workbook
        /// </summary>
        private NPOI.HSSF.UserModel.HSSFWorkbook _workbook;
        /// <summary>
        /// Variable which contains excel sheet
        /// </summary>
        private NPOI.SS.UserModel.Sheet _sheet;
        /// <summary>
        /// File which contains the excel opened
        /// </summary>
        private FileStream _openedFile;

        /// <summary>
        /// Excel data format
        /// </summary>
        private NPOI.SS.UserModel.CellStyle _dataStyle;
        /// <summary>
        /// Excel Header format
        /// </summary>
        private NPOI.SS.UserModel.CellStyle _headerStyle;

        #endregion

        #region Properties
        #endregion

        #region Constructors/Destructors
        /// <summary>
        /// Initializes a new instance of the <see cref="ExcelManagement"/> class.
        /// </summary>
        /// <param name="path">The path.</param>
        /// <param name="file">The file.</param>
        public ExcelManagement(string path, string file)
            : base(path, file)
        {


        }
        /// <summary>
        /// Initializes a new instance of the <see cref="ExcelManagement"/> class.
        /// </summary>
        public ExcelManagement()
            : this(".", "file.xls")
        {
        }
        #endregion

        #region Methods
        /// <summary>
        /// Creates the header style.
        /// </summary>
        /// <param name="wb">The wb.</param>
        /// <returns></returns>
        private static NPOI.SS.UserModel.CellStyle CreateHeaderStyle(HSSFWorkbook wb)
        {
            Font font = wb.CreateFont();
            font.Boldweight = (short)FontBoldWeight.BOLD;

            NPOI.SS.UserModel.CellStyle cellStyle = wb.CreateCellStyle();
            cellStyle.SetFont(font);
            return cellStyle;
        }
        /// <summary>
        /// Creates the style.
        /// </summary>
        /// <param name="wb">The wb.</param>
        /// <param name="bold">if set to <c>true</c> [bold].</param>
        /// <returns></returns>
        private static NPOI.SS.UserModel.CellStyle CreateStyle(HSSFWorkbook wb, bool bold)
        {
            Font font = wb.CreateFont();
            if (bold)
            {
                font.Boldweight = (short)FontBoldWeight.BOLD;
            }

            NPOI.SS.UserModel.CellStyle cellStyle = wb.CreateCellStyle();
            cellStyle.SetFont(font);

            return cellStyle;
        }


        /// <summary>
        /// Creates the excel workbook.
        /// </summary>
        /// <param name="subject">The subject.</param>
        protected void CreateWorkbook(string subject)
        {
            //Creating the excel workbook
            NPOI.HSSF.UserModel.HSSFWorkbook wb = new NPOI.HSSF.UserModel.HSSFWorkbook();

            //Creating summary information to the document
            NPOI.HPSF.DocumentSummaryInformation dsi = NPOI.HPSF.PropertySetFactory.CreateDocumentSummaryInformation();
            dsi.Company = "TIVIT";

            //Applying summary information to the document
            wb.DocumentSummaryInformation = dsi;

            //Creating summary information for the data
            NPOI.HPSF.SummaryInformation si = NPOI.HPSF.PropertySetFactory.CreateSummaryInformation();
            si.Subject = subject;

            //Applying summary information to the data
            wb.SummaryInformation = si;

            _workbook = wb;




            //Creating the current styles
            Font font = _workbook.CreateFont();
            font.Boldweight = (short)FontBoldWeight.BOLD;

            NPOI.SS.UserModel.CellStyle cellStyle = _workbook.CreateCellStyle();
            cellStyle.SetFont(font);

            _headerStyle = CreateHeaderStyle(_workbook);
            _dataStyle = CreateStyle(_workbook, false);
        }
        /// <summary>
        /// Creates the excel worksheet.
        /// </summary>
        /// <param name="name">The sheet name.</param>
        protected void CreateWorksheet(string name)
        {
            if (_workbook == null)
                CreateWorkbook("");


            //Creating the Sheet which will show us all data 
            NPOI.SS.UserModel.Sheet sheet = _workbook.CreateSheet(name);

            _sheet = sheet;


        }
        /// <summary>
        /// Adds the row into sheet.
        /// </summary>
        /// <param name="pos">The row position.</param>
        protected void AddRow(int pos)
        {
            //Creating row to insert data entries
            NPOI.SS.UserModel.Row row = _sheet.CreateRow(pos);

        }
        /// <summary>
        /// Gets the cell to manage it.
        /// </summary>
        /// <param name="rowPos">The row pos.</param>
        /// <param name="columnPos">The column pos.</param>
        /// <returns>Cell of the spreadsheet</returns>
        private NPOI.SS.UserModel.Cell GetCell(int rowPos, int columnPos)
        {

            NPOI.SS.UserModel.Row row = _sheet.GetRow(rowPos);

            if (row == null)
            {
                AddRow(rowPos);
                row = _sheet.GetRow(rowPos);
            }

            //Creating the cell
            NPOI.SS.UserModel.Cell cell = row.GetCell(columnPos);

            if (cell == null)
            {
                row.CreateCell(columnPos);
                cell = row.GetCell(columnPos);
            }

            return cell;
        }
        /// <summary>
        /// Sets the number in the specified position.
        /// </summary>
        /// <param name="rowPos">The row pos.</param>
        /// <param name="columnPos">The column pos.</param>
        /// <param name="value">The value.</param>
        protected void SetNumber(int rowPos, int columnPos, double value)
        {
            NPOI.SS.UserModel.Cell cell = GetCell(rowPos, columnPos);

            cell.SetCellValue(value);
        }
        /// <summary>
        /// Sets the value in the specified position.
        /// </summary>
        /// <param name="rowPos">The row position.</param>
        /// <param name="columnPos">The column position.</param>
        /// <param name="value">The value.</param>
        protected void SetValue(int rowPos, int columnPos, string value)
        {
            SetValue(rowPos, columnPos, value, false);
        }
        /// <summary>
        /// Sets the value.
        /// </summary>
        /// <param name="rowPos">The row pos.</param>
        /// <param name="columnPos">The column pos.</param>
        /// <param name="value">The value.</param>
        /// <param name="header">if set to <c>true</c> [header].</param>
        protected void SetValue(int rowPos, int columnPos, string value, bool header)
        {
            NPOI.SS.UserModel.Cell cell = GetCell(rowPos, columnPos);


            if (value == null)
                value = "";

            //Setting value to the cell
            cell.SetCellValue(value);

            if (_headerStyle != null && _dataStyle != null)
            {
                if (header)
                    cell.RichStringCellValue.ApplyFont(_headerStyle.GetFont(_workbook));
                else
                    cell.RichStringCellValue.ApplyFont(_dataStyle.GetFont(_workbook));
            }

        }
        /// <summary>
        /// Gets the value from a specific row and column.
        /// </summary>
        /// <param name="rowPos">The row position.</param>
        /// <param name="columnPos">The column position.</param>
        /// <returns>value found</returns>
        protected string GetValue(int rowPos, int columnPos)
        {
            return _sheet.GetRow(rowPos).GetCell(columnPos).ToString();
        }
        /// <summary>
        /// Gets the number of the sheet.
        /// </summary>
        /// <param name="rowPos">The row pos.</param>
        /// <param name="columnPos">The column pos.</param>
        /// <returns>Value found</returns>
        protected double GetNumber(int rowPos, int columnPos)
        {
            return _sheet.GetRow(rowPos).GetCell(columnPos).NumericCellValue;
        }
        /// <summary>
        /// Saves all data created to the file.
        /// </summary>
        /// <param name="fileName">Name of the file.</param>
        protected void SaveFile(string fileName)
        {
            if (System.IO.File.Exists(fileName))
                System.IO.File.Delete(fileName);

            //Saving all data in the physical excel file
            FileStream excelFile = new FileStream(fileName, FileMode.Create);
            _workbook.Write(excelFile);
            excelFile.Close();

        }
        /// <summary>
        /// Saves the file into the fileStream.
        /// </summary>
        /// <param name="fileStream">The file stream.</param>
        protected void SaveFile(System.IO.Stream fileStream)
        {
            _workbook.Write(fileStream);
        }
        /// <summary>
        /// Opens the specified file.
        /// </summary>
        /// <param name="fileName">Name of the file.</param>
        protected void OpenFile(string fileName)
        {
            IsFileValid();

            //Openning the file
            _openedFile = new FileStream(fileName, FileMode.Open, FileAccess.Read);

            //Load the template into a NPOI workbook
            _workbook = new HSSFWorkbook(_openedFile, true);

            //Getting the sheet
            _sheet = _workbook.GetSheetAt(0);

        }
        /// <summary>
        /// Closes the file.
        /// </summary>
        protected void CloseFile()
        {
            _openedFile.Close();
            _openedFile.Dispose();
        }
        /// <summary>
        /// Gets the number of total rows.
        /// </summary>
        /// <returns>Number of total rows</returns>
        protected int GetTotalRows()
        {
            return _sheet.PhysicalNumberOfRows;
        }
        /// <summary>
        /// Saves the file to be downloaded.
        /// </summary>
        protected void SaveToDownload()
        {
            //If it is not a web page
            if (HttpContext.Current == null)
            {
                string newFile = System.IO.Path.Combine(base.Path, "new_" + base.FileName);

                SaveFile(newFile);
            }
            //If it is web page
            else
            {

                //Creating the way to download the file created
                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.ContentEncoding = Encoding.Default;
                HttpContext.Current.Response.AddHeader(
                    "content-disposition", string.Format("attachment; filename={0}", base.FileName));
                HttpContext.Current.Response.ContentType = "application/ms-excel";

                //Saving file to be downloaded
                SaveFile(HttpContext.Current.Response.OutputStream);

                HttpContext.Current.Response.End();
            }
        }
        /// <summary>
        /// Saves the writer to download.
        /// </summary>
        /// <param name="writer">The writer.</param>
        protected void SaveToDownload(StringWriter writer)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentEncoding = Encoding.Default;
            HttpContext.Current.Response.AddHeader(
                "content-disposition", string.Format("attachment; filename={0}", base.FileName));
            HttpContext.Current.Response.ContentType = "application/ms-excel";

            //  render the htmlwriter into the response
            HttpContext.Current.Response.Write(writer.ToString());
            HttpContext.Current.Response.End();
        }
        /// <summary>
        /// Set column to be autoresize
        /// </summary>
        /// <param name="column">The column.</param>
        protected void AutoResize(int column)
        {
            _sheet.AutoSizeColumn(column);
        }


        #endregion
    }
}