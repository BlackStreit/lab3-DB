<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfCompany.aspx.cs" Inherits="лаб3_УД.ProfCompany" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 2px;
        }
        .auto-style2 {
            width: 11px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" PostBackUrl="~/Default.aspx" Text="Люди" />
            <asp:Button ID="Button2" runat="server" PostBackUrl="~/Profession.aspx" Text="Профессии" />
            <asp:Button ID="Button3" runat="server" PostBackUrl="~/Company.aspx" Text="Компании" />
            <asp:Button ID="Button4" runat="server" PostBackUrl="~/EmployeeProf.aspx" Text="Работники" />
            <asp:Button ID="Button5" runat="server" PostBackUrl="~/Search1.aspx" Text="Поиск 1" />
            <asp:Button ID="Button6" runat="server" PostBackUrl="~/Search2.aspx" Text="Поиск 2" /></div>
        <div>
            <table style="width: 100%;">
                <tr>
                    <td colspan ="3" >
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id,Company_idCompany,Profession_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
<asp:BoundField DataField="CompanyName" HeaderText="Название" SortExpression="CompanyName"></asp:BoundField>
                                <asp:BoundField DataField="CompanyEmail" HeaderText="Почта" SortExpression="CompanyEmail" />
                                <asp:BoundField DataField="CompanyPhone" HeaderText="Телефон" SortExpression="CompanyPhone" />
                                <asp:BoundField DataField="CompanySite" HeaderText="Сайт" SortExpression="CompanySite" />
                                <asp:BoundField DataField="JobName" HeaderText="Название профессии" SortExpression="JobName" />
                                <asp:BoundField DataField="Education" HeaderText="Образование" SortExpression="Education" />
                                <asp:BoundField DataField="Industry" HeaderText="Направление" SortExpression="Industry" />
                                <asp:BoundField DataField="Employment" HeaderText="Занятость" SortExpression="Employment" />
                                <asp:BoundField DataField="Location" HeaderText="Расположение" SortExpression="Location" />
                                <asp:BoundField DataField="Salary" HeaderText="Зарплата" SortExpression="Salary" />
                                <asp:BoundField DataField="Schedule" HeaderText="График" SortExpression="Schedule" />
                                <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:employeesConnectionString %>" DeleteCommand="DeleteProfCompany" DeleteCommandType="StoredProcedure" InsertCommand="AddProfCompany" InsertCommandType="StoredProcedure" SelectCommand="GetCompanyProf" SelectCommandType="StoredProcedure" UpdateCommand="UpdateProfCompany" UpdateCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Profession_id" Type="Int32" />
                                <asp:Parameter Name="Company_idCompany" Type="Int32" />
                                <asp:ControlParameter ControlID="txbSal" Name="Salary" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="DropDownList2" Name="Schedule" PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="DropDownList3" Name="Employment" PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="DropDownList1" Name="Location" PropertyName="SelectedValue" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="lblID" Name="id" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="txbSal" Name="Salary" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="DropDownList2" Name="Schedule" PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="DropDownList3" Name="Employment" PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="DropDownList1" Name="Location" PropertyName="SelectedValue" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:employeesConnectionString %>" SelectCommand="SELECT * FROM [Company]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:employeesConnectionString %>" SelectCommand="SELECT * FROM [Profession]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Компания</td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="cmdComp" runat="server" DataSourceID="SqlDataSource2" DataTextField="CompanyName" DataValueField="idCompany">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Профессия</td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="cmpProf" runat="server" DataSourceID="SqlDataSource3" DataTextField="JobName" DataValueField="id">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Оплатата</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txbSal" runat="server" Width="149px"></asp:TextBox>
                    </td>
                    <td class="auto-style11">
                        
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Расположение</td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>Иркусткая область</asp:ListItem>
                            <asp:ListItem>Московская область</asp:ListItem>
                            <asp:ListItem>Ленинградская область</asp:ListItem>
                            <asp:ListItem>Красноярский край</asp:ListItem>
                            <asp:ListItem>Калиниградская область</asp:ListItem>
                            <asp:ListItem>Новосибирская область</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style11">
                        
                        <asp:Label ID="lblID" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">График</td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="DropDownList2" runat="server" Height="21px" Width="154px">
                            <asp:ListItem>2/2</asp:ListItem>
                            <asp:ListItem>5/2</asp:ListItem>
                            <asp:ListItem>3/3</asp:ListItem>
                            <asp:ListItem>40/40</asp:ListItem>
                            <asp:ListItem>Свободный</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style11">
                        
                        <asp:Button ID="Button7" runat="server" Enabled="False" OnClick="Button7_Click" Text="Обновить" Width="78px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Занятость</td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="DropDownList3" runat="server" Height="16px" Width="148px">
                            <asp:ListItem>Полная ставка</asp:ListItem>
                            <asp:ListItem>Полставки</asp:ListItem>
                            <asp:ListItem>Четверть ставки</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style11">
                        
                        <asp:Button ID="btnAdd" runat="server" Text="Добавить" OnClick="btnAdd_Click" Height="25px" />
                        
                    </td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
