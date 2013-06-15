<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TipoReporte.aspx.vb" Inherits="WebApplication3.TipoReporte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>Tipo de Reporte</h2>
    <p>
        <br />
        <asp:GridView ID="GridViewTipoReporte" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id_tipo_reporte" DataSourceID="SqlDataSourceTipo_Reporte1" 
            AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                    SortExpression="nombre" />
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
        <asp:SqlDataSource ID="SqlDataSourceTipo_Reporte1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
            DeleteCommand="DELETE FROM [Tipo_Reporte] WHERE [id_tipo_reporte] = @id_tipo_reporte" 
            InsertCommand="INSERT INTO [Tipo_Reporte] ([nombre]) VALUES (@nombre)" 
            SelectCommand="SELECT * FROM [Tipo_Reporte]" 
            
            UpdateCommand="UPDATE [Tipo_Reporte] SET [nombre] = @nombre WHERE [id_tipo_reporte] = @id_tipo_reporte">
            <DeleteParameters>
                <asp:Parameter Name="id_tipo_reporte" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nombre" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="id_tipo_reporte" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:FormView ID="FormViewTipoReporte" runat="server" CellPadding="4" 
            DataKeyNames="id_tipo_reporte" DataSourceID="SqlDataSourceTipo_Reporte2" 
            ForeColor="#333333">
            <EditItemTemplate>
                <table>
                    <tr>
                        <td>id_tipo_reporte:</td>
                        <td><asp:Label ID="id_tipo_reporteLabel1" runat="server" Text='<%# Eval("id_tipo_reporte") %>' /></td>
                    </tr>
                    <tr>
                        <td>nombre:</td>
                        <td><asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' /></td>
                    </tr>
                </table>
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Actualizar" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                <table>
                    <tr>
                        <td>nombre:</td>
                        <td><asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' /></td>
                    </tr>
                </table>
                
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insertar" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancelar">
                     <asp:RequiredFieldValidator ID="ErrorNombreLabel" Runat="server" ControlToValidate="nombreTextBox" EnableClientScript="True" Display="None"  
                ErrorMessage="<br><div align=center><b>Nombre</b> es un campo obligatorio.</div>" /> </asp:LinkButton><asp:ValidationSummary runat="server" DisplayMode="SingleParagraph" ShowSummary="True" ShowMessageBox="False" ID="valSumario" 
                HeaderText="<div align=center><u>Se han encontrado los siguientes errores</u>: </div>" Font-Size="10pt" Font-Names="Verdana" /> 
            </InsertItemTemplate>
            <ItemTemplate>
                <table>
                    <tr>
                        <td>id_tipo_reporte:</td><td><asp:Label ID="id_tipo_reporteLabel" runat="server" Text='<%# Eval("id_tipo_reporte") %>' /></td>
                    </tr>
                    <tr>
                        <td>nombre:</td><td> <asp:Label ID="nombreLabel" runat="server" Text='<%# Bind("nombre") %>' /></td>
                    </tr>
                </table>
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Editar" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Eliminar" onclientclick="return confirm(&quot;Seguro que desea eliminar ?&quot;);" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="Nuevo"> 
                        
                    </asp:LinkButton></ItemTemplate><PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSourceTipo_Reporte2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
            DeleteCommand="DELETE FROM [Tipo_Reporte] WHERE [id_tipo_reporte] = @id_tipo_reporte" 
            InsertCommand="INSERT INTO [Tipo_Reporte] ([nombre]) VALUES (@nombre)" 
            SelectCommand="SELECT * FROM [Tipo_Reporte] WHERE ([id_tipo_reporte] = @id_tipo_reporte)" 
            UpdateCommand="UPDATE [Tipo_Reporte] SET [nombre] = @nombre WHERE [id_tipo_reporte] = @id_tipo_reporte">
            <DeleteParameters>
                <asp:Parameter Name="id_tipo_reporte" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nombre" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="id_tipo_reporte" SessionField="id_tipo_reporte" 
                    Type="Decimal" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="id_tipo_reporte" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
