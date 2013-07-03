Public Class Usuario
    Inherits System.Web.UI.Page
    Dim contador As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridViewUsuarios_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewUsuarios.SelectedIndexChanged
        Dim username As String
        username = GridViewUsuarios.SelectedDataKey.Value
        Debug.WriteLine(username)
        Session.Add("username", username)
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Session.Remove("usuario")
        FormViewUsuario.ChangeMode(FormViewMode.Insert)
    End Sub

    Protected Sub FormViewTipoReporte_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewUsuario.ItemInserted
        Response.Redirect("Usuario.aspx")
    End Sub

    Protected Sub Calendar1_Load(ByVal sender As Object, ByVal e As EventArgs)
        Dim calendario As Calendar = CType(Me.FormViewUsuario.FindControl("Calendar1"), Calendar)
        calendario.SelectedDate = DateTime.Today
        calendario.VisibleDate = DateTime.Today
        Session.Add("fecha_registro", DateTime.Today)
        Debug.WriteLine(calendario.SelectedDate)

    End Sub

    Protected Sub FormViewUsuario_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewUsuario.ItemUpdated
        Response.Redirect("Usuario.aspx")
    End Sub

    Protected Sub FormViewUsuario_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles FormViewUsuario.ItemDeleted
        Response.Redirect("Usuario.aspx")
    End Sub

    Protected Sub GridViewUsuarios_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewUsuarios.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            contador = 0
        End If

        If (e.Row.RowType = DataControlRowType.DataRow) Then
            contador = contador + 1
        End If

        If (e.Row.RowType = DataControlRowType.Footer) Then
            e.Row.Cells(1).Text = "Cantidad de Usuarios: " & contador
        End If
    End Sub
End Class