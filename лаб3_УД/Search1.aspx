<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search1.aspx.cs" Inherits="лаб3_УД.Search1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 35px;
        }
        .auto-style3 {
            width: 9px;
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
        <div>
            <table style="width: 100%;">
                <tr>
                    <td colspan ="3" >
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                            <Columns>
<asp:BoundField DataField="id" HeaderText="Паспорт" SortExpression="id"></asp:BoundField>
                                <asp:BoundField DataField="first_name" HeaderText="Имя" SortExpression="first_name" />
                                <asp:BoundField DataField="second_name" HeaderText="Отчество" SortExpression="second_name" />
                                <asp:BoundField DataField="last_name" HeaderText="Фамилия" SortExpression="last_name" />
                                <asp:BoundField DataField="education" HeaderText="Образование" SortExpression="education" />
                                <asp:BoundField DataField="region" HeaderText="Регион" SortExpression="region" />
                                <asp:BoundField DataField="JobName" HeaderText="Название профессии" SortExpression="JobName" />
                                <asp:BoundField DataField="Industry" HeaderText="Направление" SortExpression="Industry" />
                                <asp:BoundField DataField="Currency" HeaderText="Валюта" SortExpression="Currency" />
                                <asp:BoundField DataField="CompanyName" HeaderText="Название Компании" SortExpression="CompanyName" />
                                <asp:BoundField DataField="CompanyPhone" HeaderText="Телефон" SortExpression="CompanyPhone" />
                                <asp:BoundField DataField="CompanySite" HeaderText="Сайт" SortExpression="CompanySite" />
                                <asp:BoundField DataField="CompanyEmail" HeaderText="Почта" SortExpression="CompanyEmail" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:employeesConnectionString %>" SelectCommand="SearchFromProf" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cmpProf" Name="idProf" PropertyName="SelectedValue" Type="Int32" DefaultValue="2003" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:employeesConnectionString %>" SelectCommand="SELECT * FROM [Profession]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Компания</td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="cmpProf" runat="server" DataSourceID="SqlDataSource2" DataTextField="JobName" DataValueField="id">
                        </asp:DropDownList>
                    </td>
                    <td>
                        
                        <asp:Button ID="btnAdd" runat="server" Text="Найти" OnClick="btnAdd_Click" Height="25px" />
                        
                    </td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
