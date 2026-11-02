using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;


namespace _3T_Employee
{
    public partial class Registration : System.Web.UI.Page
    {
        //emp_bl emp = new emp_bl();
       
       

        emp_bl emp;
        string path, fnm;
        DataSet ds;


        void startcon()
        {
            emp = new emp_bl();
            emp.getcon();
        }

        void fillgrid()
        {
            startcon();
            GridView1.DataSource = emp.select();
            GridView1.DataBind();
        }

        void imageupload()
        {
            path = Path.GetExtension(flpimg.FileName);

            if (path == ".png" || path == ".jpg")
            {
                fnm = "Images/" + flpimg.FileName;
                flpimg.SaveAs(Server.MapPath(fnm));
            }
            else
            {
                Response.Write("Please select .png or .jpg file");
            }
        }
        void clear()
        {
            txtnm.Text = "";
            txteml.Text = "";
            txtmbl.Text = "";
            drpct.SelectedIndex = 0;
            rdbmale.Checked = false;
            rdbfmale.Checked = false;
        }

        //Paring

        void filltext()
        {
            startcon();
            ds = emp.selectbyID(Convert.ToInt32(ViewState["Id"]));
            //It will return DS
            //Paring

            txtnm.Text = ds.Tables[0].Rows[0]["Name"].ToString();
            txteml.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            drpct.SelectedValue = ds.Tables[0].Rows[0]["City"].ToString();
            txtmbl.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();

            string gender = ds.Tables[0].Rows[0]["Gender"].ToString();

            if (gender == "Male")
            {
                rdbmale.Checked = true;
            }
            else
            {
                rdbfmale.Checked = true;
            }
        }


        // Save button clicked
        protected void btnreg_Click(object sender, EventArgs e)
        {

            string gender = "";

            if (rdbmale.Checked == true)
            {
                gender = "Male";
            }
            else if (rdbfmale.Checked == true)
            {
                gender = "Female";
            }

            if (btnreg.Text == "Save Registration")
            {
                imageupload();
                emp = new emp_bl();
                emp.getcon();
                emp.insert(txtnm.Text, txteml.Text, gender, drpct.SelectedValue, txtmbl.Text, fnm);
                clear();
                fillgrid();
            }
            else
            {
                startcon();
                emp.update(Convert.ToInt32(ViewState["Id"]), txtnm.Text, txteml.Text, gender, drpct.SelectedValue, txtmbl.Text);
                clear();
                fillgrid();
                btnreg.Text = "Save";

                //Update code
            }
            

        }




        // GridView row command (Edit / Delete)
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["Id"] = id;
                btnreg.Text = "Update";
                filltext();
            }
            else
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["Id"] = id;
                startcon();
                emp.delete(Convert.ToInt16(ViewState["Id"]));
                fillgrid();

                //Delete code
            }
           

        }
    }
}
