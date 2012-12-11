using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace Azuli.Web.Portal.Util
{
    public class Util
    {

        
        public enum meses
        {
            Janeiro = 01,
            Fevereiro = 02,
            Março = 03,
            Abril = 04,
            Maio =05,
            Junho = 06,
            Julho = 07,
            Agosto = 08,
            Setembro = 09,
            Outubro = 10,
            Novembro = 11,
            Dezembro = 12 


        }

        public bool validateSessionAdmin()
        {

            bool retorno = false;


            if (System.Web.HttpContext.Current.Session["AP"] == null && System.Web.HttpContext.Current.Session["Bloco"] == null &&
                System.Web.HttpContext.Current.Session["Proprie1"] == null && System.Web.HttpContext.Current.Session["Proprie2"] == null)
            {

                retorno = false;
                System.Web.HttpContext.Current.Session.Clear();
                System.Web.HttpContext.Current.Response.Redirect("~/LoginAzulli.aspx");

            }
            if (System.Web.HttpContext.Current.Session["AP"].ToString() == "0" && System.Web.HttpContext.Current.Session["Bloco"].ToString() == "0")
            {
                retorno = true;
            }
            else
            {
                retorno = false;
                System.Web.HttpContext.Current.Session.Clear();
                System.Web.HttpContext.Current.Response.Redirect("~/LoginAzulli.aspx");
            }

            return retorno;
        }



        public bool validateSession()
        {
             
            bool retorno = false;


            if (System.Web.HttpContext.Current.Session["AP"] == null && System.Web.HttpContext.Current.Session["Bloco"] == null &&
                System.Web.HttpContext.Current.Session["Proprie1"] == null && System.Web.HttpContext.Current.Session["Proprie2"] == null)
            {

                retorno = false;
                System.Web.HttpContext.Current.Session.Clear();
                System.Web.HttpContext.Current.Response.Redirect("~/LoginAzulli.aspx");

            }
            else if (System.Web.HttpContext.Current.Session["AP"].ToString() == "0" && System.Web.HttpContext.Current.Session["Bloco"].ToString() == "0")
            {
                retorno = false;
                System.Web.HttpContext.Current.Session.Clear();
                System.Web.HttpContext.Current.Response.Redirect("~/LoginAzulli.aspx");
            }
            
            else
            {
                retorno = true;
            }

            return retorno;
        }





        public string GeraSenha()
        {
            string guid = Guid.NewGuid().ToString().Replace("-", "");

            Random clsRan = new Random();
            Int32 tamanhoSenha = clsRan.Next(6, 6);

            string senha = "";
            for (Int32 i = 0; i <= tamanhoSenha; i++)
            {
                senha += guid.Substring(clsRan.Next(1, guid.Length), 1);
            }

            return senha;
        }

        
    }
}