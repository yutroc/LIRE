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
End Class