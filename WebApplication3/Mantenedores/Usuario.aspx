<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="Usuario.aspx.vb" Inherits="WebApplication3.Usuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Usuario</h2>
    <h2>
        <asp:Button ID="Button1" runat="server" Text="Agregar Usuario" Width="123px" />
    </h2>
    <p>
       <asp:Label ID="LabelMensaje" runat="server"></asp:Label>
        <asp:GridView ID="GridViewUsuarios" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="Username" DataSourceID="SqlDataSourceUsuarios" ForeColor="#333333"
            GridLines="None" AllowPaging="True" ShowFooter="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                <asp:BoundField DataField="Rol" HeaderText="Rol" SortExpression="Rol" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Biografia" HeaderText="Biografia" SortExpression="Biografia" />
                <asp:BoundField DataField="Icono URL" HeaderText="Icono URL" SortExpression="Icono URL" />
                <asp:BoundField DataField="Fecha Registro" HeaderText="Fecha Registro" SortExpression="Fecha Registro"
                    DataFormatString="{0:dd/MM/yyyy}" />
                <asp:CommandField HeaderText="Seleccionar" ShowSelectButton="True" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:LireConnectionString %>"
            DeleteCommand="DELETE FROM [Usuario] WHERE [username] = @username" InsertCommand="INSERT INTO [Usuario] ([username], [password], [id_rol], [icon_url],[email], [biografia], [fecha_registro]) VALUES (@username, @password, @id_rol,@icon_url, @email, @biografia, @fecha_registro)"
            SelectCommand="SELECT [username], [password], [id_rol], [email], [biografia], [fecha_registro] FROM [Usuario] WHERE ([username] = @username) ORDER BY [username]"
            UpdateCommand="UPDATE [Usuario] SET [password] = @password, [id_rol] = @id_rol, [email] = @email, [biografia] = @biografia WHERE [username] = @username">
            <DeleteParameters>
                <asp:Parameter Name="username" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="id_rol" Type="Decimal" />
                <asp:Parameter Name="icon_url" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="biografia" Type="String" />
                <asp:Parameter DbType="Date" Name="fecha_registro" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="username" SessionField="username" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="id_rol" Type="Decimal" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="biografia" Type="String" />
                <asp:Parameter Name="username" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormViewUsuario" runat="server" DataKeyNames="username" DataSourceID="SqlDataSourceUsuario">
            <EditItemTemplate>
                <table>
                    <tr>
                        <td>
                            Username:
                        </td>
                        <td>
                            <asp:Label ID="usernameLabel1" runat="server" Text='<%# Eval("username") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password:
                        </td>
                        <td>
                            <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="passwordTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Rol:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("id_rol") %>'>
                                <asp:ListItem Value="3">Administrador</asp:ListItem>
                                <asp:ListItem Value="1">Normal</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email:
                        </td>
                        <td>
                            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="emailTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Biografia:
                        </td>
                        <td>
                            <asp:TextBox ID="biografiaTextBox" runat="server" Text='<%# Bind("biografia") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="biografiaTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Actualizar" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                    CommandName="Cancel" Text="Cancelar" />
            </EditItemTemplate>
            <InsertItemTemplate>
                <table>
                    <tr>
                        <td>
                            Username:
                        </td>
                        <td>
                            <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="usernameTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password:
                        </td>
                        <td>
                            <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="passwordTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Rol:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("id_rol") %>'>
                                <asp:ListItem Value="3">Administrador</asp:ListItem>
                                <asp:ListItem Value="1">Normal</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email:
                        </td>
                        <td>
                            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="emailTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Biografia:
                        </td>
                        <td>
                            <asp:TextBox ID="biografiaTextBox" runat="server" Text='<%# Bind("biografia") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="biografiaTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("fecha_registro") %>'
                    Visible="False" DataSourceID="SqlDataSourceFechaActual" DataTextField="Column1"
                    DataValueField="Column1">
                    <asp:ListItem>22/12/2012</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceFechaActual" runat="server" ConnectionString="<%$ ConnectionStrings:LireConnectionString %>"
                    SelectCommand="SELECT SYSDATETIME() ;"></asp:SqlDataSource>
                <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("icon_url") %>'
                    Visible="False">
                    <asp:ListItem>icon</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="Insertar" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                    CommandName="Cancel" Text="Cancelar" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            Username:
                        </td>
                        <td>
                            <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password:
                        </td>
                        <td>
                            <asp:Label ID="passwordLabel" runat="server" Text='<%# Bind("password") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Rol:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" Enabled="False"
                                SelectedValue='<%# Bind("id_rol") %>'>
                                <asp:ListItem Value="3">Administrador</asp:ListItem>
                                <asp:ListItem Value="1">Normal</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email:
                        </td>
                        <td>
                            <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Biografia:
                        </td>
                        <td>
                            <asp:Label ID="biografiaLabel" runat="server" Text='<%# Bind("biografia") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Fecha de registro:
                        </td>
                        <td>
                            <asp:Label ID="fecha_registroLabel" runat="server" Text='<%# Bind("fecha_registro") %>' />
                        </td>
                    </tr>
                </table>
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Editar" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                    Text="Eliminar" OnClientClick="return confirm(&quot;Seguro que lo desea eliminar ?&quot;);" />
                &nbsp;
            </ItemTemplate>
        </asp:FormView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSourceUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:LireConnectionString %>"
            SelectCommand="SELECT Usuario.username AS Username, Usuario.password AS Password, Rol.nombre AS Rol, Usuario.email AS Email, Usuario.biografia AS Biografia, Usuario.icon_url AS [Icono URL], Usuario.fecha_registro AS [Fecha Registro] FROM Usuario INNER JOIN Rol ON Usuario.id_rol = Rol.id_rol">
        </asp:SqlDataSource>
    </p>
</asp:Content>
