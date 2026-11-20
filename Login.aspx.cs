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
    public partial class Login : System.Web.UI.Page
    {
        emp_bl cs=new emp_bl();

        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        IDataAdapter da;

        int i;

        void startcon()
        {
            cs=new emp_bl();
            cs.getcon();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtunm.Text != null && txtpwd.Text != null)
            {
                con = new SqlConnection();
                con = cs.getcon();

                cmd = new SqlCommand("Select count(*) from emp_tbl where Email='" + txtunm.Text + "' AND Password='" + txtpwd.Text + "'", con);
                i = Convert.ToInt32(cmd.ExecuteScalar());

                if (i > 0)
                {
                    Session["unm"]=txtunm.Text;
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Username and Password')</script>");
                }
            }
        }
    }
}