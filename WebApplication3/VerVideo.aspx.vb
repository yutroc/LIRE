Public Class VerVideo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If (Request.QueryString("video") IsNot Nothing) Then
            Session.Add("ID_VIDEO", Request.QueryString("video").ToString())
            Debug.WriteLine("ID video: " + Session.Item("ID_VIDEO"))
            Dim view As DataView = SqlDataSourceVideo.Select(New DataSourceSelectArguments())
            Dim groupsTable As DataTable = view.ToTable()

            Dim video As String = groupsTable(0)("url_path_server").ToString().Replace(".ogv", "")
            Dim mp4 As String = video + ".mp4"
            Dim webm As String = video + ".webm"
            Dim ogv As String = video + ".ogv"
            Dim flv As String = "config={'playlist':[{'url':'" + video + ".flv','autoPlay':true}]}"
            Session("mp4") = mp4
            Session("webm") = webm
            Session("ogv") = ogv
            Session("flv") = flv
            Try
                SqlDataSourceVisita.InsertParameters.Item("valoracion").DefaultValue = 0
                SqlDataSourceVisita.InsertParameters.Item("fecha").DefaultValue = Date.Now
                SqlDataSourceVisita.InsertParameters.Item("username").DefaultValue = Session.Item("username")
                SqlDataSourceVisita.InsertParameters.Item("id_video").DefaultValue = Session.Item("ID_VIDEO").ToString()
                SqlDataSourceVisita.InsertParameters.Item("ip_cliente").DefaultValue = Context.Request.UserHostAddress
                SqlDataSourceVisita.Insert()
            Catch ex As Exception
                Debug.WriteLine("Usuario ya vio el video")
            End Try
            Dim linkAutor As HyperLink = FormViewTitulo.FindControl("Usuario")
            Dim link As String = groupsTable(0)("creador").ToString()
            linkAutor.NavigateUrl = "VerUsuario.aspx?user=" + link
        End If

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        SqlDataSourceComentarios.InsertParameters.Item("texto").DefaultValue = comentario.Text
        SqlDataSourceComentarios.InsertParameters.Item("fecha").DefaultValue = Date.Now.ToString("yyyy-MM-dd HH:mm:ss")
        SqlDataSourceComentarios.InsertParameters.Item("userFFname").DefaultValue = Session.Item("username")
        SqlDataSourceComentarios.InsertParameters.Item("id_video").DefaultValue = Session.Item("ID_VIDEO").ToString()
        SqlDataSourceComentarios.InsertParameters.Item("ip_cliente").DefaultValue = Context.Request.UserHostAddress
        Debug.WriteLine(Date.Now.ToString("yyyy-MM-dd HH:mm:ss"))
        SqlDataSourceComentarios.Insert()
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button2.Click
        Response.Redirect("Reportar.aspx")
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button3.Click
        Response.Redirect("EditarVideo.aspx")
    End Sub

    Protected Sub Button_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button.Click
        '' SqlDataSourceVideo.SelectCommand = " DELETE  FROM VIDEO WHERE id_video='" & Session.Item("ID_VIDEO") & "'"
        SqlDataSourceVideo.UpdateCommand = " UPDATE Video SET visible = 'false' WHERE id_video='" & Session.Item("ID_VIDEO") & "'"

        'Try
        SqlDataSourceVideo.Update()
        'Catch ex As Exception
        ' Debug.WriteLine("errorororor")

        'TODO
        'Me.labelMensaje.Text = "Error: " & ex.Message
        'Me.labelMensaje.ForeColor = Drawing.Color.Red
        '  End Try
        'Session.Remove("ID_VIDEO")
        Response.Redirect("VerUsuario.aspx")
    End Sub
End Class