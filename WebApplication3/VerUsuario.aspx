<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="VerUsuario.aspx.vb" Inherits="WebApplication3.VerUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="FormViewUsuario" runat="server" DataKeyNames="username" 
        DataSourceID="SqlDataSourceUsuario">
        <EditItemTemplate>
            username:
            <asp:Label ID="usernameLabel1" runat="server" Text='<%# Eval("username") %>' />
            <br />
            icon_url:
            <asp:TextBox ID="icon_urlTextBox" runat="server" 
                Text='<%# Bind("icon_url") %>' />
            <br />
            biografia:
            <asp:TextBox ID="biografiaTextBox" runat="server" 
                Text='<%# Bind("biografia") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            username:
            <asp:TextBox ID="usernameTextBox" runat="server" 
                Text='<%# Bind("username") %>' />
            <br />
            icon_url:
            <asp:TextBox ID="icon_urlTextBox" runat="server" 
                Text='<%# Bind("icon_url") %>' />
            <br />
            biografia:
            <asp:TextBox ID="biografiaTextBox" runat="server" 
                Text='<%# Bind("biografia") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            username:
            <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
            <br />
            icon_url:
            <asp:Label ID="icon_urlLabel" runat="server" Text='<%# Bind("icon_url") %>' />
            <br />
            biografia:
            <asp:Label ID="biografiaLabel" runat="server" Text='<%# Bind("biografia") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
    <%  If (Not Session.Item("user").Equals(Session.Item("username"))) Then
       %>
            <asp:Button ID="ButtonSeguir" runat="server" Text="Seguir" />
       <%End If%>
    
    <asp:SqlDataSource ID="SqlDataSourceSeguir" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
        DeleteCommand="DELETE FROM [Seguir] WHERE [username] = @username AND [sigue_a] = @sigue_a" 
        InsertCommand="INSERT INTO dbo.Seguir(username, sigue_a, fecha) VALUES (@username, @sigue_a, GETDATE())" 
        SelectCommand="SELECT * FROM [Seguir]" 
        UpdateCommand="UPDATE [Seguir] SET [fecha] = @fecha WHERE [username] = @username AND [sigue_a] = @sigue_a">
        <DeleteParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="sigue_a" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="sigue_a" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="fecha" />
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="sigue_a" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <br />
    <asp:DataList ID="DataListVideos" runat="server" DataKeyField="id_video" 
        DataSourceID="SqlDataSourceVideos">
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
        SelectCommand="SELECT [id_video], [nombre], [url_miniatura_video] FROM [Video] WHERE ([creador] = @creador)">
        <SelectParameters>
            <asp:SessionParameter Name="creador" SessionField="user" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSourceUsuario" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
        SelectCommand="SELECT [username], [icon_url], [biografia] FROM [Usuario] WHERE ([username] = @username)">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="user" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
