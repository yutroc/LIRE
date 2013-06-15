Public Class FormularioActividades
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    

    
    Protected Sub GridViewActividades_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewActividades.SelectedIndexChanged
        Dim id As Integer
        id = GridViewActividades.SelectedDataKey.Value
        Session.Add("idActividad", id)


    End Sub
End Class