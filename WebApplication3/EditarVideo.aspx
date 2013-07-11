<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="EditarVideo.aspx.vb" Inherits="WebApplication3.EditarVideo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSourceVIdeo" runat="server" ConnectionString="<%$ ConnectionStrings:LireConnectionString %>"
        DeleteCommand="DELETE FROM [Video] WHERE [id_video] = @id_video" InsertCommand="INSERT INTO [Video] ([nombre], [descripcion], [id_categoria]) VALUES (@nombre, @descripcion, @id_categoria)"
        SelectCommand="SELECT [id_video], [nombre], [descripcion], [id_categoria] FROM [Video] WHERE ([id_video] = @id_video)"
        UpdateCommand="UPDATE [Video] SET [nombre] = @nombre, [descripcion] = @descripcion, [id_categoria] = @id_categoria WHERE [id_video] = @id_video">
        <DeleteParameters>
            <asp:Parameter Name="id_video" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="id_categoria" Type="Decimal" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="id_video" SessionField="ID_VIDEO" Type="Decimal" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="id_categoria" Type="Decimal" />
            <asp:Parameter Name="id_video" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="id_video" DataSourceID="SqlDataSourceVIdeo">
        <EditItemTemplate>
            &nbsp;<br />
            <table>
                <tr>
                    <td>
                        nombre:
                    </td>
                    <td>
                        <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="nombreTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        descripcion:
                    </td>
                    <td>
                        <asp:TextBox ID="descripcionTextBox" runat="server" Text='<%# Bind("descripcion") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="descripcionTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Categoria:
                    </td>
                    
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceCategorias"
                                DataTextField="nombre" DataValueField="id_categoria" SelectedValue='<%# Bind("id_categoria") %>'>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    </caption>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server" ConnectionString="<%$ ConnectionStrings:LireConnectionString %>"
                SelectCommand="SELECT [id_categoria], [nombre] FROM [Categoria]"></asp:SqlDataSource>
            <asp:Label ID="id_videoLabel1" runat="server" Text='<%# Eval("id_video") %>' Visible="False" />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Actualizar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                CommandName="Cancel" Text="Cancelar" onclick="UpdateCancelButton_Click" />
        </EditItemTemplate>
        <InsertItemTemplate>
            nombre:
            <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
            <br />
            descripcion:
            <asp:TextBox ID="descripcionTextBox" runat="server" Text='<%# Bind("descripcion") %>' />
            <br />
            id_categoria:
            <asp:TextBox ID="id_categoriaTextBox" runat="server" Text='<%# Bind("id_categoria") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Insertar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                CommandName="Cancel" Text="Cancelar" />
        </InsertItemTemplate>
        <ItemTemplate>
            id_video:
            <asp:Label ID="id_videoLabel" runat="server" Text='<%# Eval("id_video") %>' />
            <br />
            nombre:
            <asp:Label ID="nombreLabel" runat="server" Text='<%# Bind("nombre") %>' />
            <br />
            descripcion:
            <asp:Label ID="descripcionLabel" runat="server" Text='<%# Bind("descripcion") %>' />
            <br />
            id_categoria:
            <asp:Label ID="id_categoriaLabel" runat="server" Text='<%# Bind("id_categoria") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Editar" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                Text="Eliminar" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="Nuevo" />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
