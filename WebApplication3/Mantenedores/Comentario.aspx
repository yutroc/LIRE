<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Comentario.aspx.vb" Inherits="WebApplication3.Comentario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>Comentarios</h2>
    <asp:Label ID="LabelMensaje" runat="server"></asp:Label>
    <asp:LinkButton ID="LinkButton1" runat="server">Agregar Comenterio</asp:LinkButton>
    <br />
    <asp:Label ID="LabelMensajeAlerta" runat="server"></asp:Label>
    <div class="style1">
    <asp:GridView ID="GridViewComentario" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        DataKeyNames="username,id_video,fecha" DataSourceID="SqlDataSourceComentarios" 
        Width="384px" CellPadding="4" ForeColor="#333333" GridLines="None" 
        ShowFooter="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="username" HeaderText="Username" ReadOnly="True" 
                SortExpression="username" />
            <asp:BoundField DataField="id_video" HeaderText="Codigo Video" ReadOnly="True" 
                SortExpression="id_video" />
            <asp:BoundField DataField="texto" HeaderText="Comentario" 
                SortExpression="texto" />
            <asp:BoundField DataField="fecha" HeaderText="Fecha" ReadOnly="True" 
                SortExpression="fecha" />
            <asp:CommandField ShowSelectButton="True" />
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
    </div>
    <br />
    <asp:SqlDataSource ID="SqlDataSourceComentarios" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
        SelectCommand="SELECT * FROM [Comentario] WHERE ([id_video] = @id_video)">
        <SelectParameters>
            <asp:SessionParameter Name="id_video" SessionField="videoParaComentario" 
                Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormViewComentario" runat="server" 
        DataKeyNames="id_comentario" 
        DataSourceID="SqlDataSourceComentario" style="margin-right: 1px">
        <EditItemTemplate>
            username:
            <asp:TextBox ID="usernameTextBox" runat="server" 
                Text='<%# Bind("username") %>' />
            <br />
            id_video:
            <asp:TextBox ID="id_videoTextBox" runat="server" 
                Text='<%# Bind("id_video") %>' />
            <br />
            texto:
            <asp:TextBox ID="textoTextBox" runat="server" Text='<%# Bind("texto") %>' />
            <br />
            fecha:
            <asp:TextBox ID="fechaTextBox" runat="server" Text='<%# Bind("fecha") %>' />
            <br />
            ip_cliente:
            <asp:TextBox ID="ip_clienteTextBox" runat="server" 
                Text='<%# Bind("ip_cliente") %>' />
            <br />
            id_comentario:
            <asp:Label ID="id_comentarioLabel1" runat="server" 
                Text='<%# Eval("id_comentario") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Actualizar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </EditItemTemplate>
        <InsertItemTemplate>
            username:
            <asp:TextBox ID="usernameTextBox" runat="server" 
                Text='<%# Bind("username") %>' />
            <br />
            id_video:
            <asp:TextBox ID="id_videoTextBox" runat="server" 
                Text='<%# Bind("id_video") %>' />
            <br />
            texto:
            <asp:TextBox ID="textoTextBox" runat="server" Text='<%# Bind("texto") %>' />
            <br />
            fecha:
            <asp:TextBox ID="fechaTextBox" runat="server" Text='<%# Bind("fecha") %>' />
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
            username:
            <asp:Label ID="usernameLabel" runat="server" Text='<%# Bind("username") %>' />
            <br />
            id_video:
            <asp:Label ID="id_videoLabel" runat="server" Text='<%# Bind("id_video") %>' />
            <br />
            texto:
            <asp:Label ID="textoLabel" runat="server" Text='<%# Bind("texto") %>' />
            <br />
            fecha:
            <asp:Label ID="fechaLabel" runat="server" Text='<%# Bind("fecha") %>' />
            <br />
            ip_cliente:
            <asp:Label ID="ip_clienteLabel" runat="server" 
                Text='<%# Bind("ip_cliente") %>' />
            <br />
            id_comentario:
            <asp:Label ID="id_comentarioLabel" runat="server" 
                Text='<%# Eval("id_comentario") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSourceComentario" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
        
        
        SelectCommand="SELECT * FROM [Comentario] WHERE ([id_comentario] = @id_comentario)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewComentario" Name="id_comentario" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:LinkButton ID="LinkButton2" runat="server">Volver a escoger video</asp:LinkButton>
</asp:Content>
