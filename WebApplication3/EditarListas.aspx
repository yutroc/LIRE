<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="EditarListas.aspx.vb" Inherits="WebApplication3.EditarListas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:GridView ID="GridViewListas" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_lista" 
        DataSourceID="SqlDataSourceListas">
        <Columns>
            <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                SortExpression="nombre" />
            <asp:BoundField DataField="descripcion" HeaderText="Descripcion" 
                SortExpression="descripcion" />
            <asp:CommandField ShowSelectButton="True" HeaderText="Seleccionar" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceListas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
        DeleteCommand="DELETE FROM [Lista_Reproduccion] WHERE [id_lista] = @id_lista" 
        InsertCommand="INSERT INTO [Lista_Reproduccion] ([nombre], [descripcion], [username]) VALUES (@nombre, @descripcion, @username)" 
        SelectCommand="SELECT * FROM [Lista_Reproduccion] WHERE ([username] = @username)" 
        UpdateCommand="UPDATE [Lista_Reproduccion] SET [nombre] = @nombre, [descripcion] = @descripcion, [username] = @username WHERE [id_lista] = @id_lista">
        <DeleteParameters>
            <asp:Parameter Name="id_lista" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="username" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="username" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="id_lista" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="id_lista" 
        DataSourceID="SqlDataSourceEdicionLista">
        <EditItemTemplate>
            &nbsp;<asp:Label ID="id_listaLabel1" runat="server" Text='<%# Eval("id_lista") %>' 
                Visible="False" />
            <br />
            <table>
            <tr>
            <td>Nombre:</td>
            <td><asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="nombreTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
            <td>Descripcion:</td>
            <td><asp:TextBox ID="descripcionTextBox" runat="server" 
                Text='<%# Bind("descripcion") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="descripcionTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                </td>
            
            </tr>
            </table>
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Actualizar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Nombre:
            <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
            <br />
            Descripcion:
            <asp:TextBox ID="descripcionTextBox" runat="server" 
                Text='<%# Bind("descripcion") %>' />
            <br />
            username:
            <asp:TextBox ID="usernameTextBox" runat="server" 
                Text='<%# Bind("username") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </InsertItemTemplate>
        <ItemTemplate>
            <table>
            <tr>
            <td>
            Nombre:</td>
            <td><asp:Label ID="nombreLabel" runat="server" Text='<%# Bind("nombre") %>' /></td>
            </tr>
            <tr>
            <td>Descripcion:</td>
            <td><asp:Label ID="descripcionLabel" runat="server" 
                Text='<%# Bind("descripcion") %>' /></td>
            </tr>
            </talbe>
            &nbsp;<asp:Label ID="usernameLabel" runat="server" Text='<%# Bind("username") %>' 
                Visible="False" />
            <asp:Label ID="id_listaLabel" runat="server" Text='<%# Eval("id_lista") %>' 
                Visible="False" />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Editar" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Eliminar" OnClientClick="return confirm(&quot;Seguro que la desea eliminar ?&quot;);"/>
            &nbsp;
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSourceEdicionLista" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
        DeleteCommand="DELETE FROM [Lista_Reproduccion] WHERE [id_lista] = @id_lista" 
        InsertCommand="INSERT INTO [Lista_Reproduccion] ([nombre], [descripcion], [username]) VALUES (@nombre, @descripcion, @username)" 
        SelectCommand="SELECT * FROM [Lista_Reproduccion] WHERE ([id_lista] = @id_lista)" 
        UpdateCommand="UPDATE dbo.Lista_Reproduccion SET nombre = @nombre, descripcion = @descripcion WHERE (id_lista = @id_lista)">
        <DeleteParameters>
            <asp:Parameter Name="id_lista" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="username" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="id_lista" SessionField="idLista" Type="Decimal" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="id_lista" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:LinkButton ID="LinkButton1" runat="server">Retroceder</asp:LinkButton>
</asp:Content>
