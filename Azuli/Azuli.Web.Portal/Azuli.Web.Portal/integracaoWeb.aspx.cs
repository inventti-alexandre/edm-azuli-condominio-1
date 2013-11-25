using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Business;
using Azuli.Web.Model;

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
                hiddenComponent();
           

        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            this.lblSaved.Visible = false;
            try
            {

                if (this.fupProject.HasFile)
                {
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

            ReciboAguaBLL bussiness = new ReciboAguaBLL();

             //Forech entry found in text file loaded
            for (int c = 0; c < IteropList.Count; c++)
            {
                try
                {
                    bussiness.importIntegracaoWeb(IteropList[c]);
                    lblSaved.Visible = true;
                }
                catch (Exception ex)
                {
                    ex.Message.ToString();
                }
            }

            this.lblSaved.Visible = true;
            this.cvErrorMessage.IsValid = true;

        }

        public void hiddenComponent()
        {
            divtabela.Visible = false;
            lblDescTotalRead.Visible = false;
            lblSaved.Visible = false;
            lblTotalRead.Visible = false;
        }

        public void showComponent()
        {
            divtabela.Visible = true;
            lblDescTotalRead.Visible = true;
            lblTotalRead.Visible = true;
        }
    }

   

}