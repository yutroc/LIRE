Public Class VideoParaComentario
    Inherits System.Web.UI.Page
    Dim contador As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    
    Protected Sub GridViewVideoParaComentario_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewVideoParaComentario.SelectedIndexChanged
        Dim videoParaComentario As String
        videoParaComentario = GridViewVideoParaComentario.SelectedDataKey.Value

        Session.Add("videoParaComentario", videoParaComentario)
        Response.Redirect("Comentario.aspx")
    End Sub

    Protected Sub GridViewVideoParaComentario_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewVideoParaComentario.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            contador = 0
        End If

        If (e.Row.RowType = DataControlRowType.DataRow) Then
            contador = contador + 1
        End If

        If (e.Row.RowType = DataControlRowType.Footer) Then
            e.Row.Cells(1).Text = "Cantidad de videos: " & contador
        End If
    End Sub
End Class