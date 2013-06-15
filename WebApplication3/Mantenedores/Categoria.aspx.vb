Public Class Categoria
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridViewCategoria_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewCategoria.SelectedIndexChanged
        Dim id As Integer
        id = GridViewCategoria.SelectedDataKey.Value
        Session.Add("id", id)
    End Sub


    Protected Sub FormViewCategoria_ItemInserted(sender As Object, e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewCategoria.ItemInserted
        Response.Redirect("Categoria.aspx")
    End Sub

    Protected Sub FormViewCategoria_ItemDeleted(sender As Object, e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles FormViewCategoria.ItemDeleted
        Response.Redirect("Categoria.aspx")
    End Sub

    Protected Sub FormViewCategoria_ItemUpdated(sender As Object, e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewCategoria.ItemUpdated
        Response.Redirect("Categoria.aspx")
    End Sub
End Class