<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Usuario.aspx.vb" Inherits="WebApplication3.Usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>Usuario</h2>
    <h2>
        <asp:Button ID="Button1" runat="server" Text="Agregar Usuario" Width="123px" />
    </h2>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="Username" DataSourceID="SqlDataSourceUsuarios" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" 
                    SortExpression="Username" />
                <asp:BoundField DataField="Password" HeaderText="Password" 
                    SortExpression="Password" />
                <asp:BoundField DataField="Rol" HeaderText="Rol" SortExpression="Rol" />
                <asp:BoundField DataField="Email" HeaderText="Email" 
                    SortExpression="Email" />
                <asp:BoundField DataField="Biografia" HeaderText="Biografia" 
                    SortExpression="Biografia" />
                <asp:BoundField DataField="Icono URL" HeaderText="Icono URL" 
                    SortExpression="Icono URL" />
                <asp:BoundField DataField="Fecha Registro" HeaderText="Fecha Registro" 
                    SortExpression="Fecha Registro" DataFormatString="{0:dd/MM/yyyy}" />
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
        <asp:FormView ID="FormViewUsuario" runat="server" CellPadding="4" 
            DataKeyNames="username" DataSourceID="SqlDataSourceUsuario" 
            ForeColor="#333333">
            <EditItemTemplate>
                username:
                <asp:Label ID="usernameLabel1" runat="server" Text='<%# Eval("username") %>' />
                <br />
                password:&nbsp;<asp:TextBox ID="passwordTextBox" runat="server" 
                    Text='<%# Bind("password") %>' />
                <br />
                rol:
                <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="SqlDataSourceRol" DataTextField="nombre" DataValueField="id_rol" 
                    SelectedValue='<%# bind("id_rol") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceRol" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
                    SelectCommand="SELECT [id_rol], [nombre] FROM [Rol]"></asp:SqlDataSource>
                <br />
                email:
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br />
                biografia:
                <asp:TextBox ID="biografiaTextBox" runat="server" 
                    Text='<%# Bind("biografia") %>' />
                <br />
                fecha registro:&nbsp;<asp:Calendar ID="Calendar2" runat="server" BackColor="White" 
                    BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" 
                    DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
                    ForeColor="#003399" Height="200px" SelectedDate='<%# bind("fecha_registro") %>' 
                    Width="220px">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" 
                        Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>
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
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="usernameTextBox">*</asp:RequiredFieldValidator>
                
                <br />
                password:&nbsp;<asp:TextBox ID="passwordTextBox" runat="server" 
                    Text='<%# Bind("password") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="passwordTextBox">*</asp:RequiredFieldValidator>
                <br />
                rol:
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSourceRol" DataTextField="nombre" DataValueField="id_rol" 
                    SelectedIndex='<%# Bind("id_rol") %>' SelectedValue='<%# Bind("id_rol") %>'>
                </asp:DropDownList>
                <br />
                email:
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="emailTextBox" ErrorMessage="*" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <br />
                biografia:
                <asp:TextBox ID="biografiaTextBox" runat="server" 
                    Text='<%# Bind("biografia") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="biografiaTextBox">*</asp:RequiredFieldValidator>
                <br />
                Fecha Registro:&nbsp;<asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                    BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" 
                    DayNameFormat="FirstLetter" Font-Names="Verdana" Font-Size="8pt" 
                    ForeColor="#003399" Height="200px" SelectedDate='<%# bind("fecha_registro") %>' 
                    Width="220px" onload="Calendar1_Load">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" 
                        Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>
                &nbsp;<asp:SqlDataSource ID="SqlDataSourceRol" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
                    SelectCommand="SELECT [id_rol], [nombre] FROM [Rol]"></asp:SqlDataSource>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insertar" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
            </InsertItemTemplate>
            <ItemTemplate>
                username:
                <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                <br />
                password:&nbsp;<asp:Label ID="passwordLabel" runat="server" 
                    Text='<%# Bind("password") %>' />
                <br />
                email:
                <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                <br />
                biografia:
                <asp:Label ID="biografiaLabel" runat="server" Text='<%# Bind("biografia") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Editar" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Eliminar" />
            </ItemTemplate><PagerStyle BackColor="#666666" ForeColor="White" 
                HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSourceUsuario" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
            DeleteCommand="DELETE FROM [Usuario] WHERE [username] = @username" 
            InsertCommand="INSERT INTO Usuario(username, password, email, biografia, fecha_registro, id_rol, icon_url) VALUES (@username, @password, @email, @biografia, @fecha_registro, @id_rol, N'sin url')" 
            SelectCommand="SELECT [username], [password], [email], [biografia] FROM [Usuario] WHERE ([username] = @username)" 
            
            UpdateCommand="UPDATE Usuario SET password = @password, email = @email, biografia = @biografia, id_rol = @id_rol, fecha_registro = @fecha_registro WHERE (username = @username)">
            <DeleteParameters>
                <asp:Parameter Name="username" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="biografia" Type="String" />
                <asp:Parameter Name="fecha_registro" />
                <asp:Parameter Name="id_rol" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="username" SessionField="usuario" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="biografia" Type="String" />
                <asp:Parameter Name="id_rol" />
                <asp:Parameter Name="fecha_registro" />
                <asp:Parameter Name="username" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSourceUsuarios" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
            
            SelectCommand="SELECT Usuario.username AS Username, Usuario.password AS Password, Rol.nombre AS Rol, Usuario.email AS Email, Usuario.biografia AS Biografia, Usuario.icon_url AS [Icono URL], Usuario.fecha_registro AS [Fecha Registro] FROM Usuario INNER JOIN Rol ON Usuario.id_rol = Rol.id_rol">
        </asp:SqlDataSource>
    </p>
</asp:Content>
