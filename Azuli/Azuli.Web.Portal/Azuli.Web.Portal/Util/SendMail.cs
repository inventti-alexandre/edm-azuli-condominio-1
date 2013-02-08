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

        public void enviaSenha(string mensagem, string proprietario, string emailProprietario)
        {
            string senhaDescriptografada = "";
            string emailMorador = emailProprietario;
            string nomeMorador = proprietario;
            SmtpClient cliente = new SmtpClient();
            Util descriptografaSenha = new Util();
            string emailRemetente = ConfigurationManager.AppSettings["emailRemetente"].ToString();
            string senhaCriptrografada = ConfigurationManager.AppSettings["pwd"].ToString();

            senhaDescriptografada = descriptografaSenha.SNH(senhaCriptrografada);


            NetworkCredential credencial = new NetworkCredential(emailRemetente, senhaDescriptografada);
            cliente.UseDefaultCredentials = false;
            cliente.Credentials = credencial;
            cliente.EnableSsl = true;

            cliente.DeliveryMethod = SmtpDeliveryMethod.Network;

            System.Web.Mail.MailMessage message =  new System.Web.Mail.MailMessage();

            MailAddress remetente = new MailAddress(emailRemetente, "Administrador Azuli");
            MailAddress destinatario = new MailAddress(emailMorador, nomeMorador);

            MailMessage msg = new MailMessage(remetente, destinatario);

            msg.IsBodyHtml = true;
            msg.Body = mensagem;
            msg.Subject = "Sua senha Azuli";

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