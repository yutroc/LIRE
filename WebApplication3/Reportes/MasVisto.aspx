<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MasVisto.aspx.vb" Inherits="WebApplication3.MasVisto" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Reporte DE LOS VIDEOS MÁS VISTOS</h2>
            <table>
        <tr>
        <td>Desde<br />
            <asp:LinkButton ID="LinkButtonInicio" runat="server">LinkButton</asp:LinkButton>
            </td>
        <td></td>
    
        <td>Hasta<br />
            <asp:LinkButton ID="LinkButtonFin" runat="server">LinkButton</asp:LinkButton>
            </td>
        </tr>
        <tr>
        <td>
            <asp:Calendar ID="CalendarInicio" runat="server" Visible="False"></asp:Calendar>
            </td>
        <td>&nbsp;</td>
        <td style="margin-left: 80px">
            <asp:Calendar ID="CalendarFin" runat="server" Visible="False"></asp:Calendar>
            </td>
        </tr>

        </table>
        <div style="margin-left: 200px">
            <asp:Chart ID="GraficoMasVisto" runat="server" DataSourceID="SqlDataSourceMasVisto" 
            style="text-align: center">
                <series>
                    <asp:Series ChartType="Doughnut" Name="Series1" XValueMember="nombre" 
                    YValueMembers="Videos">
                    </asp:Series>
                </series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
            </asp:Chart>
            <br />
        </div>
        <div style="margin-left: 240px">
            <asp:GridView ID="GridViewVMasVisto" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSourceMasVisto" ForeColor="#333333" 
            GridLines="None" style="text-align: center" ShowFooter="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                    SortExpression="nombre" />
                    <asp:BoundField DataField="Videos" HeaderText="N° de Visitas" 
                    SortExpression="url_path_server" />
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
        <asp:SqlDataSource ID="SqlDataSourceMasVisto" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
            
        SelectCommand="select top 5 Video.nombre, COUNT(Video.id_video) as Videos
from Visita, Video
where Video.id_video=Visita.id_video and (fecha&gt;=@fecha_inicio) and (fecha&lt;= @fecha_fin) 
group by Video.nombre
order by Videos desc;">
            <SelectParameters>
                <asp:ControlParameter ControlID="CalendarInicio" Name="fecha_inicio" 
                    PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="CalendarFin" Name="fecha_fin" 
                    PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
