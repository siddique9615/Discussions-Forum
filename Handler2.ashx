<%@ WebHandler Language="C#" Class="Handler2" %>

using System;
using System.Web;

public class Handler2 : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        if (context.Request.QueryString["lid"] == null) return;
        string connstr = System.Configuration.ConfigurationManager.ConnectionStrings["mycon"].ToString();
        string lid = context.Request.QueryString["lid"];
        using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(connstr))
        {
            using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("select profilepic from login where lid=@lid", con))
            {
                cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@lid", lid));
                con.Open();
                using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
                {
                    reader.Read();
                    context.Response.BinaryWrite((Byte[])reader[reader.GetOrdinal("profilepic")]);
                    reader.Close();
                }

            }
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}