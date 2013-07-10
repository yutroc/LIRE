<%@ Page Title="Página principal" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="Default.aspx.vb" Inherits="WebApplication3._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        ASP.NET
    </h2>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="id_video" 
        DataSourceID="SqlDataSourceVideos" RepeatColumns="4" 
        RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False">
        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
            Font-Strikeout="False" Font-Underline="False" />
        <ItemTemplate>
            id_video:
            <asp:Label ID="id_videoLabel" runat="server" Text='<%# Eval("id_video") %>' />
            <br />
            nombre:
            <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
            <br />
            url_miniatura_video:<br />
            <a href="<%# "VerVideo.aspx?video=" & Eval("id_video")%>">
                <asp:Image ID="Image1" runat="server" Height="108px" 
                ImageUrl='<%# Eval("url_miniatura_video") %>' Width="228px" />
            </a>
        <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSourceVideos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
        
        SelectCommand="SELECT [id_video], [nombre], [url_miniatura_video] FROM [Video]">
    </asp:SqlDataSource>
    </asp:Content>
