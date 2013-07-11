<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MasComentado.aspx.vb" Inherits="WebApplication3.MasComentado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>Reporte DE LOS VIDEOS MÁS Comentados</h2>
<div style="margin-left: 240px">
    <asp:Chart ID="GraficoMasComentado" runat="server" 
        DataSourceID="SqlDataSourceMasComentado">
        <Series>
            <asp:Series Name="Series1" XValueMember="nombre" YValueMembers="Comentarios" 
                YValuesPerPoint="4">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSourceMasComentado" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" SelectCommand="select top 5 Video.nombre, count(Comentario.id_video)as Comentarios
from Comentario, Video
where Video.id_video = Comentario.id_video
group by Video.nombre
order by Comentarios desc;"></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;
</div>
<div style="margin-left: 320px">
    <asp:GridView ID="GridViewMasComentado" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="SqlDataSourceMasComentado" ForeColor="#333333" 
        GridLines="None" style="text-align: center" ShowFooter="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                SortExpression="nombre" />
            <asp:BoundField DataField="Comentarios" HeaderText="N ° Comentarios" 
                ReadOnly="True" SortExpression="Comentarios" />
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
</div>
</asp:Content>
