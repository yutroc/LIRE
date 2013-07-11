<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormListaDeReproduccion.aspx.vb" Inherits="WebApplication3.FormListaDeReproduccion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSourceListaDeReproduccion" runat="server" 
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
    <asp:FormView ID="FormViewLista" runat="server" DataKeyNames="id_lista" 
        DataSourceID="SqlDataSourceListaDeReproduccion">
        <EditItemTemplate>
            id_lista:
            <asp:Label ID="id_listaLabel1" runat="server" Text='<%# Eval("id_lista") %>' />
            <br />
            nombre:
            <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
            <br />
            descripcion:
            <asp:TextBox ID="descripcionTextBox" runat="server" 
                Text='<%# Bind("descripcion") %>' />
            <br />
            username:
            <asp:TextBox ID="usernameTextBox" runat="server" 
                Text='<%# Bind("username") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Actualizar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </EditItemTemplate>
        <InsertItemTemplate>
        <table>
        <tr>
        
        <td>    Nombre:<td>
            <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="nombreTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
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
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" 
                onclick="InsertCancelButton_Click" />
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSourceListaDeReproduccion" DataTextField="username" 
                DataValueField="username" SelectedValue='<%# Bind("username") %>' 
                Visible="False">
            </asp:DropDownList>
        </InsertItemTemplate>
        <ItemTemplate>
            id_lista:
            <asp:Label ID="id_listaLabel" runat="server" Text='<%# Eval("id_lista") %>' />
            <br />
            nombre:
            <asp:Label ID="nombreLabel" runat="server" Text='<%# Bind("nombre") %>' />
            <br />
            descripcion:
            <asp:Label ID="descripcionLabel" runat="server" 
                Text='<%# Bind("descripcion") %>' />
            <br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Editar" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Eliminar" />
            &nbsp;
        </ItemTemplate>
    </asp:FormView>
    </asp:Content>
