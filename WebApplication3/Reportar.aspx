<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Reportar.aspx.vb" Inherits="WebApplication3.Reportar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        Tipo Reporte:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSourcetipo" DataTextField="nombre" 
            DataValueField="id_tipo_reporte">
        </asp:DropDownList>
        <br />
        Detalle:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Height="100px" Width="177px"></asp:TextBox>
&nbsp;<asp:SqlDataSource ID="SqlDataSourcetipo" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
            SelectCommand="SELECT * FROM [Tipo_Reporte]"></asp:SqlDataSource>
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click"
            Text="Insertar" />
        <asp:Button ID="btnOK" runat="server"  Text="Cancelar" />
        <br />
        <asp:SqlDataSource ID="SqlDataSourceReportar" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
            DeleteCommand="DELETE FROM [Reporte] WHERE [username] = @username AND [id_video] = @id_video" 
            InsertCommand="INSERT INTO [Reporte] ([descripcion], [fecha], [id_tipo_reporte], [username], [id_video]) VALUES (@descripcion, @fecha, @id_tipo_reporte, @username, @id_video)" 
            SelectCommand="SELECT * FROM [Reporte]" 
            UpdateCommand="UPDATE [Reporte] SET [descripcion] = @descripcion, [fecha] = @fecha, [id_tipo_reporte] = @id_tipo_reporte WHERE [username] = @username AND [id_video] = @id_video">
            <DeleteParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="id_video" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="descripcion" Type="String" />
                <asp:Parameter DbType="Date" Name="fecha" />
                <asp:Parameter Name="id_tipo_reporte" Type="Decimal" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="id_video" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="descripcion" Type="String" />
                <asp:Parameter DbType="Date" Name="fecha" />
                <asp:Parameter Name="id_tipo_reporte" Type="Decimal" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="id_video" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
