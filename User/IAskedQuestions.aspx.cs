using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_IAskedQuestions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void gvmain_SelectedIndexChanged(object sender, EventArgs e)
    {
        string s = gvmain.SelectedValue.ToString();

        //    SqlCommand cmd = new SqlCommand("select * from questions where qid=@qid", con);
        //    ViewState["gvid"] = gvmain.SelectedValue;
        //    cmd.Parameters.AddWithValue("@qid", gvmain.SelectedValue);
        //    con.Open();
        //    SqlDataReader dr = cmd.ExecuteReader();
        //    while (dr.Read())
        //    {
        //        txtquestion.Text = dr["question"].ToString();
        //        ddlcategory.Text = dr["cid"].ToString();
        //    }
        //    con.Close();
        Response.Redirect("Addanswers.aspx?id=" + s);

       

    }
}