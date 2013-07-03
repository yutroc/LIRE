Public Class Site
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub HeadLoginView_ViewChanged(ByVal sender As Object, ByVal e As EventArgs) Handles HeadLoginView.ViewChanged

    End Sub

    Protected Sub HeadLoginView_ViewChanging(ByVal sender As Object, ByVal e As EventArgs) Handles HeadLoginView.ViewChanging
        Session.Item("idRol") = 11
    End Sub

    Protected Sub HeadLoginStatus_LoggingOut(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.LoginCancelEventArgs)
        Session.Item("idRol") = 11
    End Sub
End Class