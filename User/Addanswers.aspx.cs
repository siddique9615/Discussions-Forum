using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_Default : System.Web.UI.Page
{
    SqlConnection con=new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        
        string sid = Request.QueryString["id"].ToString();
        ViewState["vid"] = Request.QueryString["id"].ToString();

        SqlCommand cmd = new SqlCommand("select *  from questions where qid=@qid", con);
        cmd.Parameters.AddWithValue("@qid", sid);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            txtquestion.Text = dr["question"].ToString();
        }
        con.Close();
        Panel1.Visible = false;


    }
    private void clear()
    {
        txtanswer.Text = "";
        txtquestion.Text = "";

    }
    //protected void btnupdate_Click(object sender, EventArgs e)
    //{
    //    int vid = int.Parse(ViewState["gvid"].ToString());
        

    //    SqlCommand cmd = new SqlCommand("update answers set answer=@answer,question=@question,answeredby=@answeredby,answeredon=@answeredon where aid=@vid ", con);
    //    cmd.Parameters.AddWithValue("@vid", vid);
    //    cmd.Parameters.AddWithValue("@answer", txtanswer.Text);
    //    cmd.Parameters.AddWithValue("@question", txtquestion.Text);
    //    cmd.Parameters.AddWithValue("@answeredby", Session["lid"].ToString());
    //    cmd.Parameters.AddWithValue("@answeredon", DateTime.Now);
   
    //    con.Open();
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //    LoadGrid();
    //    clear();
    //}

    protected void btnadd_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("insert into answers(qid,answer,answeredby,answeredon) values(@qid,@answer,@answeredby,@answeredon)", con);
        cmd.Parameters.AddWithValue("@answer", txtanswer.Text);
        cmd.Parameters.AddWithValue("@qid", ViewState["vid"]);
        cmd.Parameters.AddWithValue("@answeredby", Session["lid"].ToString());
        cmd.Parameters.AddWithValue("@answeredon", DateTime.Now);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        LoadGrid();
        clear();
    }

    private void LoadGrid()
    {
        SqlCommand cmd = new SqlCommand("select * from answers where answeredby=@lid ", con);
        cmd.Parameters.AddWithValue("@lid", Session["lid"]);

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        gvmain.DataBind();
        con.Close();
    }

    protected void gvmain_SelectedIndexChanged(object sender, EventArgs e)
    {
        //SqlCommand cmd = new SqlCommand("select * from answers where aid=@aid", con);
        //ViewState["gvid"] = gvmain.SelectedValue;
        //cmd.Parameters.AddWithValue("@aid", gvmain.SelectedValue);
        //con.Open();
        //SqlDataReader dr = cmd.ExecuteReader();
        //while (dr.Read())
        //{
        //    txtanswer.Text = dr["answer"].ToString();
        //    txtquestion.Text = dr["question"].ToString();
        //}
        //con.Close();
    }

}