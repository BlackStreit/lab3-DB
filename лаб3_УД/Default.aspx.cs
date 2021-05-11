using System;
using System.Data.Common;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace лаб3_УД
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            try
            {
                SqlDataSource1.Insert();
                GridView1.DataBind();
                tbxLName.Text = "";
                tbxName.Text = "";
                tbxPass.Text = "";
                tbxSName.Text = "";
            }
            catch(SqlException ex)
            {
                lblError.Text = ex.Message;
            }
        }
        protected void SqlDataSource1_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            lblError.Text = "";
            try
            {
                DbParameter[] deleteParam = new DbParameter[6]{
                e.Command.Parameters["@id"],
                e.Command.Parameters["@first_name"],
                e.Command.Parameters["@second_name"],
                e.Command.Parameters["@last_name"],
                e.Command.Parameters["@education"],
                e.Command.Parameters["@region"]
                };

                //string str = "";
                //for (int i = 0; i < deleteParam.Length; i++)
                //{
                //    str += deleteParam[i].Value + "\n";
                //}
                deleteParam[0].ParameterName = "@id";
                deleteParam[1].ParameterName = "@first_name";
                deleteParam[2].ParameterName = "@second_name";
                deleteParam[3].ParameterName = "@last_name";
                deleteParam[4].ParameterName = "@education";
                deleteParam[5].ParameterName = "@region";

                e.Command.Parameters.Clear();
                for (int i = 0; i < deleteParam.Length; i++)
                    e.Command.Parameters.Add(deleteParam[i]);
            }
            catch(SqlException ex)
            {
                lblError.Text = ex.Message;
            }
            catch(Exception ex)
            {

            }
        }

        protected void SqlDataSource1_Deleting(object sender, SqlDataSourceCommandEventArgs e)
        {
            lblError.Text = "";
            try
            {
                DbParameter[] param = new DbParameter[1]{
                e.Command.Parameters["@id"],
                };

                param[0].ParameterName = "@id";

                e.Command.Parameters.Clear();
                for (int i = 0; i < param.Length; i++)
                    e.Command.Parameters.Add(param[i]);
            }
            catch (SqlException ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void SqlDataSource1_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            DbParameter[] deleteParam = new DbParameter[6]{
                e.Command.Parameters["@id"],
                e.Command.Parameters["@first_name"],
                e.Command.Parameters["@second_name"],
                e.Command.Parameters["@last_name"],
                e.Command.Parameters["@education"],
                e.Command.Parameters["@region"]
            };

            deleteParam[0].ParameterName = "@id";
            deleteParam[1].ParameterName = "@first_name";
            deleteParam[2].ParameterName = "@second_name";
            deleteParam[3].ParameterName = "@last_name";
            deleteParam[4].ParameterName = "@education";
            deleteParam[5].ParameterName = "@region";

            e.Command.Parameters.Clear();
            for (int i = 0; i < deleteParam.Length; i++)
                e.Command.Parameters.Add(deleteParam[i]);
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            tbxLName.Text.Trim();
            tbxName.Text.Trim(); 
            tbxPass.Text.Trim();
            tbxSName.Text.Trim();
            if(tbxLName.Text.Equals("") || tbxName.Text.Equals("") || tbxPass.Text.Equals("")
                || tbxSName.Text.Equals(""))
            {
                lblError.Text = "Вы заполнили не все поля";
                return;
            }
            try
            {
                Button7.Enabled = false;
                btnAdd.Enabled = true;
                tbxPass.Enabled = true;
                SqlDataSource1.Update();
                GridView1.DataBind();
                tbxLName.Text = "";
                tbxName.Text = "";
                tbxPass.Text = "";
                tbxSName.Text = "";
            }
            catch(SqlException ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            tbxPass.Enabled = false;
            Button7.Enabled = true;
            btnAdd.Enabled = false;
            tbxPass.Text = GridView1.SelectedRow.Cells[0].Text;
            tbxName.Text = GridView1.SelectedRow.Cells[1].Text;
            tbxSName.Text = GridView1.SelectedRow.Cells[2].Text;
            tbxLName.Text = GridView1.SelectedRow.Cells[3].Text;
            cmbEdu.SelectedValue = GridView1.SelectedRow.Cells[4].Text;
            cmbReg.SelectedValue = GridView1.SelectedRow.Cells[5].Text;
        }
    }
}