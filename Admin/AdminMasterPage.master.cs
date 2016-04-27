using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_AdminMasterPage : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] != null)
        {
            SqlCommand cmd = new SqlCommand("select rollid from login where username=@username", con);
            cmd.Parameters.AddWithValue("@username", Session["uname"].ToString());
            con.Open();
            string Role = cmd.ExecuteScalar().ToString();
            con.Close();

            if (Role == "1")
            {
                Lblloguser.Text = Session["uname"].ToString();
                //Response.Write("Welcome " + Session["uname"].ToString());
            }
            else
            {
                Response.Redirect("../Redirect.aspx");
            }

        }
        else
        {
            Response.Redirect("~/Common/Login.aspx");
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/Common/Login.aspx");
    }
}

 

