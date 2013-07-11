Public Class ListaDeReproduccion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button.Click
        Session.Remove("numero_region")
        Response.Redirect("FormListaDeReproduccion.aspx")
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs)
        Session.Add("Opcion", 1)


        Response.Redirect("FormListaDeReproduccion.aspx")
    End Sub

    Protected Sub LinkButton3_Click(ByVal sender As Object, ByVal e As EventArgs)
        Debug.WriteLine(Session.Item("id_lista"))
    End Sub

    Protected Sub SqlDataSourceListaDeReproduccion_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSourceListaDeReproduccion.Selecting

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Response.Redirect("EditarListas.aspx")
    End Sub

    Protected Sub r(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList1.DeleteCommand

    End Sub

    Protected Sub DataList1_DataBinding(ByVal sender As Object, ByVal e As EventArgs) Handles DataList1.DataBinding

    End Sub
End Class