using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace Azuli.Web.Portal
{
    public partial class consultaCircular : System.Web.UI.Page
    {
        Util.Util oUtil = new Util.Util();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (oUtil.validateSession())
            {
                if (!IsPostBack)
                {
                    this.lbtMonth1.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(1).ToUpper();
                    this.lbtMonth2.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(2).ToUpper();
                    this.lbtMonth3.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(3).ToUpper();
                    this.lbtMonth4.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(4).ToUpper();
                    this.lbtMonth5.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(5).ToUpper();
                    this.lbtMonth6.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(6).ToUpper();
                    this.lbtMonth7.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(7).ToUpper();
                    this.lbtMonth8.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(8).ToUpper();
                    this.lbtMonth9.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(9).ToUpper();
                    this.lbtMonth10.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(10).ToUpper();
                    this.lbtMonth11.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(11).ToUpper();
                    this.lbtMonth12.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(12).ToUpper();
                    
                }
            }
            

        }

        protected void lbtMonth_Click(object sender, EventArgs e)
        {

        }

        protected void lbtMonth2_Click(object sender, EventArgs e)
        {

        }

        protected void lbtMonth3_Click(object sender, EventArgs e)
        {

        }

        protected void lbtMonth4_Click(object sender, EventArgs e)
        {

        }

        protected void lbtMonth5_Click(object sender, EventArgs e)
        {

        }

        protected void lbtMonth6_Click(object sender, EventArgs e)
        {

        }

        protected void lbtMonth7_Click(object sender, EventArgs e)
        {

        }
        protected void lbtMonth8_Click(object sender, EventArgs e)
        {

        }
        protected void lbtMonth9_Click(object sender, EventArgs e)
        {

        }
        protected void lbtMonth10_Click(object sender, EventArgs e)
        {

        }
        protected void lbtMonth11_Click(object sender, EventArgs e)
        {

        }
        protected void lbtMonth12_Click(object sender, EventArgs e)
        {

        }

    }
}