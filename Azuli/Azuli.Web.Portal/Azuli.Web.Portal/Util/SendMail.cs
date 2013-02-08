using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Configuration;

namespace Azuli.Web.Portal.Util
{
    public class SendMail
    {

        public void enviaSenha(string mensagem, string proprietario, string emailProprietario, int status)
        {
            string senhaDescriptografada = "";
            string emailMorador = emailProprietario;
            string nomeMorador = proprietario;
            SmtpClient cliente = new SmtpClient();
            Util descriptografaSenha = new Util();
            string emailRemetente = ConfigurationManager.AppSettings["emailRemetente"].ToString();
            string logError = ConfigurationManager.AppSettings["emailErrorSystem"].ToString();
            
            string senhaCriptrografada = ConfigurationManager.AppSettings["pwd"].ToString();

            senhaDescriptografada = descriptografaSenha.SNH(senhaCriptrografada);


            NetworkCredential credencial = new NetworkCredential(emailRemetente, senhaDescriptografada);
            cliente.UseDefaultCredentials = false;
            cliente.Credentials = credencial;
            cliente.EnableSsl = true;

            cliente.DeliveryMethod = SmtpDeliveryMethod.Network;

             MailAddress remetente = new MailAddress(emailRemetente, "Administrador Azuli");

             MailAddress destinatario = null;

             if (status != 0)
             {
                  destinatario = new MailAddress(logError, "Sistema Azuli");
             }
             else
             {
                  destinatario = new MailAddress(emailMorador, nomeMorador);
             }

            MailMessage msg = new MailMessage(remetente, destinatario);
             
            msg.IsBodyHtml = true;
            msg.Body = mensagem;
            msg.Subject = "Sistema Spazio Campo Azuli Azuli";

            try
            {
                cliente.Send(msg);

            }
            catch (Exception e)
            {

                throw e;
            }
        }


    }
}