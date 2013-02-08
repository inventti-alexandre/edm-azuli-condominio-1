using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;
using System.Text;

namespace Azuli.Web.Portal.Util
{
    public class SendMail
    {
        public void enviaSenha(string mensagem)
        {
            SmtpClient cliente = new SmtpClient("smtp.live.com", 587);


            NetworkCredential credencial = new NetworkCredential("edmls2008@hotmail.com", "18120118");
            cliente.UseDefaultCredentials = false;
            cliente.Credentials = credencial;
            cliente.EnableSsl = true;

            cliente.DeliveryMethod = SmtpDeliveryMethod.Network;

            System.Web.Mail.MailMessage message =  new System.Web.Mail.MailMessage();

            MailAddress remetente = new MailAddress("edmls2008@hotmail.com", "Administrador Azuli");
            MailAddress destinatario = new MailAddress("edmls2008@gmail.com", "Morador");

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