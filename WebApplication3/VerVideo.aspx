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
    <asp:FormView ID="FormViewTitulo" runat="server" DataSourceID="SqlDataSourceVideo" 
        Height="101px" Width="298px">
        <ItemTemplate>
            <asp:Label ID="Titulo" runat="server" Font-Size="Medium" 
                Text='<%# bind("nombre") %>'></asp:Label>
            <br />
            <asp:HyperLink ID="Usuario" runat="server" Text='<%# bind("creador") %>'></asp:HyperLink>
        </ItemTemplate>
    </asp:FormView>
    <br />
    <br />
    <br />
    <div class="flowplayer">
        <video controls="controls" preload="auto" style="width:640;height:360" >
            <source  src="<%= Convert.ToString(Session("mp4")) %>" type='video/mp4; codecs="avc1.4D401E, mp4a.40.2"'/>
            <source  src="<%= Convert.ToString(Session("webm")) %>" type='video/webm; codecs="vp8.0, vorbis"'/>
            <source  src="<%= Convert.ToString(Session("ogv")) %>" type='video/ogg; codecs="theora, vorbis"'/>
            <object type="application/x-shockwave-flash" 
            data="/js/flowplayer-3.2.11.swf" style="width:640px; height:360px" >
               <param name="movie" value="/js/flowplayer-3.2.11.swf" />
               <param name="allowFullScreen" value="true" />
               <param name="wmode" value="transparent" />
               <param name="flashVars" value="<%= Convert.ToString(Session("flv")) %>" />               
                         
            </object>
            
        </video>
    </div>
        <br />
        <asp:FormView ID="FormView1" runat="server" 
        DataSourceID="SqlDataSourceVisita">
            <EditItemTemplate>
                Count:
                <asp:TextBox ID="CountTextBox" runat="server" Text='<%# Bind("Count") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Count:
                <asp:TextBox ID="CountTextBox" runat="server" Text='<%# Bind("Count") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                Visitas:
                <asp:Label ID="CountLabel" runat="server" Text='<%# Bind("Count") %>' />
            </ItemTemplate>
    </asp:FormView>
    <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSourceVideo">
        <ItemTemplate>
            Descripción:
            <asp:Label ID="Label1" runat="server" Text='<%# bind("descripcion") %>'></asp:Label>
        </ItemTemplate>
    </asp:FormView>
    <asp:Button ID="Button2" runat="server" Text="Reportar" OnClientClick="aspnetForm.target ='_blank';"/>
    <asp:FormView ID="FormView3" runat="server" 
        DataSourceID="SqlDataSourceReportar">
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSourceReportar" runat="server">
    </asp:SqlDataSource>
    <br />
&nbsp;<asp:SqlDataSource ID="SqlDataSourceComentarios" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
            DeleteCommand="DELETE FROM [Comentario] WHERE [username] = @username AND [id_video] = @id_video AND [fecha] = @fecha" 
            InsertCommand="INSERT INTO [Comentario] ([username], [id_video], [texto], [fecha], [ip_cliente]) VALUES (@username, @id_video, @texto, @fecha, @ip_cliente)" 
            SelectCommand="SELECT * FROM [Comentario] WHERE ([id_video] = @id_video) ORDER BY [fecha] DESC" 
            UpdateCommand="UPDATE [Comentario] SET [texto] = @texto, [ip_cliente] = @ip_cliente WHERE [username] = @username AND [id_video] = @id_video AND [fecha] = @fecha">
            <DeleteParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="id_video" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="fecha" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="id_video" Type="Decimal" />
                <asp:Parameter Name="texto" Type="String" />
                <asp:Parameter DbType="Date" Name="fecha" />
                <asp:Parameter Name="ip_cliente" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="id_video" SessionField="ID_VIDEO" Type="Decimal" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="texto" Type="String" />
                <asp:Parameter Name="ip_cliente" Type="String" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="id_video" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="fecha" />
            </UpdateParameters>
        </asp:SqlDataSource>
        Comenta:<br />
        <asp:TextBox ID="comentario" runat="server" Height="67px" Width="263px"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Comentar" />
        <br />
        <br />
        <br />
        Comentarios:<asp:DataList ID="DataList1" runat="server" CellPadding="4" 
            DataKeyField="username" DataSourceID="SqlDataSourceComentarios" 
            ForeColor="#333333" Width="342px">
            <AlternatingItemStyle BackColor="White" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <ItemTemplate>
                username:
                <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                <br />
                fecha:
                <asp:Label ID="fechaLabel" runat="server" Text='<%# Eval("fecha") %>' />
                <br />
                texto:
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("texto", "{0}") %>' 
                    Enabled="False" MaxLength="300"></asp:TextBox>
                <br />
<br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        </asp:DataList>
        <br />
        <asp:SqlDataSource ID="SqlDataSourceVideo" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
            SelectCommand="SELECT * FROM [Video] WHERE ([id_video] = @id_video)">
            <SelectParameters>
                <asp:SessionParameter Name="id_video" SessionField="ID_VIDEO" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceVisita" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
        DeleteCommand="DELETE FROM [Visita] WHERE [username] = @username AND [id_video] = @id_video" 
        InsertCommand="INSERT INTO [Visita] ([username], [id_video], [fecha], [valoracion], [ip_cliente]) VALUES (@username, @id_video, @fecha, @valoracion, @ip_cliente)" 
        SelectCommand="SELECT COUNT(fecha) AS Count FROM dbo.Visita WHERE (id_video = @id_video) GROUP BY username, id_video" 
        UpdateCommand="UPDATE [Visita] SET [fecha] = @fecha, [valoracion] = @valoracion, [ip_cliente] = @ip_cliente WHERE [username] = @username AND [id_video] = @id_video">
        <DeleteParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="id_video" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="id_video" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="fecha" />
            <asp:Parameter Name="valoracion" Type="Decimal" />
            <asp:Parameter Name="ip_cliente" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="id_video" SessionField="ID_VIDEO" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="fecha" />
            <asp:Parameter Name="valoracion" Type="Decimal" />
            <asp:Parameter Name="ip_cliente" Type="String" />
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="id_video" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
