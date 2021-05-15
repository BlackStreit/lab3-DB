using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace лаб3_УД
{
    public partial class ProfCompany : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataKeyNames = new string[] { "id" };
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
            if (txbSal.Text.Equals(""))
            {
                lblError.Text = "Вы заполнили не все поля";
                return;
            }
            try
            {
                SqlDataSource1.Insert();
                GridView1.DataBind();
                txbSal.Text = "";
            }
            catch (SqlException ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            if (!Page.IsValid)
            {
                return;
            }
            txbSal.Text.Trim();
            if (txbSal.Text.Equals(""))
            {
                lblError.Text = "Вы заполнили не все поля";
                return;
            }
            try
            {
                SqlDataSource1.Update();
                GridView1.DataBind();
                txbSal.Text = "";
                Button7.Enabled = false;
                btnAdd.Enabled = true;
                cmdComp.Enabled = true;
                cmpProf.Enabled = true;
            }
            catch(SqlException ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblID.Text = GridView1.SelectedDataKey.Values["id"].ToString();
            txbSal.Text = GridView1.SelectedRow.Cells[9].Text;
            DropDownList1.SelectedValue = GridView1.SelectedRow.Cells[8].Text;
            DropDownList2.SelectedValue = GridView1.SelectedRow.Cells[10].Text;
            DropDownList3.SelectedValue = GridView1.SelectedRow.Cells[7].Text;
            Button7.Enabled = true;
            btnAdd.Enabled = false;
            cmdComp.Enabled = false;
            cmpProf.Enabled = false;
        }
    }
}