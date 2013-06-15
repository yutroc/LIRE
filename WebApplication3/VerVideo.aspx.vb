Public Class VerVideo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Request.QueryString("Id") IsNot Nothing) Then

            Dim video As String = "/Videos/Converted/" + Request.QueryString("Id").ToString()
            Dim mp4 As String = video + ".mp4"
            Dim webm As String = video + ".webm"
            Dim ogv As String = video + ".ogv"
            Dim flv As String = "config={'playlist':[{'url':'" + "Converted/" + Request.QueryString("Id").ToString() + ".flv','autoPlay':true}]}"
            Session("mp4") = mp4
            Session("webm") = webm
            Session("ogv") = ogv
            Session("flv") = flv
        End If

    End Sub


End Class