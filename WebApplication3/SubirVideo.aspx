<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SubirVideo.aspx.vb" Inherits="WebApplication3.SubirVideo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        Video Website - Upload Videos</h1>
    <div>
        <asp:FileUpload ID="videoFile" runat="server" />
        &nbsp;<asp:Button ID="btnUpload" runat="server" Text="Upload video" />
        <br />
    </div>
    <asp:Label ID="lblErrorVideo" runat="server" EnableViewState="False" CssClass="redbold"></asp:Label>

</asp:Content>
