using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Model;
using System.IO;
using System.Collections;
using Azuli.Web.Business;
namespace Azuli.Web.Portal

{
    public partial class circular : Util.Base
    {
        DateTime data = DateTime.Now;
        Util.Util oUtil = new Util.Util();
        Azuli.Web.Model.File oFile = new Azuli.Web.Model.File();
        FileBLL oFileBLL = new Business.FileBLL(); 
        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (oUtil.validateSessionAdmin())
            {
                if (!IsPostBack)
                {
                    
                    preencheMeses();
                    drpMes.SelectedIndex = data.Month - 1;
                    preencheAno();

                }
            }
        }

       


        public void preencheMeses()
        {
            string mesCorrente = "";
            drpMes.DataSource = Enum.GetNames(typeof(Util.Util.meses));
           


            mesCorrente = System.Globalization.DateTimeFormatInfo.CurrentInfo.GetMonthName(data.Month);

            drpMes.Items.Add(mesCorrente); //drpMeses.Items.IndexOf(drpMeses.Items.FindByValue(data.Month.ToString()));
            drpMes.DataBind();
        }

        public void preencheAno()
        {

            for (int ano = data.Year; ano < 2020; ano++)
            {
                drpAno.Items.Add(ano.ToString());
            }

        }

        public int validaPublicacao( Azuli.Web.Model.File oFile)
        {
            int qtdPublicacao = 0; 
            try
            {
               qtdPublicacao = oFileBLL.validaCircular(oFile);

            }
            catch (Exception)
            {
                
                throw;
            }

            return qtdPublicacao;
        }

        protected void btnPublicar_Click(object sender, EventArgs e)
        {

            
          
            string arq = fileWord.PostedFile.FileName;
            string folder = System.Configuration.ConfigurationManager.AppSettings["ArquivosCondominio"]+"/"+arq;

            oFile.nameFile = folder;

            List < Util.Util.meses> lista = Enum.GetValues(typeof(Util.Util.meses)).Cast<Util.Util.meses>().ToList();

            string mesEscolhido = "";
            foreach (var item in  lista)
            {

                mesEscolhido = item.ToString();

                if (mesEscolhido == drpMes.SelectedItem.Value)
                {
                    oFile.mes = Convert.ToInt32(item);
                }

                
            }

            oFile.assunto = txtAssunto.Text;
               
            oFile.ano = Convert.ToInt32(drpAno.SelectedItem.Value);
            oFile.areaPublicacao = (int)Util.Util.paginaPublicada.circular;

            if (validaPublicacao(oFile) <= 0)
            {

                try
                {

                    oFileBLL.publicarArquivo(oFile);

                    fileWord.PostedFile.SaveAs(Server.MapPath(folder));
                    

                    lblMsg.Text = "Arquivo publicado com sucesso!!";

                }
                catch (Exception)
                {

                    throw;
                }

            }

            else
            {
                lblMsg.Text = "Já existe Circular publicado o mês: " + oFile.mes + " e ano: " + oFile.ano;
            }
           
           
        }
       

        
    }

    
}