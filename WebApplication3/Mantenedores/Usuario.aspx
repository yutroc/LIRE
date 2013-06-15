<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Usuario.aspx.vb" Inherits="WebApplication3.Usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>Usuario</h2>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="username" DataSourceID="SqlDataSourceUsuario" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="username" HeaderText="username" ReadOnly="True" 
                    SortExpression="username" />
                <asp:BoundField DataField="password" HeaderText="password" 
                    SortExpression="password" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="biografia" HeaderText="biografia" 
                    SortExpression="biografia" />
                <asp:CommandField ShowSelectButton="True" />
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
        <asp:FormView ID="FormViewTipoReporte" runat="server" CellPadding="4" 
            DataKeyNames="username" DataSourceID="SqlDataSource3" 
            ForeColor="#333333">
            <EditItemTemplate>
                username:
                <asp:Label ID="usernameLabel1" runat="server" Text='<%# Eval("username") %>' />
                <br />
                password:
                <asp:TextBox ID="passwordTextBox" runat="server" 
                    Text='<%# Bind("password") %>' />
                <br />
                email:
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br />
                biografia:
                <asp:TextBox ID="biografiaTextBox" runat="server" 
                    Text='<%# Bind("biografia") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Actualizar" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                username:
                <asp:TextBox ID="usernameTextBox" runat="server" 
                    Text='<%# Bind("username") %>' />
                
                <br />
                password:
                <asp:TextBox ID="passwordTextBox" runat="server" 
                    Text='<%# Bind("password") %>' />
                <br />
                email:
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br />
                biografia:
                <asp:TextBox ID="biografiaTextBox" runat="server" 
                    Text='<%# Bind("biografia") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insertar" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
            </InsertItemTemplate>
            <ItemTemplate>
                username:
                <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                <br />
                password:&nbsp;<asp:Label ID="passwordLabel" runat="server" 
                    Text='<%# Bind("password") %>' />
                <br />
                email:
                <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                <br />
                biografia:
                <asp:Label ID="biografiaLabel" runat="server" Text='<%# Bind("biografia") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Editar" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Eliminar" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="Nuevo"></asp:LinkButton>
            </ItemTemplate><PagerStyle BackColor="#666666" ForeColor="White" 
                HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
            DeleteCommand="DELETE FROM [Usuario] WHERE [username] = @username" 
            InsertCommand="INSERT INTO [Usuario] ([username], [password], [email], [biografia]) VALUES (@username, @password, @email, @biografia)" 
            SelectCommand="SELECT [username], [password], [email], [biografia] FROM [Usuario] WHERE ([username] = @username)" 
            UpdateCommand="UPDATE [Usuario] SET [password] = @password, [email] = @email, [biografia] = @biografia WHERE [username] = @username">
            <DeleteParameters>
                <asp:Parameter Name="username" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="biografia" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="username" SessionField="usuario" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="biografia" Type="String" />
                <asp:Parameter Name="username" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSourceUsuario" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
            SelectCommand="SELECT [username], [password], [email], [biografia] FROM [Usuario]">
        </asp:SqlDataSource>
    </p>
</asp:Content>
