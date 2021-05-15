<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="лаб3_УД.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style8 {
            height: 25px;
        }
        .auto-style10 {
            width: 207px;
            height: 25px;
        }
        .auto-style12 {
            width: 133px;
            height: 25px;
        }
        .auto-style13 {
            width: 133px;
            height: 27px;
        }
        .auto-style14 {
            width: 207px;
            height: 27px;
        }
        .auto-style15 {
            height: 27px;
        }
        .auto-style16 {
            width: 133px;
            height: 28px;
        }
        .auto-style17 {
            width: 207px;
            height: 28px;
        }
        .auto-style18 {
            height: 28px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" PostBackUrl="~/Profession.aspx" Text="Профессии" />
            <asp:Button ID="Button2" runat="server" PostBackUrl="~/Company.aspx" Text="Компании" />
            <asp:Button ID="Button3" runat="server" PostBackUrl="~/EmployeeProf.aspx" Text="Работники" />
            <asp:Button ID="Button4" runat="server" PostBackUrl="~/ProfCompany.aspx" Text="Работа" />
            <asp:Button ID="Button5" runat="server" PostBackUrl="~/Search1.aspx" Text="Поиск 1" />
            <asp:Button ID="Button6" runat="server" PostBackUrl="~/Search2.aspx" Text="Поиск 2" /></div>
        <div>
            <table style="width: 100%;">
                <tr>
                    <td colspan ="3" >
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="Паспорт" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="first_name" HeaderText="Имя" SortExpression="first_name" />
                                <asp:BoundField DataField="second_name" HeaderText="Отчетсво" SortExpression="second_name" />
                                <asp:BoundField DataField="last_name" HeaderText="Фамилия" SortExpression="last_name" />
                                <asp:BoundField DataField="education" HeaderText="Образование" SortExpression="education" />
                                <asp:BoundField DataField="region" HeaderText="Регион" SortExpression="region" />
                                <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:employeesConnectionString %>" DeleteCommand="DeleteEmployee" DeleteCommandType="StoredProcedure" InsertCommand="AddEmployee" InsertCommandType="StoredProcedure" SelectCommand="GetEmployee" SelectCommandType="StoredProcedure" UpdateCommand="UpdateEmployee" UpdateCommandType="StoredProcedure" OnDeleting="SqlDataSource1_Deleting" OnInserting="SqlDataSource1_Inserting" OnUpdating="SqlDataSource1_Updating">
                            <DeleteParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="tbxPass" Name="id" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="tbxName" Name="first_name" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="tbxSName" Name="second_name" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="tbxLName" Name="last_name" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="cmbEdu" Name="education" PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="cmbReg" Name="region" PropertyName="SelectedValue" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="tbxPass" Name="id" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="tbxName" Name="first_name" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="tbxSName" Name="second_name" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="tbxLName" Name="last_name" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="cmbEdu" Name="education" PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="cmbReg" Name="region" PropertyName="SelectedValue" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">Паспорт</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="tbxPass" runat="server" Width="197px" CausesValidation="True" ValidateRequestMode="Enabled"></asp:TextBox>
                    </td>
                    <td class="auto-style8">
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tbxPass" Display="Dynamic" ErrorMessage="Ошибка диапазона" MaximumValue="99999999" MinimumValue="1" Type="Integer" ValidateRequestMode="Enabled"></asp:RangeValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbxPass" Display="Dynamic" ErrorMessage="Вы не заполнили поле" ValidateRequestMode="Enabled"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">Имя</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="tbxName" runat="server" Width="197px" CausesValidation="True" ValidateRequestMode="Enabled"></asp:TextBox>
                    </td>
                    <td class="auto-style8">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbxName" Display="Dynamic" ErrorMessage="Вы не заполнили поле"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style16">Отчество</td>
                    <td class="auto-style17">
                        <asp:TextBox ID="tbxSName" runat="server" Width="197px" CausesValidation="True" ValidateRequestMode="Enabled"></asp:TextBox>
                    </td>
                    <td class="auto-style18">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxSName" Display="Dynamic" ErrorMessage="Вы не заполнили поле"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">Фамилия</td>
                    <td class="auto-style14">
                        <asp:TextBox ID="tbxLName" runat="server" Width="197px" CausesValidation="True" ValidateRequestMode="Enabled"></asp:TextBox>
                    </td>
                    <td class="auto-style15">
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxLName" Display="Dynamic" ErrorMessage="Вы не заолнили поле"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">Образование</td>
                    <td class="auto-style14">
                        <asp:DropDownList ID="cmbEdu" runat="server" Height="17px" Width="202px" AutoPostBack="True">
                            <asp:ListItem>Среднее, незаконченное</asp:ListItem>
                            <asp:ListItem>Среднее, законченное</asp:ListItem>
                            <asp:ListItem>Средне-специальное</asp:ListItem>
                            <asp:ListItem>Высшее(Бакалавриат)</asp:ListItem>
                            <asp:ListItem>Высшее(Магистрат)</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style15">
                        <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Обновить" Width="79px" Enabled="False" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">Регион</td>
                    <td class="auto-style10">
                        <asp:DropDownList ID="cmbReg" runat="server" Height="17px" Width="202px" AutoPostBack="True">
                            <asp:ListItem>Иркусткая область</asp:ListItem>
                            <asp:ListItem>Московская область</asp:ListItem>
                            <asp:ListItem>Ленинградская область</asp:ListItem>
                            <asp:ListItem>Красноярский край</asp:ListItem>
                            <asp:ListItem>Калиниградская область</asp:ListItem>
                            <asp:ListItem>Новосибирская область</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style8">
                        <asp:Button ID="btnAdd" runat="server" Text="Добавить" OnClick="btnAdd_Click" />
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
