Public Class Registrarse
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        FormViewCrearUser.ChangeMode(FormViewMode.Insert)
        Session.Add("idRolDefault", 1)
        Session.Add("fechaActual", Date.Now())
        Session.Add("iconoDefault", "icono")
        Session.Add("biografiaDegault", "biografia")
    End Sub

    Protected Sub FormViewCrearUser_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewPageEventArgs) Handles FormViewCrearUser.PageIndexChanging

    End Sub

    Protected Sub FormViewCrearUser_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewCrearUser.ItemInserted
        'Manejador de Excepciones 
        If (e.Exception Is Nothing) Then
            Me.LabelMensaje.Text = "Usuario agregado Correctamente"
            Me.LabelMensaje.ForeColor = Drawing.Color.Green
        Else


            Me.LabelMensaje.Text = "No se a creado el usuario debido a que el nombre de usuario ya existe  "
            Me.LabelMensaje.ForeColor = Drawing.Color.Red
            Debug.WriteLine("dddddddd")

            Debug.WriteLine(e.Exception.GetType)
            e.ExceptionHandled = True




        End If
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("Login.aspx")
    End Sub

    Protected Sub FormViewCrearUser_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormViewCrearUser.ItemInserting

    End Sub
End Class