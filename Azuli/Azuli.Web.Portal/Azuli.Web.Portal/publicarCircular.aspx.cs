using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Model;
using System.IO;

namespace Azuli.Web.Portal
{
    public partial class circular : System.Web.UI.Page
    {
        DateTime data = DateTime.Now;
        Util.Util oUtil = new Util.Util();
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

        protected void btnPublicar_Click(object sender, EventArgs e)
        {

            //PArei aqui
            Azuli.Web.Model.File oFile = new Azuli.Web.Model.File();
            Azuli.Web.Business.FileBLL oFileBLL = new Business.FileBLL(); 

            string arq = fileWord.PostedFile.FileName;
            string folder = System.Configuration.ConfigurationManager.AppSettings["ArquivosCondominio"]+"/"+arq;

            oFile.nameFile = folder;

             Array teste = Enum.GetValues(typeof(Util.Util.meses));

            foreach (var item in  teste)
            {
                

                
            }

            oFile.mes = Convert.ToInt32(drpMes.SelectedItem);
            oFile.ano = Convert.ToInt32(drpAno.SelectedItem);
            oFile.areaPublicacao = (int)Util.Util.paginaPublicada.circular;

            try
            {

                oFileBLL.publicarArquivo(oFile);

                fileWord.PostedFile.SaveAs(Server.MapPath(folder));

            }
            catch (Exception)
            {
                
                throw;
            }
           

           
           
        }
    }
}