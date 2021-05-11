<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="лаб3_УД.Company" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style9 {
            width: 207px;
        }
        .auto-style11 {
            width: 133px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" PostBackUrl="~/Default.aspx" Text="Люди" />
            <asp:Button ID="Button2" runat="server" PostBackUrl="~/Profession.aspx" Text="Профессии" />
            <asp:Button ID="Button3" runat="server" PostBackUrl="~/EmployeeProf.aspx" Text="Работники" />
            <asp:Button ID="Button4" runat="server" PostBackUrl="~/ProfCompany.aspx" Text="Работа" />
            <asp:Button ID="Button5" runat="server" PostBackUrl="~/Search1.aspx" Text="Поиск 1" />
            <asp:Button ID="Button6" runat="server" PostBackUrl="~/Search2.aspx" Text="Поиск 2" /></div>
        <div>
            <table style="width: 100%;" border ="2">
                <tr>
                    <td colspan ="3" >
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idCompany" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="CompanyName" HeaderText="Название" SortExpression="CompanyName" />
                                <asp:BoundField DataField="CompanyEmail" HeaderText="Почта" SortExpression="CompanyEmail" />
                                <asp:BoundField DataField="CompanyPhone" HeaderText="Телефон" SortExpression="CompanyPhone" />
                                <asp:BoundField DataField="CompanySite" HeaderText="Сайт" SortExpression="CompanySite" />
                                <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:employeesConnectionString %>" DeleteCommand="DeleteCompany" DeleteCommandType="StoredProcedure" InsertCommand="AddCompany" InsertCommandType="StoredProcedure" SelectCommand="GetCompany" SelectCommandType="StoredProcedure" UpdateCommand="UpdateCompany" UpdateCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:Parameter Name="idCompany" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txbMail" Name="CompanyEmail" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txbName" Name="CompanyName" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txbPhone" Name="CompanyPhone" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txbSite" Name="CompanySite" PropertyName="Text" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="lblId" Name="idCompany" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="txbMail" Name="CompanyEmail" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txbName" Name="CompanyName" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txbPhone" Name="CompanyPhone" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txbSite" Name="CompanySite" PropertyName="Text" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">Название</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txbName" runat="server" Width="197px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">Почта</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txbMail" runat="server" Width="197px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblId" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">Телефон</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txbPhone" runat="server" Width="193px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button7" runat="server" Enabled="False" OnClick="Button7_Click" Text="Обновить" Width="80px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">Сайт</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txbSite" runat="server" Width="195px"></asp:TextBox>
                    </td>
                    <td>
                        
                        <asp:Button ID="btnAdd" runat="server" Text="Добавить" OnClick="btnAdd_Click" Height="25px" />
                        
                    </td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
