Public Class VerUsuario
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Request.QueryString("user") IsNot Nothing) Then
            Session.Add("user", Request.QueryString("user").ToString())
        Else
            Session.Add("user", Session.Item("username"))
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles ButtonSeguir.Click
        SqlDataSourceSeguir.InsertParameters("username").DefaultValue = Session.Item("username")
        SqlDataSourceSeguir.InsertParameters("sigue_a").DefaultValue = Session.Item("user")
        SqlDataSourceSeguir.Insert()
    End Sub
End Class