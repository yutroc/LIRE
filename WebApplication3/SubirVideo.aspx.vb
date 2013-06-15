Imports System.IO

Public Class SubirVideo
    Inherits System.Web.UI.Page

    Dim videoOriginalPath As String = "~/Videos/Original/"
    Dim videoConvertedPath = "~/Videos/Converted/"

    Dim videoTmpName As String = String.Empty
    Dim videoConvertedName As String = String.Empty

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Debug.WriteLine("start")
    End Sub
   

    Protected Sub BtnUploadClick(sender As Object, e As EventArgs) Handles btnUpload.Click
        Debug.WriteLine("Obtiene archivo")
        Dim file As HttpPostedFile = videoFile.PostedFile
        Debug.WriteLine("Validar extencion")
        If (Not ValidateVideoExtension(file.FileName)) Then

            lblErrorVideo.Text = "La extension del archivo no es permitido."
            Return
        End If


        Debug.WriteLine("Validar tamaño")
        If (file.InputStream.Length > 52428800) Then

            lblErrorVideo.Text = "El video no puede exceder los 50MB"
            Return
        End If


        Dim saveAs As String = Server.MapPath(videoOriginalPath)
        videoTmpName = Guid.NewGuid().ToString()
        Dim originalVideo As String = saveAs + videoTmpName + New FileInfo(file.FileName).Extension
        file.SaveAs(originalVideo)

        Debug.WriteLine("Codificar ...")
        If (EncodingVideo(originalVideo)) Then
            Response.Redirect("VerVideo.aspx?Id=" + videoTmpName)

        Else
            lblErrorVideo.Text = "Error convirtiendo el video, intente nuevamente"
        End If

    End Sub

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
        Dim saveAs = Server.MapPath(videoConvertedPath)


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
        Debug.WriteLine(value)
        Return True
    End Function
End Class