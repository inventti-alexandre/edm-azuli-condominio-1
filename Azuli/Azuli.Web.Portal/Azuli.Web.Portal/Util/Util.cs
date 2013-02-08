﻿using System;
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


      
    /// <summary>
    /// Este método, ordena a senha, pois a senha gravada no microsiga 
    /// é por padrão para uma senha 123456, 246135.
    /// </summary>
    /// <returns></returns>
        public string SNH(string senha)
        {
            try
            {
                //Definição dos Vetores
                string[] VetorSenha = new string[8];
                string retorno = "";


                //Loop para preencher o Vetor de Senhas, vindo da string Senha
                for (int i = 0; i < 1; i++)
                {
                    VetorSenha[i] = senha;
                }

                //Loop para percorrer os vetores
                for (int i = 0; i < 1; i++)
                {

                    //Atribui valores para o Vetor
                    VetorSenha[1] = senha[0].ToString();
                    VetorSenha[3] = senha[1].ToString();
                    VetorSenha[5] = senha[2].ToString();
                    VetorSenha[0] = senha[3].ToString();
                    VetorSenha[2] = senha[4].ToString();
                    VetorSenha[4] = senha[5].ToString();
                    VetorSenha[7] = senha[6].ToString();
                    VetorSenha[6] = senha[7].ToString();
           
  
    
                }



                foreach (string v in VetorSenha)
                {
                    retorno += v;

                }

                return retorno;
            }
            catch
            {
                throw new Exception("Usuário ou Senha inválido");
            }
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
            else if (System.Web.HttpContext.Current.Session["AP"].ToString() == "0" && System.Web.HttpContext.Current.Session["Bloco"].ToString() == "0")
            {
               
                System.Web.HttpContext.Current.Session["administrador"] = true;
                retorno = true;
            }

            else if (System.Web.HttpContext.Current.Session["MoradorSemInternetAP"] != null && System.Web.HttpContext.Current.Session["MoradorSemInternetBloco"] != null)
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