using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Business;
using Azuli.Web.Model;
using System.Drawing;

namespace Azuli.Web.Portal
{
    public partial class integracaoWeb : System.Web.UI.Page
    {
        #region Properties
        private listaSegundaViaAgua IteropList
        {
            get
            {
                if (ViewState["IteropList"] == null)
                    return new listaSegundaViaAgua();
                else
                    return (listaSegundaViaAgua)ViewState["IteropList"];
            }
            set
            {
                ViewState["IteropList"] = value;
            }
        }
        #endregion


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string script = "$(document).ready(function () { $('[id*=cmdSave]').click(); });";
                ClientScript.RegisterStartupScript(this.GetType(), "load", script, true);
                hiddenComponent();
                btnCheck.Visible = true;
            }
        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            
            this.lblSaved.Visible = false;
            try
            {

                if (this.fupProject.HasFile)
                {
                  
                    divtabela.Visible = true;
                    Util.ImportFileIntegrationWeb oIntegracao = new Util.ImportFileIntegrationWeb();

                    listaSegundaViaAgua olist = oIntegracao.LoadFile(fupProject.FileContent);

                    var ordenaList = from listaOrdena in olist
                                     orderby listaOrdena.registro ascending
                                     select listaOrdena;

                    IteropList.Clear();
                    IteropList = olist;

                    this.grdImport.DataSource = ordenaList;
                    this.grdImport.DataBind();
                    this.lblTotalRead.Text = olist.Count.ToString();

                    this.cvErrorMessage.IsValid = true;
                    this.cmdSave.Enabled = true;

                    showComponent();
                    

                }

                else
                {

                    this.lblTotalRead.Text = "0";
                    this.grdImport.DataSource = null;
                    this.grdImport.DataBind();
                    this.cvErrorMessage.ErrorMessage = "No File Uploaded.";
                    this.cvErrorMessage.IsValid = false;
                    this.cmdSave.Enabled = false;

                }
            }
            catch (Exception ex)
            {
                this.cvErrorMessage.ErrorMessage = ex.Message;
                this.cvErrorMessage.IsValid = false;
            }    
        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {

            

            ReciboAgua oReciboModel = new ReciboAgua();
            ReciboAguaBLL bussiness = new ReciboAguaBLL();

            oReciboModel.ano = IteropList[1].mes;
            oReciboModel.mes = IteropList[1].ano;

            var contador = bussiness.validaImportacao(oReciboModel);

            if (contador.Count <= 1)
            {



                // Add Fake Delay to simulate long running process.
                System.Threading.Thread.Sleep(5000);
                //Forech entry found in text file loaded
                for (int c = 0; c < IteropList.Count; c++)
                {

                    try
                    {
                        bussiness.importIntegracaoWeb(IteropList[c]);
                    }
                    catch (Exception ex)
                    {
                        ex.Message.ToString();
                    }
                }

                this.lblSaved.Visible = true;
                lblSaved.Text = "Integração feita com sucesso !";
                divtabela.Visible = false;
                this.cvErrorMessage.IsValid = true;
                cmdSave.Visible = true;
                lblDescTotalRead.Visible = false;
                lblTotalRead.Visible = false;
                btnCheck.Visible = false;
            }
            else
            {
                this.lblSaved.Visible = true;
                this.lblSaved.ForeColor = Color.Red;
                lblSaved.Text = "já houve integração para esses dados, favor contacte o Administrador !";
            }
        }

        public void hiddenComponent()
        {
            divtabela.Visible = false;
            lblDescTotalRead.Visible = false;
            lblSaved.Visible = false;
            lblTotalRead.Visible = false;
            cmdSave.Visible = false;
            btnCheck.Visible = false;
        }

        public void showComponent()
        {
            divtabela.Visible = true;
            lblDescTotalRead.Visible = true;
            lblTotalRead.Visible = true;
            cmdSave.Visible = true;
        }
    }

   

}