using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_category : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }


    private void clear()
    {
        txtinsert.Text = "";
       

    }
    protected void btninsert_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("insert into categories(category) values(@category)", con);
        cmd.Parameters.AddWithValue("@category", txtinsert.Text);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        clear();
    }
}