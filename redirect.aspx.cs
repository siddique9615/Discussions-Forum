using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class redirect : System.Web.UI.Page
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

            if (Role != null)
            {
                if (Role == "1" )
                     Response.Redirect("~/Admin/Addquestion.aspx");
                else if (Role == "2")
                    Response.Redirect("~/Common/home.aspx");
            }
            else
            {
                Response.Write("Role Not Yet Assigned.. !");
            }

        }
        else
        {
            Response.Redirect("~/Common/Login.aspx");
        }

    }
}