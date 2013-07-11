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
            <asp:BoundField DataField="id_comentario" HeaderText="N° Comentario" 
                InsertVisible="False" ReadOnly="True" SortExpression="id_comentario" />
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
        SelectCommand="SELECT * FROM [Comentario] WHERE ([id_video] = @id_video)" 
        ProviderName="System.Data.SqlClient">
        <SelectParameters>
            <asp:SessionParameter Name="id_video" SessionField="videoParaComentario" 
                Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormViewComentario" runat="server" 
        DataKeyNames="id_comentario" 
        DataSourceID="SqlDataSourceComentario" style="margin-right: 1px">
        <EditItemTemplate>
            Comentario:
            <asp:TextBox ID="textoTextBox" runat="server" 
                Text='<%# Bind("texto") %>' />
            <br />
             Fecha:<asp:Label ID="fechaLabel1" runat="server" Text='<%# Eval("fecha") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Actualizar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSourceUsername" DataTextField="username" 
                DataValueField="username" SelectedValue='<%# Bind("username") %>' 
                Visible="False">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceUsername" runat="server" 
                ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
                SelectCommand="SELECT [username] FROM [Usuario] WHERE ([username] = @username)">
                <SelectParameters>
                    <asp:SessionParameter Name="username" SessionField="username" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="DropDownList2" runat="server" 
                DataSourceID="SqlDataSourceVideo" DataTextField="id_video" 
                DataValueField="id_video" SelectedValue='<%# Bind("id_video") %>' 
                Visible="False">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceVideo" runat="server" 
                ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
                SelectCommand="SELECT [id_video] FROM [Video] WHERE ([id_video] = @id_video)">
                <SelectParameters>
                    <asp:SessionParameter Name="id_video" SessionField="videoParaComentario" 
                        Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="DropDownList3" runat="server" 
                SelectedValue='<%# Bind("ip_cliente") %>' Visible="False">
                <asp:ListItem>12</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataFecha" 
                DataTextField="Column1" DataValueField="Column1" 
                SelectedValue='<%# Bind("fecha", "{0:d}") %>' Visible="False">
            </asp:DropDownList>
            <br />
            <asp:SqlDataSource ID="SqlDataFecha" runat="server" 
                ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
                SelectCommand="SELECT SYSDATETIME()"></asp:SqlDataSource>
            <br />
            Comentario:
            <asp:TextBox ID="textoTextBox" runat="server" Text='<%# Bind("texto") %>' />
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="textoTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
            <br />

            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </InsertItemTemplate>
        <ItemTemplate>
            Username:
            <asp:Label ID="usernameLabel" runat="server" Text='<%# Bind("username") %>' />
            <br />
            Video:
            <asp:Label ID="id_videoLabel" runat="server" Text='<%# Bind("id_video") %>' />
            <br />
            Comentario:
            <asp:Label ID="textoLabel" runat="server" Text='<%# Bind("texto") %>' />
            <br />
            Fecha:
            <asp:Label ID="fechaLabel" runat="server" Text='<%# Bind("fecha") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Editar" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Eliminar" OnClientClick="return confirm(&quot;Seguro que lo desea eliminar ?&quot;);"/>
            &nbsp;

        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSourceComentario" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LireConnectionString %>" 
        
        
        
        SelectCommand="SELECT * FROM [Comentario] WHERE ([id_comentario] = @id_comentario)" 
        DeleteCommand="DELETE FROM [Comentario] WHERE [id_comentario] = @original_id_comentario" 
        InsertCommand="INSERT INTO [Comentario] ([username], [id_video], [texto], [fecha], [ip_cliente]) VALUES (@username, @id_video, @texto, @fecha, @ip_cliente)" 
        OldValuesParameterFormatString="original_{0}" 
        ProviderName="System.Data.SqlClient" 
        
        UpdateCommand="UPDATE [Comentario] SET [texto] = @texto WHERE [id_comentario] = @original_id_comentario">
        <DeleteParameters>
            <asp:Parameter Name="original_id_comentario" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="id_video" Type="Decimal" />
            <asp:Parameter Name="texto" Type="String" />
            <asp:Parameter DbType="Date" Name="fecha" />
            <asp:Parameter Name="ip_cliente" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="id_comentario" SessionField="idCom" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="texto" Type="String" />
            <asp:Parameter Name="original_id_comentario" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:LinkButton ID="LinkButton2" runat="server">Volver a escoger video</asp:LinkButton>
</asp:Content>
