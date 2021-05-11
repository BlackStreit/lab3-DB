<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profession.aspx.cs" Inherits="лаб3_УД.Profession" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style11 {
            width: 133px;
        }
        .auto-style13 {
            width: 133px;
            height: 27px;
        }
        .auto-style15 {
            height: 27px;
        }
        .auto-style16 {
            width: 61px;
        }
        .auto-style17 {
            height: 27px;
            width: 61px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div>
            <asp:Button ID="Button1" runat="server" PostBackUrl="~/Default.aspx" Text="Люди" />
            <asp:Button ID="Button2" runat="server" PostBackUrl="~/Company.aspx" Text="Компании" />
            <asp:Button ID="Button3" runat="server" PostBackUrl="~/EmployeeProf.aspx" Text="Работники" />
            <asp:Button ID="Button4" runat="server" PostBackUrl="~/ProfCompany.aspx" Text="Работа" />
            <asp:Button ID="Button5" runat="server" PostBackUrl="~/Search1.aspx" Text="Поиск 1" />
            <asp:Button ID="Button6" runat="server" PostBackUrl="~/Search2.aspx" Text="Поиск 2" /></div>
        <div>
            <table style="width: 100%;" >
                <tr>
                    <td colspan ="3" >
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="JobName" HeaderText="Название" SortExpression="JobName" />
                                <asp:BoundField DataField="Industry" HeaderText="Направление" SortExpression="Industry" />
                                <asp:BoundField DataField="Education" HeaderText="Образование" SortExpression="Education" />
                                <asp:BoundField DataField="Currency" HeaderText="Валюта" SortExpression="Currency" />
                                <asp:BoundField DataField="SalaryTotal" HeaderText="Средняя зарплата" SortExpression="SalaryTotal" />
                                <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:employeesConnectionString %>" DeleteCommand="DeleteProfession" DeleteCommandType="StoredProcedure" InsertCommand="AddProfession" InsertCommandType="StoredProcedure" SelectCommand="GetProfession" SelectCommandType="StoredProcedure" UpdateCommand="UpdateProfession" UpdateCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txbSalary" Name="SalaryTotal" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="cmbCur" Name="Currency" PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="cmbInd" Name="Industry" PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="txbName" Name="JobName" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="cmbEdu" Name="Education" PropertyName="SelectedValue" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="lblID" Name="id" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="txbSalary" Name="SalaryTotal" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="cmbCur" Name="Currency" PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="cmbInd" Name="Industry" PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="txbName" Name="JobName" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="cmbEdu" Name="Education" PropertyName="SelectedValue" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">Название</td>
                    <td class="auto-style16">
                        <asp:TextBox ID="txbName" runat="server" Width="197px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">ЗП</td>
                    <td class="auto-style16">
                        <asp:TextBox ID="txbSalary" runat="server" Width="197px" Height="21px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style11">Валюта</td>
                    <td class="auto-style16">
                        <asp:DropDownList ID="cmbCur" runat="server" Height="17px" Width="202px" AutoPostBack="True">
                            <asp:ListItem>Руб</asp:ListItem>
                            <asp:ListItem>Дол</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="lblID" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">Направление</td>
                    <td class="auto-style16">
                        <asp:DropDownList ID="cmbInd" runat="server" Height="17px" Width="202px" AutoPostBack="True">
                            <asp:ListItem>Кино</asp:ListItem>
                            <asp:ListItem>Обрзование</asp:ListItem>
                            <asp:ListItem>Программирование</asp:ListItem>
                            <asp:ListItem>Медицина</asp:ListItem>
                            <asp:ListItem>Политика</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        
                        <asp:Button ID="Button7" runat="server" Enabled="False" OnClick="Button7_Click" Text="Обновить" Width="80px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">Образование</td>
                    <td class="auto-style17">
                        <asp:DropDownList ID="cmbEdu" runat="server" AutoPostBack="True" Height="16px" Width="204px">
                            <asp:ListItem>Среднее, незаконченное</asp:ListItem>
                            <asp:ListItem>Среднее, законченное</asp:ListItem>
                            <asp:ListItem>Средне-специальное</asp:ListItem>
                            <asp:ListItem>Высшее(Бакалавриат)</asp:ListItem>
                            <asp:ListItem>Высшее(Магистрат)</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style15">
                        
                        <asp:Button ID="btnAdd" runat="server" Text="Добавить" OnClick="btnAdd_Click" />
                        
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
