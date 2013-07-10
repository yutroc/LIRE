<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="UsuariosTops.aspx.vb" Inherits="WebApplication3.UsuariosTops" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>LOS USUARIOS QUE MÁS SUBEN VIDEOS</h2>
<div style="margin-left: 240px">
    <asp:Chart ID="GraficoUsuariosTop" runat="server" 
        DataSourceID="SqlDataSourceUsuariosTop">
        <Series>
            <asp:Series ChartType="Pie" Name="Series1" XValueMember="username" 
                YValueMembers="Videos">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSourceUsuariosTop" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" SelectCommand="select top 5 Usuario.username, COUNT(Video.id_video) as Videos
from Usuario, Video
where Usuario.username = Video.creador
group by Usuario.username
order by Videos desc;"></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>
<div style="margin-left: 280px">
    <asp:GridView ID="GridViewUsuariosTop" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="username" DataSourceID="SqlDataSourceUsuariosTop" 
        ForeColor="#333333" GridLines="None" 
        style="text-align: center; margin-top: 0px" ShowFooter="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="username" HeaderText="Usuario " ReadOnly="True" 
                SortExpression="username" />
            <asp:BoundField DataField="Videos" HeaderText="N° Videos Subidos" 
                ReadOnly="True" SortExpression="Videos" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>
</asp:Content>
