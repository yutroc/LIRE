<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="Registrarse.aspx.vb" Inherits="WebApplication3.Registrarse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        Creacion de usuario</p>
    <p>
        <asp:Label ID="LabelMensaje" runat="server"></asp:Label>
    </p>
    <p>
        <asp:FormView ID="FormViewCrearUser" runat="server" DataKeyNames="username" DataSourceID="SqlDataSourceUsuario"
            Style="margin-top: 21px">
            <EditItemTemplate>
                username:
                <asp:Label ID="usernameLabel1" runat="server" Text='<%# Eval("username") %>' />
                <br />
                password:
                <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                <br />
                id_rol:
                <asp:TextBox ID="id_rolTextBox" runat="server" Text='<%# Bind("id_rol") %>' />
                <br />
                email:
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br />
                fecha_registro:
                <asp:TextBox ID="fecha_registroTextBox" runat="server" Text='<%# Bind("fecha_registro") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Actualizar" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                    CommandName="Cancel" Text="Cancelar" />
            </EditItemTemplate>
            <InsertItemTemplate>
                <table>
                    <tr>
                        <td>
                            username:
                        </td>
                        <td>
                            <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="usernameTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            password:
                        </td>
                        <td>
                            <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="passwordTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            email:
                        </td>
                        <td>
                            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="emailTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("id_rol") %>'
                        Visible="False">
                        <asp:ListItem>1</asp:ListItem>
                    </asp:DropDownList>
                    
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("icon_url") %>'
                            Visible="False">
                            <asp:ListItem>icon</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("biografia") %>'
                            Visible="False">
                            <asp:ListItem>biografia</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("fecha_registro") %>'
                            Visible="False" DataSourceID="SqlDataSourceFecha" DataTextField="Column1" DataValueField="Column1">
                            <asp:ListItem>22/12/2012</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceFecha" runat="server" ConnectionString="<%$ ConnectionStrings:LireConnectionString %>"
                            SelectCommand="SELECT SYSDATETIME()
    ,SYSDATETIMEOFFSET()"></asp:SqlDataSource>
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insertar" />
                &nbsp;&nbsp;
            </InsertItemTemplate>
            <ItemTemplate>
                username:
                <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                <br />
                password:
                <asp:Label ID="passwordLabel" runat="server" Text='<%# Bind("password") %>' />
                <br />
                id_rol:
                <asp:Label ID="id_rolLabel" runat="server" Text='<%# Bind("id_rol") %>' />
                <br />
                email:
                <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                <br />
                fecha_registro:
                <asp:Label ID="fecha_registroLabel" runat="server" Text='<%# Bind("fecha_registro") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Editar" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                    Text="Eliminar" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                    Text="Nuevo" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSourceUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:LireConnectionString %>"
            DeleteCommand="DELETE FROM [Usuario] WHERE [username] = @username" InsertCommand="INSERT INTO [Usuario] ([username], [password], [id_rol], [icon_url], [email], [biografia], [fecha_registro]) VALUES (@username, @password, @id_rol, @icon_url, @email, @biografia, @fecha_registro)"
            SelectCommand="SELECT * FROM [Usuario] WHERE (([fecha_registro] = @fecha_registro) AND ([icon_url] = @icon_url) AND ([biografia] = @biografia) AND ([id_rol] = @id_rol))"
            UpdateCommand="UPDATE [Usuario] SET [password] = @password, [id_rol] = @id_rol, [icon_url] = @icon_url, [email] = @email, [biografia] = @biografia, [fecha_registro] = @fecha_registro WHERE [username] = @username">
            <DeleteParameters>
                <asp:Parameter Name="username" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="id_rol" Type="Decimal" />
                <asp:Parameter Name="icon_url" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="biografia" Type="String" />
                <asp:Parameter DbType="Date" Name="fecha_registro" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DbType="Date" Name="fecha_registro" SessionField="fechaActual" />
                <asp:SessionParameter Name="icon_url" SessionField="iconoDefault" Type="String" />
                <asp:SessionParameter Name="biografia" SessionField="biografiaDefault" Type="String" />
                <asp:SessionParameter Name="id_rol" SessionField="idRolDefault" Type="Decimal" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="id_rol" Type="Decimal" />
                <asp:Parameter Name="icon_url" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="biografia" Type="String" />
                <asp:Parameter DbType="Date" Name="fecha_registro" />
                <asp:Parameter Name="username" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:LinkButton ID="LinkButton1" runat="server">Salir</asp:LinkButton>
    </p>
</asp:Content>
