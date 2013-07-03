Public Class TipoReporte
    Inherits System.Web.UI.Page
    Dim contador As Integer
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

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Session.Remove("id_tipo_reporte")
        FormViewTipoReporte.ChangeMode(FormViewMode.Insert)
    End Sub

    Protected Sub GridViewTipoReporte_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewTipoReporte.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            contador = 0
        End If

        If (e.Row.RowType = DataControlRowType.DataRow) Then
            contador = contador + 1
        End If

        If (e.Row.RowType = DataControlRowType.Footer) Then
            e.Row.Cells(1).Text = "Cantidad de reportes: " & contador
        End If
    End Sub
End Class