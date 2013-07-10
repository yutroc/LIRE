<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="VideoParaComentario.aspx.vb" Inherits="WebApplication3.VideoParaComentario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>Comentarios</h2>
<h3>Seleccione un video para ver sus comentarios</h3>
    <p>&nbsp;</p>
    <asp:GridView ID="GridViewVideoParaComentario" runat="server" 
        AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
        DataKeyNames="id_video" DataSourceID="SqlDataSourceVideoParaComentario" 
        CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                SortExpression="nombre" />
            <asp:BoundField DataField="descripcion" HeaderText="Descripcion" 
                SortExpression="descripcion" />
            <asp:BoundField DataField="creador" HeaderText="Creador" 
                SortExpression="creador" />
            <asp:BoundField DataField="nombre_archivo" HeaderText="Nombre del archivo" 
                SortExpression="nombre_archivo" />
            <asp:BoundField DataField="Expr1" HeaderText="Categoria" 
                SortExpression="Expr1" />
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
    <asp:SqlDataSource ID="SqlDataSourceVideoParaComentario" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
        SelectCommand="SELECT Video.id_video, Video.nombre, Video.descripcion, Video.creador, Video.nombre_archivo, Categoria.nombre AS Expr1 FROM Video INNER JOIN Categoria ON Video.id_categoria = Categoria.id_categoria">
    </asp:SqlDataSource>
</asp:Content>
