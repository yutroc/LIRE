<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SubirVideo.aspx.vb" Inherits="WebApplication3.SubirVideo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <fieldset>
        <legend>Formulario Video</legend>
        <p>
            nombre:<br />
            <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ContolToValidate="nombreTextBox" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="nombreTextBox"></asp:RequiredFieldValidator>
        </p>
        <p>
            descripcion:<br />
            <asp:TextBox ID="descripcionTextBox" runat="server" Height="76px" 
                Text='<%# Bind("descripcion") %>' Width="258px" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="descripcionTextBox" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
        </p>
        <p>
            Archivo:<br />
            <asp:FileUpload ID="videoFile" runat="server" />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="videoFile" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
        </p>
        <p>
            Categoria:<br />
            <asp:DropDownList ID="DropDownListCategoria" runat="server" 
                DataSourceID="SqlDataSourceCategoria" DataTextField="nombre" 
                DataValueField="id_categoria">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="DropDownListCategoria" 
                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            <asp:SqlDataSource ID="SqlDataSourceCategoria" runat="server" 
                ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
                SelectCommand="SELECT [id_categoria], [nombre] FROM [Categoria]">
            </asp:SqlDataSource>
            <br />
        </p>
        
        <asp:Button runat="server" ID="ButtonSubir" Text="Subir"/>
        <div>
            <asp:Image runat="server" ImageUrl="~/Imagenes/ajax-loader.gif" 
                ID="SubiendoImagen" AlternateText="Subiendo" Visible="False"/>
        &nbsp;<br/>
           <asp:Label ID="Subiendo" runat="server" Text="Subiendo video..." 
            Visible="False"></asp:Label>
        </div>
    </fieldset><br />
    <br />
    <br />
    <br />
    

    <asp:SqlDataSource ID="SqlDataSourceSubirVideo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
        DeleteCommand="DELETE FROM [Video] WHERE [id_video] = @id_video" 
        InsertCommand="INSERT INTO [Video] ([nombre], [descripcion], [url_miniatura_video], [creador], [nombre_archivo], [url_path_server], [visible], [contador], [id_categoria]) VALUES (@nombre, @descripcion, @url_miniatura_video, @creador, @nombre_archivo, @url_path_server, @visible, @contador, @id_categoria) SET @ID_VIDEO = Scope_Identity()" 
        SelectCommand="SELECT * FROM [Video]" 
        
        
    UpdateCommand="UPDATE [Video] SET [nombre] = @nombre, [descripcion] = @descripcion, [url_miniatura_video] = @url_miniatura_video, [creador] = @creador, [nombre_archivo] = @nombre_archivo, [url_path_server] = @url_path_server, [visible] = @visible, [contador] = @contador, [id_categoria] = @id_categoria WHERE [id_video] = @id_video">
        <DeleteParameters>
            <asp:Parameter Name="id_video" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="url_miniatura_video" Type="String" />
            <asp:Parameter Name="creador" Type="String" />
            <asp:Parameter Name="nombre_archivo" Type="String" />
            <asp:Parameter Name="url_path_server" Type="String" />
            <asp:Parameter Name="visible" Type="Boolean" />
            <asp:Parameter Name="contador" Type="Decimal" />
            <asp:Parameter Name="id_categoria" Type="Decimal" />
            <asp:Parameter Direction="Output" Name="ID_VIDEO" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="url_miniatura_video" Type="String" />
            <asp:Parameter Name="creador" Type="String" />
            <asp:Parameter Name="nombre_archivo" Type="String" />
            <asp:Parameter Name="url_path_server" Type="String" />
            <asp:Parameter Name="visible" Type="Boolean" />
            <asp:Parameter Name="contador" Type="Decimal" />
            <asp:Parameter Name="id_categoria" Type="Decimal" />
            <asp:Parameter Name="id_video" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div>
        &nbsp;<br />
    </div>
    
</asp:Content>
