Public Class Comentario
    Inherits System.Web.UI.Page
    Dim contador As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridViewComentario_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewComentario.SelectedIndexChanged
        Dim fechaComentario As String
        Dim username As String
        fechaComentario = GridViewComentario.Rows(GridViewComentario.SelectedIndex).Cells(3).Text

        username = GridViewComentario.Rows(GridViewComentario.SelectedIndex).Cells(0).Text
        Debug.WriteLine(GridViewComentario.Rows(GridViewComentario.SelectedIndex).Cells(3).Text)
        Session.Add("usernameComentario", username)

        Session.Add("fechaComentario", fechaComentario)


    End Sub

    Protected Sub FFormViewComentario_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles FormViewComentario.ItemDeleted

        Response.Redirect("Comentario.aspx")
    End Sub

    Protected Sub FormViewComentario_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewComentario.ItemInserted
        If (e.Exception Is Nothing) Then
            Me.LabelMensaje.Text = ""
            Me.LabelMensaje.ForeColor = Drawing.Color.Green
        Else
            Me.LabelMensaje.Text = "Solo un comentario al dia"
            Me.LabelMensaje.ForeColor = Drawing.Color.Red
            e.ExceptionHandled = True
        End If
        Response.Redirect("Comentario.aspx")
    End Sub

    Protected Sub FormViewComentario_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewComentario.ItemUpdated
        Response.Redirect("Comentario.aspx")
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Session.Remove("fechaComentario")
        Debug.WriteLine(Session("username"))
        Debug.WriteLine(Session("videoParaComentario"))

        ' 'SqlDataSourceComentario.InsertParameters("username").DefaultValue = Session.Item("usernameComentario")
        'SqlDataSourceComentario.InsertParameters("id_video").DefaultValue = Session.Item("videoParaComentario")
        'SqlDataSourceComentario.InsertParameters("id_video").DefaultValue = "ip"
        FormViewComentario.ChangeMode(FormViewMode.Insert)

    End Sub

    Protected Sub GridViewComentario_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewComentario.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            contador = 0
        End If

        If (e.Row.RowType = DataControlRowType.DataRow) Then
            contador = contador + 1
        End If

        If (e.Row.RowType = DataControlRowType.Footer) Then
            e.Row.Cells(1).Text = "Total de comentarios: " & contador
        End If
        If (contador = 0) Then
            'Me.LabelMensaje.Text = "El video no tiene comentarios"

        End If
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton2.Click
        Response.Redirect("VideoParaComentario.aspx")
    End Sub

    Protected Sub GridViewComentario_DataBound(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewComentario.DataBound
        If (GridViewComentario.Rows.Count < 1) Then
            LabelMensaje.Text = "No hay comentarios para este video"
        Else
            LabelMensaje.Text = ""
        End If
    End Sub

    Protected Sub FormViewComentario_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewPageEventArgs) Handles FormViewComentario.PageIndexChanging

    End Sub
End Class