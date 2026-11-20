using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace _3T_Employee
{
    public partial class Dashboard : System.Web.UI.Page
    {
        emp_bl cs = new emp_bl();

        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        IDataAdapter da;

        int i;
        void startcon()
        {
            cs = new emp_bl();
            cs.getcon();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();

            if (Session["unm"]==null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                con = new SqlConnection();
                con = cs.getcon();

                da = new SqlDataAdapter("Select Name From emp_tbl where Email='" + Session["unm"] + "'", con);
                ds=new DataSet();
                da.Fill(ds);
                Label1.Text = ds.Tables[0].Rows[0]["Name"].ToString();
            }
        }
    }
}