Public Class MasComentado
    Inherits System.Web.UI.Page
    Dim totalCantidad As Integer


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridViewMasComentado_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewMasComentado.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            totalCantidad = 0
        End If

        If (e.Row.RowType = DataControlRowType.DataRow) Then
            Dim subTotalCantidad As Integer
            subTotalCantidad = e.Row.Cells(1).Text
            totalCantidad += subTotalCantidad
        End If

        If (e.Row.RowType = DataControlRowType.Footer) Then
            e.Row.Cells(0).Text = "Total de Comentarios: "
            e.Row.Cells(1).Text = totalCantidad.ToString
        End If
    End Sub
End Class