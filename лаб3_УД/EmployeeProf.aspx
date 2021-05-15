<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeProf.aspx.cs" Inherits="лаб3_УД.EmployeeProf" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 45px;
        }
        .auto-style4 {
            width: 45px;
            height: 27px;
        }
        .auto-style6 {
            height: 27px;
        }
        .auto-style7 {
            width: 93px;
        }
        .auto-style8 {
            height: 27px;
            width: 93px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" PostBackUrl="~/Default.aspx" Text="Люди" />
            <asp:Button ID="Button2" runat="server" PostBackUrl="~/Profession.aspx" Text="Профессии" />
            <asp:Button ID="Button3" runat="server" PostBackUrl="~/Company.aspx" Text="Компании" />
            <asp:Button ID="Button4" runat="server" PostBackUrl="~/ProfCompany.aspx" Text="Работа" />
            <asp:Button ID="Button5" runat="server" PostBackUrl="~/Search1.aspx" Text="Поиск 1" />
            <asp:Button ID="Button6" runat="server" PostBackUrl="~/Search2.aspx" Text="Поиск 2" /></div>
        <div>
            <table style="width: 100%;" >
                <tr>
                    <td colspan ="3" >
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id,Emlpoye_id,Profession_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="Emlpoye_id" HeaderText="Паспорт" SortExpression="Emlpoye_id" ReadOnly="True" />
                                <asp:BoundField DataField="first_name" HeaderText="Имя" SortExpression="first_name" />
                                <asp:BoundField DataField="second_name" HeaderText="Отчетсво" SortExpression="second_name" />
                                <asp:BoundField DataField="last_name" HeaderText="Фамилия" SortExpression="last_name" />
                                <asp:BoundField DataField="education" HeaderText="Образование" SortExpression="education" />
                                <asp:BoundField DataField="region" HeaderText="Регион" SortExpression="region" />
                                <asp:BoundField DataField="JobName" HeaderText="Нзвание профессии" SortExpression="JobName" />
                                <asp:BoundField DataField="Industry" HeaderText="Индустрия" SortExpression="Industry" />
                                <asp:BoundField DataField="Profession_id" HeaderText="Номер профессии" ReadOnly="True" SortExpression="Profession_id" Visible="False" />
                                <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:employeesConnectionString %>" DeleteCommand="DeleteEmployeeProf" DeleteCommandType="StoredProcedure" InsertCommand="AddEmployeeProf" InsertCommandType="StoredProcedure" SelectCommand="GetEmployeeProf" SelectCommandType="StoredProcedure" UpdateCommand="UpdateEmployeeProf" UpdateCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="cmbEmployee" Name="Employee_id" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="cmbProf" Name="id" PropertyName="SelectedValue" Type="Int32" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="lblID" Name="id" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="cmbProf" Name="Profession_id" PropertyName="SelectedValue" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Работник</td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="cmbEmployee" runat="server" DataSourceID="SqlDataSource3" DataTextField="id" DataValueField="id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:employeesConnectionString %>" SelectCommand="GetEmployee" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Профессия</td>
                    <td class="auto-style8">
                        <asp:DropDownList ID="cmbProf" runat="server" DataSourceID="SqlDataSource2" DataTextField="JobName" DataValueField="id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:employeesConnectionString %>" SelectCommand="GetProfession" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style6">
                        <asp:Button ID="Button7" runat="server" Enabled="False" OnClick="Button7_Click" Text="Обновить" Width="81px" />
                        
                        <asp:Button ID="btnAdd" runat="server" Text="Добавить" OnClick="btnAdd_Click" Height="25px" />
                        
                        <asp:Label ID="lblID" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
