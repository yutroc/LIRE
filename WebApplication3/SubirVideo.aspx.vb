Imports System.IO

Public Class SubirVideo
    Inherits System.Web.UI.Page

    ReadOnly _videoOriginalPath As String = "~/Videos/Original/"
    ReadOnly _videoConvertedPath = "~/Videos/Converted/"
    ReadOnly _imagePath = "~/Imagenes/Videos/"

    Dim videoTmpName As String = String.Empty
    Dim videoConvertedName As String = String.Empty
    Private saveAs As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        saveAs = Server.MapPath(_videoConvertedPath)
    End Sub

    Protected Function SubirVideo() As Boolean
        Debug.WriteLine("Obtiene archivo")
        Dim file As HttpPostedFile = Me.videoFile.PostedFile
        Debug.WriteLine("Validar extencion")
        If (Not ValidateVideoExtension(file.FileName)) Then
            Dim err = RequiredFieldValidator3
            err.ValidationGroup = "MyGroup"
            err.IsValid = False
            err.ErrorMessage = "La extension del archivo no es permitido."
            Return False
        End If


        Debug.WriteLine("Validar tamaño")
        If (file.InputStream.Length > 52428800) Then
            Dim err = RequiredFieldValidator3
            err.ValidationGroup = "MyGroup"
            err.IsValid = False
            err.ErrorMessage = "El video no puede exceder los 50MB"
            Return False
        End If


        Dim saveAs As String = Server.MapPath(_videoOriginalPath)
        videoTmpName = Guid.NewGuid().ToString()
        Dim originalVideo As String = saveAs + videoTmpName + New FileInfo(file.FileName).Extension
        file.SaveAs(originalVideo)

        Debug.WriteLine("Codificar ...")
        If (EncodingVideo(originalVideo)) Then
            Session.Add("idtemp", videoTmpName)
            'Response.Redirect("VerVideo.aspx?Id=" + videoTmpName)
            Return True

        Else
            Label1.Text = "Error convirtiendo el video, intente nuevamente"
            Return False
        End If

    End Function

    Private Function ValidateVideoExtension(ByVal filename As String) As Boolean
        If filename = String.Empty Then
            Return False
        End If
        Dim info As FileInfo = New FileInfo(filename)
        Debug.WriteLine(info.Extension)
        Select Case info.Extension.ToLower()
            Case ".mpg"
                Return True
            Case ".wmv"
                Return True
            Case ".avi"
                Return True
            Case ".mp4"
                Return True
        End Select
        Return False
    End Function

    Private Function EncodingVideo(ByVal originalVideo As String) As Boolean

        Dim value = 0


        Using enconding As New Process()
            enconding.StartInfo.WorkingDirectory = Server.MapPath("~/")
            enconding.StartInfo.FileName = Server.MapPath("Lib/ffmpeg.exe")
            Debug.WriteLine("-i " + originalVideo + " -vf yadif,scale=640:360 -ab 128k -vcodec libx264 -vpre baseline -vb 1000k " + saveAs + videoTmpName + ".mp4")
            enconding.StartInfo.Arguments = "-i " + originalVideo + " -vf yadif,scale=640:360 -ab 128k -vcodec libx264 -vb 1000k " + saveAs + videoTmpName + ".mp4"
            enconding.StartInfo.UseShellExecute = False
            enconding.StartInfo.CreateNoWindow = True
            enconding.StartInfo.RedirectStandardOutput = True
            enconding.Start()
            enconding.WaitForExit()
            value = value + 1
        End Using

        For index As Integer = 1 To 2
            Using enconding As New Process()
                enconding.StartInfo.WorkingDirectory = Server.MapPath("~/")
                enconding.StartInfo.FileName = Server.MapPath("Lib/ffmpeg.exe")
                enconding.StartInfo.Arguments = "-i " + originalVideo + " -vf yadif,scale=640:360 -ar 44100 -pass " + index.ToString() + " -ab 128k -vcodec libvpx -vb 1000k " + saveAs + videoTmpName + ".webm"
                enconding.StartInfo.UseShellExecute = False
                enconding.StartInfo.CreateNoWindow = True
                enconding.StartInfo.RedirectStandardOutput = True
                enconding.Start()
                enconding.WaitForExit()
                value = value + 1
            End Using
        Next

        Using enconding As New Process()
            enconding.StartInfo.WorkingDirectory = Server.MapPath("~/")
            enconding.StartInfo.FileName = Server.MapPath("Lib/ffmpeg.exe")
            enconding.StartInfo.Arguments = "-i " + originalVideo + " -vf yadif,scale=640:360 -ab 128k -vcodec libtheora -acodec libvorbis -vb 1000k " + saveAs + videoTmpName + ".ogv"
            enconding.StartInfo.UseShellExecute = False
            enconding.StartInfo.CreateNoWindow = True
            enconding.StartInfo.RedirectStandardOutput = True
            enconding.Start()
            enconding.WaitForExit()
            value = value + 1
        End Using

        For index As Integer = 1 To 2
            Using enconding As New Process()
                enconding.StartInfo.WorkingDirectory = Server.MapPath("~/")
                enconding.StartInfo.FileName = Server.MapPath("Lib/ffmpeg.exe")
                enconding.StartInfo.Arguments = "-i " + originalVideo + " -vf yadif,scale=640:360 -ar 44100 -ab 128k -pass " + index.ToString() + " -vcodec flv -vb 1000k " + saveAs + videoTmpName + ".flv"
                enconding.StartInfo.UseShellExecute = False
                enconding.StartInfo.CreateNoWindow = True
                enconding.StartInfo.RedirectStandardOutput = True
                enconding.Start()
                enconding.WaitForExit()
                value = value + 1
            End Using
        Next
        Debug.WriteLine("Valor igual: " + value.ToString())
        Return True
    End Function

    Protected Sub ButtonSubir_Click(ByVal sender As Object, ByVal e As EventArgs) Handles ButtonSubir.Click
        Debug.WriteLine(Me.videoFile.FileName)
        Subiendo.Visible = True
        SubiendoImagen.Visible = True
        Dim urlVideo As String
        Dim urlImagen As String
        If SubirVideo() Then
            Debug.WriteLine(_imagePath + videoTmpName)
            urlVideo = "Videos/Converted/" + videoTmpName + ".ogv"
            urlImagen = "Imagenes/Videos/" + videoTmpName + ".jpg"
            SaveFrameFromVideo(urlVideo, urlImagen)
            Debug.WriteLine("Imagen creada")
			
        End If
        Subiendo.Visible = False
        SubiendoImagen.Visible = False
        SqlDataSourceSubirVideo.InsertParameters("nombre").DefaultValue = nombreTextBox.Text
        SqlDataSourceSubirVideo.InsertParameters("descripcion").DefaultValue = descripcionTextBox.Text
        SqlDataSourceSubirVideo.InsertParameters("url_miniatura_video").DefaultValue = urlImagen
        SqlDataSourceSubirVideo.InsertParameters("creador").DefaultValue = Session.Item("username")
        SqlDataSourceSubirVideo.InsertParameters("nombre_archivo").DefaultValue = videoFile.FileName
        SqlDataSourceSubirVideo.InsertParameters("url_path_server").DefaultValue = urlVideo
        SqlDataSourceSubirVideo.InsertParameters("visible").DefaultValue = True
        SqlDataSourceSubirVideo.InsertParameters("contador").DefaultValue = "0"
        SqlDataSourceSubirVideo.InsertParameters("id_categoria").DefaultValue = DropDownListCategoria.SelectedItem.Value.ToString()
        SqlDataSourceSubirVideo.Insert()

        Response.Redirect("VerVideo.aspx?video=" + Session.Item("ID_VIDEO").ToString())

    End Sub

    Private Sub SaveFrameFromVideo(ByVal input As String, ByVal output As String)
        Using enconding As New Process()
            enconding.StartInfo.WorkingDirectory = Server.MapPath("~/")
            enconding.StartInfo.FileName = Server.MapPath("Lib/ffmpeg.exe")
            Dim arg = " -i " + input + " -r 1 -s 4cif -ss 00:00:03 " + output
            Debug.WriteLine(arg)
            enconding.StartInfo.Arguments = arg
            enconding.StartInfo.UseShellExecute = False
            enconding.StartInfo.CreateNoWindow = True
            enconding.StartInfo.RedirectStandardOutput = True
            enconding.Start()
            enconding.WaitForExit()
            enconding.Close()
        End Using
    End Sub

    Protected Sub SqlDataSourceSubirVideo_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSourceSubirVideo.Inserted
        Session.Add("ID_VIDEO", e.Command.Parameters("@ID_VIDEO").Value)
    End Sub
End Class