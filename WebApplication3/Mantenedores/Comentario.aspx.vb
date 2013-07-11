Public Class Comentario
    Inherits System.Web.UI.Page
    Dim contador As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridViewComentario_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewComentario.SelectedIndexChanged
        Dim fechaComentario As String
        Dim username As String
        Dim idCom As Integer
        idCom = GridViewComentario.SelectedDataKey.Value
        fechaComentario = GridViewComentario.Rows(GridViewComentario.SelectedIndex).Cells(3).Text
        username = GridViewComentario.Rows(GridViewComentario.SelectedIndex).Cells(0).Text
        Debug.WriteLine(GridViewComentario.Rows(GridViewComentario.SelectedIndex).Cells(3).Text)
        Session.Add("usernameComentario", username)
        Session.Add("fechaComentario", fechaComentario)
        Session.Add("idCom", idCom)
    End Sub

    Protected Sub FormViewComentario_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles FormViewComentario.ItemDeleted
        'Manejador de Excepciones 
        'If (e.Exception Is Nothing) Then
        ' Me.LabelMensajeAlerta.Visible = True
        ' Me.LabelMensajeAlerta.Text = "Item eliminado Correctamente"
        'Me.LabelMensajeAlerta.ForeColor = Drawing.Color.Green
        'Else
        '   Me.LabelMensajeAlerta.Visible = True
        '  Me.LabelMensajeAlerta.Text = "No se pudo eliminar el Item"
        ' Me.LabelMensajeAlerta.ForeColor = Drawing.Color.Red
        'e.ExceptionHandled = True
        ' End I
        'GridViewComentario.DataBind()
    End Sub

    Protected Sub FormViewComentario_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewComentario.ItemUpdated
        'Manejador de Excepciones 
        If (e.Exception Is Nothing) Then
            Me.LabelMensajeAlerta.Visible = True
            Me.LabelMensajeAlerta.Text = "Item Actualizado Correctamente"
            Me.LabelMensajeAlerta.ForeColor = Drawing.Color.Green
        Else
            Me.LabelMensajeAlerta.Visible = True
            Me.LabelMensajeAlerta.Text = "No se pudo actualizar el Item"
            Me.LabelMensajeAlerta.ForeColor = Drawing.Color.Red
            e.ExceptionHandled = True
        End If
        GridViewComentario.DataBind()
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

    Protected Sub FormViewComentario_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewPageEventArgs)

    End Sub

    Protected Sub FormViewComentario_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewComentario.ItemInserted
        Response.Redirect("Comentario.aspx")
    End Sub
End Class