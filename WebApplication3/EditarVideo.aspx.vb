Public Class EditarVideo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        FormView1.ChangeMode(FormViewMode.Edit)
    End Sub

    Protected Sub SqlDataSourceVIdeo_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSourceVIdeo.Selecting

    End Sub

    Protected Sub FormView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        Response.Redirect("VerVideo.aspx")
    End Sub

    Protected Sub UpdateCancelButton_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("VerVideo.aspx")
    End Sub
End Class