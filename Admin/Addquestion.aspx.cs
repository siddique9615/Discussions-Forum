using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_question : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        Panel1.Visible = false;

    }
    protected void btnaddquestion_Click(object sender, EventArgs e)
    {

        SqlCommand cmd = new SqlCommand("insert into questions(question,cid,postedby,postedon) values(@question,@cid,@postedby,@postedon)", con);
        cmd.Parameters.AddWithValue("@question", txtquestion.Text);
        cmd.Parameters.AddWithValue("@cid", ddlcategory.SelectedValue);
        cmd.Parameters.AddWithValue("@postedby", Session["lid"].ToString());
        cmd.Parameters.AddWithValue("@postedon",DateTime.Now );

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        LoadGrid();
        clear();

    }


  ////  protected void btnupdate_Click(object sender, EventArgs e)
  //  {
  //      int vid = int.Parse(ViewState["gvid"].ToString());
  //      SqlCommand cmd = new SqlCommand("update questions set question=@question,cid=@cid,postedby=@postedby,postedon=@postedon where qid=@vid ", con);
  //      cmd.Parameters.AddWithValue("@vid", vid);
  //      cmd.Parameters.AddWithValue("@question", txtquestion.Text);
  //      cmd.Parameters.AddWithValue("@cid", ddlcategory.SelectedValue);
  //      cmd.Parameters.AddWithValue("@postedby", Session["lid"].ToString());
  //      cmd.Parameters.AddWithValue("@postedon", DateTime.Now);

  //      con.Open();
  //      cmd.ExecuteNonQuery();
  //      con.Close();
  //      LoadGrid();
  //      clear();

  //  }

    private void clear()
    {
        txtquestion.Text = "";
        ddlcategory.Text = "";
    
    }
    private void LoadGrid()
    {

        SqlCommand cmd = new SqlCommand("select * from questions where postedby=@lid ", con);
        cmd.Parameters.AddWithValue("@lid", Session["lid"]);

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        gvmain.DataBind();
        con.Close();
    }
    protected void gvmain_SelectedIndexChanged(object sender, EventArgs e)
    {
       // string s = gvmain.SelectedValue.ToString() ;
       //// btnupdate.Visible = true;
       // //SqlCommand cmd = new SqlCommand("select * from questions where qid=@qid", con);
       // //ViewState["gvid"] = gvmain.SelectedValue;
       // //cmd.Parameters.AddWithValue("@qid", gvmain.SelectedValue);
       // //con.Open();
       // //SqlDataReader dr = cmd.ExecuteReader();
       // //while (dr.Read())
       // //{
       // //    txtquestion.Text = dr["question"].ToString();
       // //    ddlcategory.Text = dr["cid"].ToString();
       // //}
       // //con.Close();
       // Response.Redirect("Addanswers.aspx?id=" +s);


    }
}


  
