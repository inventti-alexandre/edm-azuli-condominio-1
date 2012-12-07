using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Azuli.Web.Portal
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected override void OnLoad(EventArgs e)
        {

           string id = ConfigurationManager.AppSettings["GoogleAnalyticsId"];

            if (!string.IsNullOrEmpty(id))
            {
                string script = "";

                script += "<script type=\"text/javascript\">";

                script += "var _gaq = _gaq || [];";
                script += "_gaq.push(['_setAccount', '" + id + "']);";
                script += "_gaq.push(['_trackPageview']);";

                script += "(function() {";
                script += "  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;";
                script += "  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';";
                script += "  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);";
                script += "})();";

                script += "</script>";



             


                //ScriptManager.RegisterStartupScript(this, this.GetType(), "MessageAlert",
                //  "<script language=\"JavaScript\">" + Environment.NewLine +
                //  "alert(\'" + "TEST" + "\');" + Environment.NewLine +
                //  "</script>", false);


                ScriptManager.RegisterStartupScript(this, this.GetType(), "MessageAlert", script, false);

            }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}
