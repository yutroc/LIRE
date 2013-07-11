Public Class Categoria
    Inherits System.Web.UI.Page
    Dim contador As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridViewCategoria_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewCategoria.SelectedIndexChanged
        Dim id As Integer
        id = GridViewCategoria.SelectedDataKey.Value
        Session.Add("id", id)
    End Sub


    Protected Sub FormViewCategoria_ItemInserted(sender As Object, e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewCategoria.ItemInserted
        'Manejador de Excepciones 
        If (e.Exception Is Nothing) Then
            Me.LabelMensaje.Visible = True
            Me.LabelMensaje.Text = "Item agregado Correctamente"
            Me.LabelMensaje.ForeColor = Drawing.Color.Green
        Else
            Me.LabelMensaje.Visible = True
            Me.LabelMensaje.Text = "No se pudo agregar el Item"
            Me.LabelMensaje.ForeColor = Drawing.Color.Red
            e.ExceptionHandled = True
        End If
        GridViewCategoria.DataBind()
    End Sub

    Protected Sub FormViewCategoria_ItemDeleted(sender As Object, e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles FormViewCategoria.ItemDeleted
        'Manejador de Excepciones 
        If (e.Exception Is Nothing) Then
            Me.LabelMensaje.Visible = True
            Me.LabelMensaje.Text = "Item eliminado Correctamente"
            Me.LabelMensaje.ForeColor = Drawing.Color.Green
        Else
            Me.LabelMensaje.Visible = True
            Me.LabelMensaje.Text = "No se pudo eliminar el Item"
            Me.LabelMensaje.ForeColor = Drawing.Color.Red
            e.ExceptionHandled = True
        End If
        GridViewCategoria.DataBind()
    End Sub

    Protected Sub FormViewCategoria_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewCategoria.ItemUpdated
        'Manejador de Excepciones 
        If (e.Exception Is Nothing) Then
            Me.LabelMensaje.Visible = True
            Me.LabelMensaje.Text = "Item Actualizado Correctamente"
            Me.LabelMensaje.ForeColor = Drawing.Color.Green
        Else
            Me.LabelMensaje.Visible = True
            Me.LabelMensaje.Text = "No se pudo actualizar el Item"
            Me.LabelMensaje.ForeColor = Drawing.Color.Red
            e.ExceptionHandled = True
        End If
        GridViewCategoria.DataBind()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Session.Remove("id")
        FormViewCategoria.ChangeMode(FormViewMode.Insert)
    End Sub

    Protected Sub FormViewCategoria_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewPageEventArgs) Handles FormViewCategoria.PageIndexChanging

    End Sub

    Protected Sub GridViewCategoria_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewCategoria.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            contador = 0
        End If

        If (e.Row.RowType = DataControlRowType.DataRow) Then
            contador = contador + 1
        End If

        If (e.Row.RowType = DataControlRowType.Footer) Then
            e.Row.Cells(1).Text = "Cantidad de categorias: " & contador
        End If
    End Sub
End Class