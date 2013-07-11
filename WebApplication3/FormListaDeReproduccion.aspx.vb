Public Class FormListaDeReproduccion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session.Item("idLista") Is Nothing) Then
            FormViewLista.ChangeMode(FormViewMode.Insert)
        ElseIf (Session.Item("Opcion") = 1) Then '1 es editar
            FormViewLista.ChangeMode(FormViewMode.Edit)
        End If





    End Sub

    Protected Sub SqlDataSourceListaDeReproduccion_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSourceListaDeReproduccion.Selecting

    End Sub

   
    Protected Sub SqlDataSourceListaDeReproduccion_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSourceListaDeReproduccion.Inserted

    End Sub

    Protected Sub FormViewLista_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewLista.ItemInserted
        Response.Redirect("ListaDeReproduccion.aspx")
    End Sub

    Protected Sub InsertCancelButton_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("ListaDeReproduccion.aspx")
    End Sub
End Class