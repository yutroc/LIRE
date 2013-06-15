<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="test.aspx.vb" Inherits="WebApplication3.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<video controls="controls" preload="auto" style="width:640;height:360" >

    <source src="/Videos/Converted/999ba710-3c87-42ec-9815-a6f739065704.mp4" type='video/mp4; codecs="avc1.4D401E, mp4a.40.2"'/>
    <source src="/Videos/Converted/999ba710-3c87-42ec-9815-a6f739065704.webm" type='video/webm; codecs="vp8.0, vorbis"'/>
    <source src="/Videos/Converted/999ba710-3c87-42ec-9815-a6f739065704.ogv" type='video/ogg; codecs="theora, vorbis"'/>

    <object type="application/x-shockwave-flash" data="/js/flowplayer-3.2.11.swf" style="width:640;height:360" width="640" height="360">
       <param name="movie" value="/js/flowplayer-3.2.11.swf" />
       <param name="allowFullScreen" value="true" />
       <param name="wmode" value="transparent" />
       <param name="flashVars" value="config={'playlist':[{'url':'/Converted/4d09fbf5-6063-4700-830b-9bc252fc4519.flv','autoPlay':true}]}" />
    </object>

</video>
</asp:Content>
