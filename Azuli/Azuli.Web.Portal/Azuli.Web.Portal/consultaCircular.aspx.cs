using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using Azuli.Web.Business;
using System.IO;

namespace Azuli.Web.Portal
{
    public partial class consultaCircular : Util.Base
    {
        Util.Util oUtil = new Util.Util();
        FileBLL oFileBLL = new Business.FileBLL();
        Azuli.Web.Model.File oFile = new Azuli.Web.Model.File();
        int ano = DateTime.Now.Year;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (oUtil.validateSession())
            {
                if (!IsPostBack)
                {
                    dvArquivosPublicados.Visible = false;
                    CalculateQtdFile();
                    this.lbtMonth1.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(1).ToUpper();
                    this.lbtMonth2.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(2).ToUpper();
                    this.lbtMonth3.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(3).ToUpper();
                    this.lbtMonth4.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(4).ToUpper();
                    this.lbtMonth5.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(5).ToUpper();
                    this.lbtMonth6.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(6).ToUpper();
                    this.lbtMonth7.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(7).ToUpper();
                    this.lbtMonth8.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(8).ToUpper();
                    this.lbtMonth9.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(9).ToUpper();
                    this.lbtMonth10.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(10).ToUpper();
                    this.lbtMonth11.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(11).ToUpper();
                    this.lbtMonth12.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(12).ToUpper();
                    
                }
            }
            

        }

        /// <summary>
        /// Calculates the percentage of all months of the year base.
        /// </summary>
        protected void CalculateQtdFile()
        {

           
            oFile.ano = ano;

            Dictionary<int, int> qtdPublicacao = new Dictionary<int, int>();
            
        
            try
            {
                qtdPublicacao = oFileBLL.contaArquivoByMeses(oFile);

                foreach (var item in qtdPublicacao)
                {
                    if (item.Key == 1)
                    {
                        lblPercentage1.Text = item.Value.ToString();
                    }
                    else if (item.Key == 2)
                    {
                        lblPercentage2.Text = item.Value.ToString();
                    }
                    else if (item.Key == 3)
                    {
                        lblPercentage3.Text = item.Value.ToString();
                    }
                    else if (item.Key == 4)
                    {
                        lblPercentage4.Text = item.Value.ToString();
                    }
                    else if (item.Key == 5)
                    {
                        lblPercentage5.Text = item.Value.ToString();
                    }
                    else if (item.Key == 6)
                    {
                        lblPercentage6.Text = item.Value.ToString();
                    }
                    else if (item.Key == 7)
                    {
                        lblPercentage7.Text = item.Value.ToString();
                    }
                    else if (item.Key == 8)
                    {
                        lblPercentage8.Text = item.Value.ToString();
                    }
                    else if (item.Key == 9)
                    {
                        lblPercentage9.Text = item.Value.ToString();
                    }
                    else if (item.Key == 10)
                    {
                        lblPercentage10.Text = item.Value.ToString();
                    }
                    else if (item.Key == 11)
                    {
                        lblPercentage11.Text = item.Value.ToString();
                    }
                    else if (item.Key == 12)
                    {
                        lblPercentage12.Text = item.Value.ToString();
                    }

                }


               

            }
            catch (Exception)
            {

                throw;
            }

         



            //Business.Support.TimeSheet busTimeSheet = new Rhodia.Sahs.Business.Support.TimeSheet();
           
        }





        protected void lbtMonth_Click(object sender, EventArgs e)
        {
            preencheGridListaArquivo(1);
        }

        protected void lbtMonth2_Click(object sender, EventArgs e)
        {
            preencheGridListaArquivo(2);
        }

        protected void lbtMonth3_Click(object sender, EventArgs e)
        {
            preencheGridListaArquivo(3);
        }

        protected void lbtMonth4_Click(object sender, EventArgs e)
        {
            preencheGridListaArquivo(4);
        }

        protected void lbtMonth5_Click(object sender, EventArgs e)
        {
            preencheGridListaArquivo(5);
        }

        protected void lbtMonth6_Click(object sender, EventArgs e)
        {
            preencheGridListaArquivo(6);
        }

        protected void lbtMonth7_Click(object sender, EventArgs e)
        {
            preencheGridListaArquivo(7);
        }
        protected void lbtMonth8_Click(object sender, EventArgs e)
        {
            preencheGridListaArquivo(8);
        }
        protected void lbtMonth9_Click(object sender, EventArgs e)
        {
            preencheGridListaArquivo(9);
        }
        protected void lbtMonth10_Click(object sender, EventArgs e)
        {
            preencheGridListaArquivo(10);
        }
        protected void lbtMonth11_Click(object sender, EventArgs e)
        {
            preencheGridListaArquivo(11);
        }
        protected void lbtMonth12_Click(object sender, EventArgs e)
        {
            preencheGridListaArquivo(12);
        }

        public void preencheGridListaArquivo(int mes)
        {
            oFile.ano = ano;
            oFile.mes = mes;
            try
            {
               grdCircular.DataSource =  oFileBLL.listaArquivoCircular(oFile);
               grdCircular.DataBind();
               dvArquivosPublicados.Visible = true;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        protected void grdCircular_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string caminhoDownload = "";

            int index = int.Parse((string)e.CommandArgument);
            caminhoDownload = grdCircular.DataKeys[index]["nameFile"].ToString();
            listarArquivos(caminhoDownload);
           
        }


        private void listarArquivos(string caminhoArquivo)
        {
                string folder = System.Configuration.ConfigurationManager.AppSettings["ArquivosCondominioDownload"];

                FileInfo arquivo = new FileInfo(Server.MapPath(folder) + ("\\" + caminhoArquivo));
               
                Response.Clear();
              
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Disposition", ("attachment; filename=\""
                                + (arquivo.Name + "\"")));
             
                Response.AddHeader("Content-Length", arquivo.Length.ToString());
                Response.Flush();
                Response.WriteFile(arquivo.FullName);
            
        }
    

    }
}