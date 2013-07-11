<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MasReportado.aspx.vb" Inherits="WebApplication3.MasReportado" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Reporte DE LOS VIDEOS MÁS REPORTADOS</h2>
    <div style="margin-left: 200px">
        <asp:Chart ID="GraficoMasReportado" runat="server" 
            DataSourceID="SqlDataSourceMasReportado">
            <Series>
                <asp:Series Name="Series1" XValueMember="nombre" YValueMembers="Reportes">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        </div>
        <div style="margin-left: 280px">
            <asp:GridView ID="GridViewMasReportado" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="SqlDataSourceMasReportado" ForeColor="#333333" 
                GridLines="None" style="text-align: center" ShowFooter="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                        SortExpression="nombre" />
                    <asp:BoundField DataField="Reportes" HeaderText="N° Reportes" ReadOnly="True" 
                        SortExpression="Reportes" />
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
        <asp:SqlDataSource ID="SqlDataSourceMasReportado" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" SelectCommand="select top 5 Video.nombre, count(Reporte.id_video)as Reportes
from Reporte, Video
where Video.id_video = Reporte.id_video
group by Video.nombre
order by Reportes desc;"></asp:SqlDataSource>
</asp:Content>
