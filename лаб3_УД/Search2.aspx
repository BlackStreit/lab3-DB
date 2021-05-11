<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search2.aspx.cs" Inherits="лаб3_УД.Search2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 29px;
        }
        .auto-style4 {
            height: 29px;
            width: 165px;
        }
        .auto-style5 {
            height: 29px;
            width: 102px;
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
            <asp:Button ID="Button6" runat="server" PostBackUrl="~/EmployeeProf.aspx" Text="Работники" /></div>
        <div>
        <div>
            <table style="width: 100%;">
                <tr>
                    <td colspan ="3" >
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="id,Profession_id,Company_idCompany,id1,id2,Emlpoye_id,Profession_id1,idCompany">
                            <Columns>
                                <asp:BoundField DataField="CompanyEmail" HeaderText="CompanyEmail" SortExpression="CompanyEmail" />
                                <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
                                <asp:BoundField DataField="CompanyPhone" HeaderText="CompanyPhone" SortExpression="CompanyPhone" />
                                <asp:BoundField DataField="CompanySite" HeaderText="CompanySite" SortExpression="CompanySite" />
<asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:employeesConnectionString %>" SelectCommand="Search2" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="TextBox1" Name="count" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="cmpProf" Name="idProf" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Профессия</td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="cmpProf" runat="server" DataSourceID="SqlDataSource4" DataTextField="JobName" DataValueField="id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:employeesConnectionString %>" SelectCommand="GetProfession" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:employeesConnectionString %>" SelectCommand="GetCompany" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style1">
                        
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox1" runat="server" Width="149px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        
                        <asp:Button ID="btnAdd" runat="server" Text="Найти" OnClick="btnAdd_Click" Height="25px" />
                        
                    </td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
