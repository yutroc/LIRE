<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="VerVideo.aspx.vb" Inherits="WebApplication3.VerVideo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript"
   src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js">
</script>
 
<!-- 2. flowplayer -->
<script type="text/javascript"
   src="Scripts/flowplayer.js">
</script>
    <link href="Scripts/skin/minimalist.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h1>Video Website - My Video Zone</h1>
    <div class="flowplayer">
        <video controls="controls" preload="auto" style="width:640;height:360" >
            <source  src="<%= Convert.ToString(Session("mp4")) %>" type='video/mp4; codecs="avc1.4D401E, mp4a.40.2"'/>
            <source  src="<%= Convert.ToString(Session("webm")) %>" type='video/webm; codecs="vp8.0, vorbis"'/>
            <source  src="<%= Convert.ToString(Session("ogv")) %>" type='video/ogg; codecs="theora, vorbis"'/>
            <object type="application/x-shockwave-flash" data="/js/flowplayer-3.2.11.swf" style="width:640;height:360" width="640" height="360" >
               <param name="movie" value="/js/flowplayer-3.2.11.swf" />
               <param name="allowFullScreen" value="true" />
               <param name="wmode" value="transparent" />
               <param name="flashVars" value="<%= Convert.ToString(Session("flv")) %>" />               
                         
            </object>
        </video>
    </div>
</asp:Content>
