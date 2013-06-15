Public Class TipoReporte
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridViewTipoReporte_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewTipoReporte.SelectedIndexChanged
        Dim id As Integer
        id = GridViewTipoReporte.SelectedDataKey.Value
        Session.Add("id_tipo_reporte", id)
    End Sub

    Protected Sub FormViewTipoReporte_ItemInserted(sender As Object, e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewTipoReporte.ItemInserted
        Response.Redirect("TipoReporte.aspx")
    End Sub

    Protected Sub FormViewTipoReporte_ItemDeleted(sender As Object, e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles FormViewTipoReporte.ItemDeleted
        Response.Redirect("TipoReporte.aspx")
    End Sub

    Protected Sub FormViewTipoReporte_ItemUpdated(sender As Object, e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewTipoReporte.ItemUpdated
        Response.Redirect("TipoReporte.aspx")
    End Sub
End Class