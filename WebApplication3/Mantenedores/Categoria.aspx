<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Categoria.aspx.vb" Inherits="WebApplication3.Categoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Categoria</h2>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Agregar Categoria" />
    </p>
    <p>
        <asp:GridView ID="GridViewCategoria" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id_categoria" DataSourceID="SqlDataSourceCategorias" 
            AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" 
            AllowSorting="True" ShowFooter="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                    SortExpression="nombre" />
                <asp:BoundField DataField="descripcion" HeaderText="Descripcion" 
                    SortExpression="descripcion" />
                <asp:CommandField ShowSelectButton="True" HeaderText="Seleccionar" />
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
        <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
            SelectCommand="SELECT * FROM [Categoria]">
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:FormView ID="FormViewCategoria" runat="server" DataKeyNames="id_categoria" 
            DataSourceID="SqlDataSourceCategoria" CellPadding="4" ForeColor="#333333">
            <EditItemTemplate>
                <table>
                    <tr>
                        <td>Nombre:</td>
                        <td>
                            <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="nombreTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Descripcion:</td>
                        <td><asp:TextBox ID="descripcionTextBox" runat="server" Text='<%# Bind("descripcion") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="descripcionTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>                
                <asp:Label ID="id_categoriaLabel1" runat="server" 
                    Text='<%# Eval("id_categoria") %>' Visible="False" />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Actualizar"/>
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </EditItemTemplate>
            <EditRowStyle BackColor="White" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                <table>
                    <tr>
                        <td>Nombre:</td>
                        <td><asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="nombreTextBox">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Descripcion: </td>
                        <td><asp:TextBox ID="descripcionTextBox" runat="server" Text='<%# Bind("descripcion") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="descripcionTextBox">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insertar"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table>
                <tr>
                    <td>Nombre:</td>
                    <td><asp:Label ID="nombreLabel" runat="server" Text='<%# Bind("nombre") %>' /></td>
                </tr>
                <tr>
                    <td>Descripcion:</td>
                    <td><asp:Label ID="descripcionLabel" runat="server" Text='<%# Bind("descripcion") %>' /></td>
                </tr>
                </table>
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Editar" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Eliminar" onclientclick="return confirm(&quot;Seguro que desea eliminar ?&quot;);" />
                    
            </ItemTemplate>
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSourceCategoria" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
            DeleteCommand="DELETE FROM [Categoria] WHERE [id_categoria] = @id_categoria" 
            InsertCommand="INSERT INTO [Categoria] ([nombre], [descripcion]) VALUES (@nombre, @descripcion)" 
            SelectCommand="SELECT * FROM [Categoria] WHERE ([id_categoria] = @id_categoria)" 
            
            UpdateCommand="UPDATE [Categoria] SET [nombre] = @nombre, [descripcion] = @descripcion WHERE [id_categoria] = @id_categoria">
            <DeleteParameters>
                <asp:Parameter Name="id_categoria" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="descripcion" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="id_categoria" SessionField="id" Type="Decimal" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="descripcion" Type="String" />
                <asp:Parameter Name="id_categoria" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
