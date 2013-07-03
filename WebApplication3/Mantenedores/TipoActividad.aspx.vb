Public Class FormularioTipoAvtividad
    Inherits System.Web.UI.Page
    Dim contador As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridViewTipoActividad_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewTipoActividad.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            contador = 0
        End If

        If (e.Row.RowType = DataControlRowType.DataRow) Then
            contador = contador + 1
        End If

        If (e.Row.RowType = DataControlRowType.Footer) Then
            e.Row.Cells(1).Text = "Cantidad de actividades: " & contador
        End If
    End Sub
End Class