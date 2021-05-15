using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace лаб3_УД
{
    public partial class Profession : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/scripts/jquery-1.7.2.min.js",

            });
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            if (!Page.IsValid)
            {
                return;
            }
            try
            {
                SqlDataSource1.Insert();
                GridView1.DataBind();
                txbName.Text = "";
                txbSalary.Text = "";
            }
            catch (SqlException ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblID.Text = GridView1.SelectedDataKey.Values["id"].ToString();
            txbName.Text = GridView1.SelectedRow.Cells[0].Text;
            txbSalary.Text = GridView1.SelectedRow.Cells[4].Text;
            cmbCur.SelectedValue = GridView1.SelectedRow.Cells[3].Text;
            cmbEdu.SelectedValue = GridView1.SelectedRow.Cells[2].Text;
            cmbInd.SelectedValue = GridView1.SelectedRow.Cells[1].Text;
            Button7.Enabled = true;
            btnAdd.Enabled = false;
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            if (!Page.IsValid)
            {
                return;
            }
            txbName.Text.Trim();
            txbSalary.Text.Trim();
            if(txbName.Text.Equals("") || txbSalary.Text.Equals(""))
            {
                lblError.Text = "Вы заполнили не все поля";
            }
            try
            {
                SqlDataSource1.Update();
                SqlDataSource1.DataBind();
                txbName.Text = "";
                txbSalary.Text = "";
                Button7.Enabled = false;
                btnAdd.Enabled = true;
            }
            catch(SqlException ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}