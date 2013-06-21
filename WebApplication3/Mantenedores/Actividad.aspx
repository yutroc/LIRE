<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Actividad.aspx.vb" Inherits="WebApplication3.FormularioActividades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Actividades<br />
        &nbsp;</h2>
    <asp:Label ID="Label1" runat="server" Text="Usuario"></asp:Label>
    <asp:TextBox ID="TextBoxUsuario" runat="server" AutoPostBack="True"></asp:TextBox>
        <asp:SqlDataSource ID="SqlDataSourceUsuarios" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
            SelectCommand="SELECT * FROM [Usuario]"></asp:SqlDataSource>
        <asp:GridView ID="GridViewActividades" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
            DataSourceID="SqlDataSourceActividades" CellPadding="4" 
        ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" 
                    ReadOnly="True" SortExpression="ID" InsertVisible="False" />
                <asp:BoundField DataField="Username" HeaderText="Username" 
                    SortExpression="Username" />
                <asp:BoundField DataField="Fecha Registro" HeaderText="Fecha Registro" 
                    SortExpression="Fecha Registro" />
                <asp:BoundField DataField="Privacidad" HeaderText="Privacidad" 
                    SortExpression="Privacidad" />
                <asp:BoundField DataField="Detalle" HeaderText="Detalle" 
                    SortExpression="Detalle" />
                <asp:BoundField DataField="URL" HeaderText="URL" 
                    SortExpression="URL" />
                <asp:BoundField DataField="IP" HeaderText="IP" SortExpression="IP" />
                <asp:BoundField DataField="Tipo Actividad" HeaderText="Tipo Actividad" 
                    SortExpression="Tipo Actividad" />

            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceActividades" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
            DeleteCommand="DELETE FROM [Actividad] WHERE [id_actividad] = @id_actividad" 
            InsertCommand="INSERT INTO [Actividad] ([id_actividad], [username], [fecha], [id_tipo_actividad], [privacidad], [detalle], [url], [ip_cliente]) VALUES (@id_actividad, @username, @fecha, @id_tipo_actividad, @privacidad, @detalle, @url, @ip_cliente)" 
            SelectCommand="SELECT Actividad.id_actividad AS ID, Actividad.username AS Username, Actividad.fecha AS [Fecha Registro], Actividad.privacidad AS Privacidad, Actividad.detalle AS Detalle, Actividad.url AS URL, Actividad.ip_cliente AS IP, Tipo_Actividad.nombre AS [Tipo Actividad] FROM Actividad INNER JOIN Tipo_Actividad ON Actividad.id_tipo_actividad = Tipo_Actividad.id_tipo_actividad WHERE (Actividad.username LIKE '%' + @username + '%')" 
            
        
        UpdateCommand="UPDATE [Actividad] SET [username] = @username, [fecha] = @fecha, [id_tipo_actividad] = @id_tipo_actividad, [privacidad] = @privacidad, [detalle] = @detalle, [url] = @url, [ip_cliente] = @ip_cliente WHERE [id_actividad] = @id_actividad">
            <DeleteParameters>
                <asp:Parameter Name="id_actividad" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id_actividad" Type="Decimal" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter DbType="Date" Name="fecha" />
                <asp:Parameter Name="id_tipo_actividad" Type="Decimal" />
                <asp:Parameter Name="privacidad" Type="Decimal" />
                <asp:Parameter Name="detalle" Type="String" />
                <asp:Parameter Name="url" Type="String" />
                <asp:Parameter Name="ip_cliente" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxUsuario" Name="username" 
                    PropertyName="Text" Type="String" DefaultValue="%" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter DbType="Date" Name="fecha" />
                <asp:Parameter Name="id_tipo_actividad" Type="Decimal" />
                <asp:Parameter Name="privacidad" Type="Decimal" />
                <asp:Parameter Name="detalle" Type="String" />
                <asp:Parameter Name="url" Type="String" />
                <asp:Parameter Name="ip_cliente" Type="String" />
                <asp:Parameter Name="id_actividad" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>

    &nbsp;<asp:FormView ID="FormViewAvtividad" runat="server" DataKeyNames="id_actividad" 
        DataSourceID="SqlDataSourceActividad2" CellPadding="4" ForeColor="#333333">
        <EditItemTemplate>
            id_actividad:
            <asp:Label ID="id_actividadLabel1" runat="server" 
                Text='<%# Eval("id_actividad") %>' />
            <br />
            username:
            <asp:TextBox ID="usernameTextBox" runat="server" 
                Text='<%# Bind("username") %>' />
            <br />
            fecha:
            <asp:TextBox ID="fechaTextBox" runat="server" Text='<%# Bind("fecha") %>' />
            <br />
            id_tipo_actividad:
            <asp:TextBox ID="id_tipo_actividadTextBox" runat="server" 
                Text='<%# Bind("id_tipo_actividad") %>' />
            <br />
            privacidad:
            <asp:TextBox ID="privacidadTextBox" runat="server" 
                Text='<%# Bind("privacidad") %>' />
            <br />
            detalle:
            <asp:TextBox ID="detalleTextBox" runat="server" Text='<%# Bind("detalle") %>' />
            <br />
            url:
            <asp:TextBox ID="urlTextBox" runat="server" Text='<%# Bind("url") %>' />
            <br />
            ip_cliente:
            <asp:TextBox ID="ip_clienteTextBox" runat="server" 
                Text='<%# Bind("ip_cliente") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Actualizar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            username:
            <asp:TextBox ID="usernameTextBox" runat="server" 
                Text='<%# Bind("username") %>' />
            <br />
            fecha:
            <asp:TextBox ID="fechaTextBox" runat="server" Text='<%# Bind("fecha") %>' />
            <br />
            id_tipo_actividad:
            <asp:TextBox ID="id_tipo_actividadTextBox" runat="server" 
                Text='<%# Bind("id_tipo_actividad") %>' />
            <br />
            privacidad:
            <asp:TextBox ID="privacidadTextBox" runat="server" 
                Text='<%# Bind("privacidad") %>' />
            <br />
            detalle:
            <asp:TextBox ID="detalleTextBox" runat="server" Text='<%# Bind("detalle") %>' />
            <br />
            url:
            <asp:TextBox ID="urlTextBox" runat="server" Text='<%# Bind("url") %>' />
            <br />
            ip_cliente:
            <asp:TextBox ID="ip_clienteTextBox" runat="server" 
                Text='<%# Bind("ip_cliente") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </InsertItemTemplate>
        <ItemTemplate>
        <table>
            <tr>
           <td>  id_actividad:</td> 
            <td><asp:Label ID="id_actividadLabel" runat="server" 
                Text='<%# Eval("id_actividad") %>' /></td>
            </tr>
            <tr>
            <td>username:</td>
           <td> <asp:Label ID="usernameLabel" runat="server" Text='<%# Bind("username") %>' /></td>
            </tr>
           <tr>
            <td> fecha:</td> 
            <td> <asp:Label ID="fechaLabel" runat="server" Text='<%# Bind("fecha") %>' /></td> 
            </tr>
            <tr>
            <td> id_tipo_actividad:</td> 
            <td> <asp:Label ID="id_tipo_actividadLabel" runat="server" 
                Text='<%# Bind("id_tipo_actividad") %>' /></td> 
           </tr>
           <tr>
            <td> privacidad:</td> 
           <td> <asp:Label ID="privacidadLabel" runat="server" 
                Text='<%# Bind("privacidad") %>' /></td> 
           </tr>
           <tr>
            <td> detalle:</td> 
            <td> <asp:Label ID="detalleLabel" runat="server" Text='<%# Bind("detalle") %>' /></td> 
            </tr>
            <tr>
            <td> url:</td> 
            <td> <asp:Label ID="urlLabel" runat="server" Text='<%# Bind("url") %>' /></td> 
           </tr>
           <tr>
            <td> ip_cliente:</td> 
           <td>  <asp:Label ID="ip_clienteLabel" runat="server" 
                Text='<%# Bind("ip_cliente") %>' /></td> 
            </tr>
            <tr>
            <td> </td> 
            <td> &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Eliminar"  onclientclick="return confirm(&quot;Seguro  que desea eliminar ?&quot;);" />
            &nbsp;</td> 
             </table>
        </ItemTemplate>
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSourceActividad2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
        DeleteCommand="DELETE FROM [Actividad] WHERE [id_actividad] = @id_actividad" 
        InsertCommand="INSERT INTO [Actividad] ([username], [fecha], [id_tipo_actividad], [privacidad], [detalle], [url], [ip_cliente]) VALUES (@username, @fecha, @id_tipo_actividad, @privacidad, @detalle, @url, @ip_cliente)" 
        SelectCommand="SELECT * FROM [Actividad] WHERE ([id_actividad] = @id_actividad)" 
        UpdateCommand="UPDATE [Actividad] SET [username] = @username, [fecha] = @fecha, [id_tipo_actividad] = @id_tipo_actividad, [privacidad] = @privacidad, [detalle] = @detalle, [url] = @url, [ip_cliente] = @ip_cliente WHERE [id_actividad] = @id_actividad">
        <DeleteParameters>
            <asp:Parameter Name="id_actividad" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter DbType="Date" Name="fecha" />
            <asp:Parameter Name="id_tipo_actividad" Type="Decimal" />
            <asp:Parameter Name="privacidad" Type="Decimal" />
            <asp:Parameter Name="detalle" Type="String" />
            <asp:Parameter Name="url" Type="String" />
            <asp:Parameter Name="ip_cliente" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="id_actividad" SessionField="idActividad" 
                Type="Decimal" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter DbType="Date" Name="fecha" />
            <asp:Parameter Name="id_tipo_actividad" Type="Decimal" />
            <asp:Parameter Name="privacidad" Type="Decimal" />
            <asp:Parameter Name="detalle" Type="String" />
            <asp:Parameter Name="url" Type="String" />
            <asp:Parameter Name="ip_cliente" Type="String" />
            <asp:Parameter Name="id_actividad" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </p>
</asp:Content>
