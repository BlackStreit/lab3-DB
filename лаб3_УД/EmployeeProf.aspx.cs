using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace лаб3_УД
{
    public partial class EmployeeProf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataKeyNames = new string[] {"id"};
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            try
            {
                SqlDataSource1.Insert();
                GridView1.DataBind();
            }
            catch (SqlException ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource1.Update();
                GridView1.DataBind();
                btnAdd.Enabled = false;
                Button7.Enabled = true;
                cmbEmployee.Enabled = true;
            }
            catch(SqlException ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblID.Text = GridView1.SelectedDataKey.Values["id"].ToString();
            cmbEmployee.SelectedValue = GridView1.SelectedRow.Cells[0].Text;
            cmbProf.SelectedValue = GridView1.SelectedRow.Cells[8].Text;
            btnAdd.Enabled = false;
            Button7.Enabled = true;
            cmbEmployee.Enabled = false;
        }

    }
}