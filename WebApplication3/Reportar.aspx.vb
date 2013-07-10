Imports System.Data.SqlClient

Public Class Reportar
    Inherits System.Web.UI.Page

    Private prevPage As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Try
            SqlDataSourceReportar.InsertParameters("username").DefaultValue = Session.Item("username")
            SqlDataSourceReportar.InsertParameters("id_video").DefaultValue = Session.Item("ID_VIDEO")
            SqlDataSourceReportar.InsertParameters("descripcion").DefaultValue = TextBox1.Text
            SqlDataSourceReportar.InsertParameters("fecha").DefaultValue = Date.Now
            SqlDataSourceReportar.InsertParameters("id_tipo_reporte").DefaultValue = DropDownList1.SelectedItem.Value
            SqlDataSourceReportar.Insert()
        Catch ex As SqlException
            Debug.WriteLine(ex.ToString())
        End Try
        Response.Redirect("VerVideo.aspx?video=" + Session.Item("ID_VIDEO"))
    End Sub

    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnOK.Click
        Response.Redirect("VerVideo.aspx?video=" + Session.Item("ID_VIDEO"))
    End Sub
End Class