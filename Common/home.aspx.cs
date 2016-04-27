using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Common_MainPage : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
       

      


    }



    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

        string s = gvmain1.SelectedValue.ToString();
        
        Response.Redirect("~/User/Addanswers.aspx?id=" + s);
    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("../redirect.aspx");

    }
}
