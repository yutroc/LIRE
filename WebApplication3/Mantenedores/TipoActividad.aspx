<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TipoActividad.aspx.vb" Inherits="WebApplication3.FormularioTipoAvtividad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Tipo de actividad<br />
        &nbsp;</h2>
    <p>
        <asp:GridView ID="GridViewTipoActividad" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="id_tipo_actividad" 
            DataSourceID="SqlDataSourceTipoActividad" AllowPaging="True" 
            AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" 
            ShowFooter="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id_tipo_actividad" HeaderText="id_tipo_actividad" 
                    InsertVisible="False" ReadOnly="True" SortExpression="id_tipo_actividad" />
                <asp:BoundField DataField="nombre" HeaderText="nombre" 
                    SortExpression="nombre" />
                <asp:BoundField DataField="decripcion" HeaderText="decripcion" 
                    SortExpression="decripcion" />
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
        <asp:SqlDataSource ID="SqlDataSourceTipoActividad" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
            DeleteCommand="DELETE FROM [Tipo_Actividad] WHERE [id_tipo_actividad] = @id_tipo_actividad" 
            InsertCommand="INSERT INTO [Tipo_Actividad] ([nombre], [decripcion]) VALUES (@nombre, @decripcion)" 
            SelectCommand="SELECT * FROM [Tipo_Actividad] ORDER BY [id_tipo_actividad]" 
            UpdateCommand="UPDATE [Tipo_Actividad] SET [nombre] = @nombre, [decripcion] = @decripcion WHERE [id_tipo_actividad] = @id_tipo_actividad">
            <DeleteParameters>
                <asp:Parameter Name="id_tipo_actividad" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="decripcion" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="decripcion" Type="String" />
                <asp:Parameter Name="id_tipo_actividad" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
