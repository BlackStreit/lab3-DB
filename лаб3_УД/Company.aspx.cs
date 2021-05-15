using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace лаб3_УД
{
    public partial class Company : System.Web.UI.Page
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
            txbSite.Text.Trim();
            txbPhone.Text.Trim();
            txbName.Text.Trim();
            txbMail.Text.Trim();
            if (txbMail.Text.Equals("") || txbName.Text.Equals("") || txbPhone.Text.Equals("") 
                || txbSite.Text.Equals(""))
            {
                lblError.Text = "Вы заполнили не все поля";
                return;
            }
            try
            {
                SqlDataSource1.Insert();
                GridView1.DataBind();
                txbMail.Text = "";
                txbName.Text = "";
                txbPhone.Text = "";
                txbSite.Text = "";
            }
            catch (SqlException ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblId.Text = GridView1.SelectedDataKey.Values["idCompany"].ToString();
            txbName.Text = GridView1.SelectedRow.Cells[0].Text;
            txbMail.Text = GridView1.SelectedRow.Cells[1].Text;
            txbPhone.Text = GridView1.SelectedRow.Cells[2].Text;
            txbSite.Text = GridView1.SelectedRow.Cells[3].Text;
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
            txbSite.Text.Trim();
            txbPhone.Text.Trim();
            txbName.Text.Trim();
            txbMail.Text.Trim();
            if (txbMail.Text.Equals("") || txbName.Text.Equals("") || txbPhone.Text.Equals("")
                || txbSite.Text.Equals(""))
            {
                lblError.Text = "Вы заполнили не все поля";
                return;
            }
            try
            {
                SqlDataSource1.Update();
                txbMail.Text = "";
                txbName.Text = "";
                txbPhone.Text = "";
                txbSite.Text = "";
                Button7.Enabled = false;
                GridView1.DataBind();
                btnAdd.Enabled = true;
            }
            catch(SqlException ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}