using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Common_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        string uname, pwd;
        uname = txtusername.Text;
        pwd = txtpassword.Text;

        SqlCommand cmd = new SqlCommand("Select count(*) from login where username=@username", con);
        cmd.Parameters.AddWithValue("@username", uname);
        con.Open();
        int count = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();


        if (count > 0)
        {
            SqlCommand cmd1 = new SqlCommand("select password from login where  username=@username ", con);
            //cmd1.Parameters.AddWithValue("@password", pwd);
            cmd1.Parameters.AddWithValue("@username", uname);
            con.Open();

            string password = cmd1.ExecuteScalar().ToString();
            con.Close();
            if (password == pwd)
            {
                string lid;
                SqlCommand cmd2 = new SqlCommand("select lid from login where username=@uname", con);
                cmd2.Parameters.AddWithValue("@uname", uname);
                con.Open();
                lid = cmd2.ExecuteScalar().ToString();
                con.Close();
                Session["lid"] = lid;
                Session["uname"] = uname;
                Response.Redirect("../redirect.aspx");

            }
            else
            {
                Response.Write("Invalid Username and Password");
            }
        }
        else
        {
            Response.Write("Invalid UserName");
        }
    }
    protected void btnregister_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Common/register.aspx");

    }
}