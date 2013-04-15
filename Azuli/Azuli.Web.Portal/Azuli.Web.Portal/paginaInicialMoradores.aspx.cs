using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Model;
using Azuli.Web.Business;
using System.Text;
using System.IO;

namespace Azuli.Web.Portal
{
    public partial class paginaInicialMoradores : Util.Base
    {
        Util.Util oUtil = new Util.Util();
        MensagemMoradorModel oMensagemModel = new MensagemMoradorModel();
        MensagemMoradorBLL oMensagemBLL = new MensagemMoradorBLL();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (oUtil.validateSession())
            {
                if (!IsPostBack)
                {
                    lblMorador.Text = Session["Proprie1"].ToString();
                    Session["AP"].ToString();
                    Session["Bloco"].ToString();
                    Session["Proprie2"].ToString();
                    listaMensagemMoradorBLL();

                    if (Session["mensagem"] != null)
                    {
                        lnkBtnMsg.Text = Session["mensagem"].ToString();
                    }
                    else
                    {
                        lnkBtnMsg.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }

        }


        public void listaMensagemMoradorBLL()
        {
            try
            {
                ApartamentoModel oApModel = new ApartamentoModel();
                oApModel.apartamento = Convert.ToInt32(Session["AP"]);
                oApModel.bloco = Convert.ToInt32(Session["Bloco"]);
                oMensagemModel.status = "1";
                oMensagemModel.oAp = oApModel;

                listaMensagemMorador listaQuantidade = new listaMensagemMorador();

                int contador = 0;

                if (oMensagemBLL.listaMensagemMorador(oMensagemModel).Count > 0)
                {
                    foreach (var item in oMensagemBLL.listaMensagemMorador(oMensagemModel))
                    {

                        contador += Convert.ToInt32(item.qtdMsg);
                        Session["mensagem"] = contador;
                    }
                }
                else
                {
                    Session.Remove("mensagem");
                }

            }
            catch (Exception ex)
            {
                ex.ToString();
            }

        }

        protected void lnkBtnMsg_Click(object sender, EventArgs e)
        {

        }

        protected void lnkBtnMsg_Click1(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["mensagem"]) >= 1)
            {
                Response.Redirect("detalheMensagemMorador.aspx");

            }
            else
            {
                lnkBtnMsg.ForeColor = System.Drawing.Color.Red;
            }

        }

        protected void link1_Click(object sender, EventArgs e)
        {
            const string scriptString = "<script type='text/javascript'> alert('Desculpe em breve teremos estas informações, acesse o menu acima, obrigado!');</script>";
            ClientScriptManager script = Page.ClientScript;
            script.RegisterClientScriptBlock(GetType(), "randomName", scriptString);
        }

        protected void Link2_Click(object sender, EventArgs e)
        {
            const string scriptString = "<script type='text/javascript'> alert('Desculpe em breve teremos estas informações, acesse o menu acima, obrigado!');</script>";
            ClientScriptManager script = Page.ClientScript;
            script.RegisterClientScriptBlock(GetType(), "randomName", scriptString);
        }

      
        protected void link4_Click(object sender, EventArgs e)
        {
            const string scriptString = "<script type='text/javascript'> alert('Desculpe em breve teremos estas informações, acesse o menu acima, obrigado!');</script>";
            ClientScriptManager script = Page.ClientScript;
            script.RegisterClientScriptBlock(GetType(), "randomName", scriptString);
        }

        protected void lnkDonwload_Click(object sender, EventArgs e)
        {
            listarArquivos();
        }


        private void listarArquivos()
        {

            try
            {


                string folder = System.Configuration.ConfigurationManager.AppSettings["ArquivosCondominioDownload"];

                FileInfo arquivo = new FileInfo(Server.MapPath(folder) + ("\\sgcFernandesVilela.pps"));

                Response.Clear();


                Response.AddHeader("Content-Disposition", ("attachment; filename=\"" + arquivo.Name));
                Response.Charset = "utf8";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Length", arquivo.Length.ToString());
                Response.WriteFile(arquivo.FullName);
                Response.Flush();
            }
            catch (FileNotFoundException)
            {

                throw;
            }

        }

        
    }
   }
