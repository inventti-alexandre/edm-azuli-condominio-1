using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Text;

namespace Azuli.Web.Portal
{
    public class Global : System.Web.HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup

        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            StringBuilder corpoEmail = new StringBuilder();
            Exception ex = Server.GetLastError().GetBaseException();
            if (ex.GetType() != typeof(HttpException))
            {
                Util.SendMail logError = new Util.SendMail();

                string paginaAtual = Request.CurrentExecutionFilePath;

                corpoEmail.Append("<html>");
				corpoEmail.Append("<head>");
				corpoEmail.Append("<style type='text/css'>");
				corpoEmail.Append("	A{text-decoration:none;}");
				corpoEmail.Append("	A.linkbranco{text-decoration:none;color:white}");
				corpoEmail.Append("	A.ind:hover{text-decoration:underline}");
				corpoEmail.Append("	.preto{font-family:tahoma,sans-serif;font-size:12px;color:#000000;}");
				corpoEmail.Append("	.pretog	{font-family:tahoma,sans-serif;font-size:13px;color:#000000;}");
				corpoEmail.Append(".sbd		{font-family:tahoma,sans-serif;font-size:11px;color:blue;line-height: 11px}");
				corpoEmail.Append("</style>");
				corpoEmail.Append("</head>");
				corpoEmail.Append("<body bgcolor='#FFFFFF' leftmargin=5 topmargin=5>");
				corpoEmail.Append("<table border='0' cellspacing='0' cellpadding='5' width='610'>");
				corpoEmail.Append("<tr>");
				corpoEmail.Append("	<td valign='top'>--------------------------------------------</td>");
				corpoEmail.Append("</tr>");
				corpoEmail.Append("<tr><td valign=top><font class='sbd'>IP, " + Request.UserHostAddress.ToString() + " Página - "  + paginaAtual.Remove(0,paginaAtual.LastIndexOf("/") + 1)

+ "!</td></tr>");
				corpoEmail.Append("<tr><td valign=top><font class='sbd'>Detalhes do Erro - " + ex.Message.ToString() + " :</td>");
				corpoEmail.Append("<tr><td valign=top><font class='sbd'>Apartamento: <b>"+ System.Web.HttpContext.Current.Session["AP"] +"</b></td>");
				corpoEmail.Append("<tr><td valign=top><font class='sbd'>Bloco: <b>" + System.Web.HttpContext.Current.Session["Bloco"] +"</b></td>");
				corpoEmail.Append("<tr><td valign=top><font class='sbd'>Data:" + DateTime.Now + "</td></tr>");
				corpoEmail.Append("<tr><td valign=top><font class='sbd'>Spazio Azuli</td></tr>");
				corpoEmail.Append("<tr>");
				corpoEmail.Append("	<td valign='top'>---------------------------------------------</td>");
				corpoEmail.Append("</tr>");
				corpoEmail.Append("</table>");
				corpoEmail.Append("<a href='http://www.condominioazuli.somee.com/'>http://www.condominioazuli.somee.com/ </a> ");
				corpoEmail.Append("</body>");
				corpoEmail.Append("</html>");


                

                logError.enviaSenha(corpoEmail.ToString() ,"Log Error:", "Sistema", 1);

                Server.Transfer("ErrorPage.aspx");
            }

        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started

        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.

        }

    }
}
