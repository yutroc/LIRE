Public Class FormularioActividades
    Inherits System.Web.UI.Page
    Dim contador As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    

    
    Protected Sub GridViewActividades_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewActividades.SelectedIndexChanged
        Dim id As Integer
        id = GridViewActividades.SelectedDataKey.Value
        Session.Add("idActividad", id)


    End Sub

    Protected Sub TextBoxUsuario_TextChanged(ByVal sender As Object, ByVal e As EventArgs) Handles TextBoxUsuario.TextChanged

    End Sub

    Protected Sub GridViewActividades_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewActividades.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            contador = 0
        End If

        If (e.Row.RowType = DataControlRowType.DataRow) Then
            contador = contador + 1
        End If

        If (e.Row.RowType = DataControlRowType.Footer) Then
            e.Row.Cells(1).Text = "Cantidad de actividades realizadas: " & contador
        End If
    End Sub
End Class