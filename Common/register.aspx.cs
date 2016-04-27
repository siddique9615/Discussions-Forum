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
        Panel1.Visible = false;

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string filename = FileUpload1.PostedFile.FileName;
        int filelength = FileUpload1.PostedFile.ContentLength;
        byte[] imagebytes = new byte[filelength];
        FileUpload1.PostedFile.InputStream.Read(imagebytes, 0, filelength);

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
        SqlCommand cmd = new SqlCommand("insert into login(profilename,username,profilepic,email,password,cnfmpassword,gid,contactno,address,rollid,createdon) values(@profilename,@username,@profilepic,@email,@password,@cnfmpassword,@gid,@contactno,@address,@rollid,@createdon) ", con);
        cmd.Parameters.AddWithValue("@profilename", txtprofilename.Text);
        cmd.Parameters.AddWithValue("@username", txtusername.Text);
        cmd.Parameters.AddWithValue("@profilepic", imagebytes);
        cmd.Parameters.AddWithValue("@email", txtemail.Text);
        cmd.Parameters.AddWithValue("@password", txtpassword.Text);
        cmd.Parameters.AddWithValue("@cnfmpassword", txtcnfmpassword.Text);
        cmd.Parameters.AddWithValue("@gid", rblgender.SelectedValue);
        cmd.Parameters.AddWithValue("@contactno", txtcontactno.Text);
        cmd.Parameters.AddWithValue("@address", txtaddress.Text);
        cmd.Parameters.AddWithValue("@rollid", 2);
        cmd.Parameters.AddWithValue("@createdon", DateTime.Now);
        cmd.Parameters.AddWithValue("@isactive", cbisactive.Checked);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        LoadGrid();
        clear();
    }

    private void clear()
    {
        txtprofilename.Text = "";
        txtusername.Text = "";
        txtemail.Text = "";
        txtpassword.Text = "";
        txtcnfmpassword.Text = "";

        txtcontactno.Text = "";
        txtaddress.Text = "";

        cbisactive.Checked = false;

    }

    private void LoadGrid()
    {
        SqlCommand cmd = new SqlCommand("select * from login", con);
        con.Open();
        gvmain.DataBind();
        con.Close();
    }





    protected void btnlogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");

    }
   
}