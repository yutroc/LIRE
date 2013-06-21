Public Class Usuario
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Dim username As String
        username = GridView1.SelectedDataKey.Value
        Debug.WriteLine(username)
        Session.Add("usuario", username)
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
End Class