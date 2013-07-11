<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ListaDeReproduccion.aspx.vb" Inherits="WebApplication3.ListaDeReproduccion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style1
    {
        margin-left: 40px;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:Button ID="Button" runat="server" Text="Crear nueva lista de reproduccion" />
    <asp:Button ID="Button1" runat="server" Text="Editar tus Listas" />
    <asp:DataList ID="DataList1" runat="server" DataKeyField="id_lista" 
    DataSourceID="SqlDataSourceListaDeReproduccion">
    <ItemTemplate>
        <p class="style1">
            &nbsp;<asp:Label ID="id_listaLabel" runat="server" Text='<%# Eval("id_lista") %>' 
                Visible="False" />
            <br />
            

            <table>
            <tr>
            <td><asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' /></td>
            
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr><asp:DataList ID="DataList2" runat="server" DataKeyField="id_lista" 
                DataSourceID="SqlDataSourceVideo" RepeatDirection="Horizontal" 
                style="margin-top: 13px">
                <ItemTemplate>
                    &nbsp;<br />&nbsp;<asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                    <br />
                    <a href="<%# "VerVideo.aspx?video=" & Eval("id_video")%>">
                    <asp:Image ID="Image1" runat="server" Height="170px" 
                        Width="211px" ImageUrl='<%# Eval("url_miniatura_video") %>' />
                    <br /></a>

                </ItemTemplate>
            </asp:DataList></tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSourceVideo" runat="server" 
                ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
                SelectCommand="SELECT dbo.Video_Lista_Rep.id_lista, dbo.Video_Lista_Rep.id_video AS Expr1, dbo.Video.* FROM dbo.Video_Lista_Rep INNER JOIN dbo.Video ON dbo.Video_Lista_Rep.id_video = dbo.Video.id_video WHERE (dbo.Video_Lista_Rep.id_lista = @id_lista)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="id_listaLabel" Name="id_lista" 
                        PropertyName="Text" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
           
        </p>
    </ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="SqlDataSourceListaDeReproduccion" runat="server" 
    ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
    DeleteCommand="DELETE FROM [Lista_Reproduccion] WHERE [id_lista] = @id_lista" 
    InsertCommand="INSERT INTO [Lista_Reproduccion] ([nombre], [descripcion], [username]) VALUES (@nombre, @descripcion, @username)" 
    SelectCommand="SELECT * FROM [Lista_Reproduccion] WHERE ([username] = @username)" 
    UpdateCommand="UPDATE [Lista_Reproduccion] SET [nombre] = @nombre, [descripcion] = @descripcion, [username] = @username WHERE [id_lista] = @id_lista">
    <DeleteParameters>
        <asp:Parameter Name="id_lista" Type="Decimal" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="nombre" Type="String" />
        <asp:Parameter Name="descripcion" Type="String" />
        <asp:Parameter Name="username" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="username" SessionField="username" Type="String" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="nombre" Type="String" />
        <asp:Parameter Name="descripcion" Type="String" />
        <asp:Parameter Name="username" Type="String" />
        <asp:Parameter Name="id_lista" Type="Decimal" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
