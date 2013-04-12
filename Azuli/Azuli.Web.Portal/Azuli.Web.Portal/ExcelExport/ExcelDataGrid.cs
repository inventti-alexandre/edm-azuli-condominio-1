using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.IO;

namespace Azuli.Web.Portal.ExcelExport
{
    /// <summary>
    /// Class which contains Excel data grid management
    /// </summary>
    public class ExcelDataGrid : ExcelManagement, IDataGrid
    {
        #region Constructors/Destructors
        /// <summary>
        /// Initializes a new instance of the <see cref="ExcelDataGrid"/> class.
        /// </summary>
        /// <param name="path">Path which contains the file</param>
        /// <param name="file">File name</param>
        public ExcelDataGrid(string path, string file)
            : base(path, file)
        {
        }
        /// <summary>
        /// Initializes a new instance of the <see cref="ExcelDataGrid"/> class.
        /// </summary>
        public ExcelDataGrid()
            : base()
        {
        }
        #endregion

        #region Methods

        /// <summary>
        /// Exports the grid grid to download by browser.
        /// </summary>
        /// <param name="fileName">Name of the file.</param>
        /// <param name="gv">The grid view.</param>
        public void Export(string fileName, GridView gv)
        {
            //using (StringWriter sw = new StringWriter())
            using (StringWriter sw = new StringWriter())
            {
                //sw.Encoding = Encoding.UTF8;
                using (HtmlTextWriter htw = new HtmlTextWriter(sw))
                {

                    //  Create a table to contain the grid
                    Table table = new Table();

                    //  include the gridline settings
                    table.GridLines = gv.GridLines;

                    //  add the header row to the table
                    if (gv.HeaderRow != null)
                    {
                        PrepareControlForExport(gv.HeaderRow);
                        table.Rows.Add(gv.HeaderRow);
                    }

                    //  add each of the data rows to the table
                    foreach (GridViewRow row in gv.Rows)
                    {
                        PrepareControlForExport(row);
                        table.Rows.Add(row);
                    }

                    //  add the footer row to the table
                    if (gv.FooterRow != null)
                    {
                        PrepareControlForExport(gv.FooterRow);
                        table.Rows.Add(gv.FooterRow);
                    }

                    //  render the table into the htmlwriter
                    table.RenderControl(htw);

                    base.SaveToDownload(sw);


                }//end using HtmlTextWriter
            }//end using StringWriter
        }
        /// <summary>
        /// Replace any of the contained controls with literals
        /// </summary>
        /// <param name="control">control to prepare to export</param>
        private static void PrepareControlForExport(Control control)
        {
            for (int i = 0; i < control.Controls.Count; i++)
            {
                Control current = control.Controls[i];

                //PropertyInfo[] ctrlProps = current.GetType().GetProperties ();


                if (!current.Visible)
                    control.Controls.Remove(current);
                else
                {

                    if (current is LinkButton)
                    {
                        control.Controls.Remove(current);
                        control.Controls.AddAt(i, new LiteralControl((current as LinkButton).Text));
                    }
                    else if (current is ImageButton)
                    {
                        control.Controls.Remove(current);
                        //control.Controls.AddAt(i, new LiteralControl((current as ImageButton).AlternateText));
                    }
                    else if (current is HyperLink)
                    {
                        control.Controls.Remove(current);
                        control.Controls.AddAt(i, new LiteralControl((current as HyperLink).Text));
                    }
                    else if (current is DropDownList)
                    {
                        control.Controls.Remove(current);
                        control.Controls.AddAt(i, new LiteralControl((current as DropDownList).SelectedItem.Text));
                    }
                    else if (current is CheckBox)
                    {
                        control.Controls.Remove(current);
                        control.Controls.AddAt(i, new LiteralControl((current as CheckBox).Checked ? "True" : "False"));
                    }
                }

                if (current.HasControls())
                {
                    PrepareControlForExport(current);
                }
            }//end for c
        }

        #endregion

        #region IDataGrid Members

        /// <summary>
        /// Exports the specified grid.
        /// </summary>
        /// <param name="grid">The grid.</param>
        public void Export(GridView grid)
        {
            //getting the initial pagesize
            int pageSize = grid.PageSize;

            //Keeping the total rows allowed in excel file
            grid.PageSize = 65000;
            grid.PageIndex = 0;
            grid.DataBind();

            //Exporting data
            Export("export.xls", grid);

            //Setting the pagesize gotten before
            grid.PageSize = pageSize;


        }
        /// <summary>
        /// Exports the grid which contains paging.
        /// </summary>
        /// <param name="page">The current page which will exported.</param>
        /// <param name="grid">The grid used as reference to export data.</param>
        public void ExportPaging(int page, GridView grid)
        {
            int pageIndex = grid.PageIndex;

            grid.PageIndex = page;
            grid.DataBind();

            Export("export.xls", grid);

            grid.PageIndex = pageIndex;
        }

        #endregion
    }
}