Public Class MasVisto
    Inherits System.Web.UI.Page
    Dim totalCantidad As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridViewVMasVisto_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewVMasVisto.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            totalCantidad = 0
        End If

        If (e.Row.RowType = DataControlRowType.DataRow) Then
            Dim subTotalCantidad As Integer
            Try
                subTotalCantidad = e.Row.Cells(1).Text
            Catch ex As Exception
                subTotalCantidad = 0
            End Try
            totalCantidad += subTotalCantidad
        End If

        If (e.Row.RowType = DataControlRowType.Footer) Then
            e.Row.Cells(0).Text = "Total de Visitas: "
            e.Row.Cells(1).Text = totalCantidad
        End If
    End Sub

    Protected Sub CalendarInicio_Load(ByVal sender As Object, ByVal e As EventArgs) Handles CalendarInicio.Load
        If (Me.CalendarInicio.SelectedDate = Date.MinValue) Then
            CalendarInicio.SelectedDate = Date.Now.Date
            LinkButtonInicio.Text = CalendarInicio.SelectedDate
        End If
    End Sub

    Protected Sub CalendarFin_Load(ByVal sender As Object, ByVal e As EventArgs) Handles CalendarFin.Load
        If (Me.CalendarFin.SelectedDate = Date.MinValue) Then
            CalendarFin.SelectedDate = Date.Now.AddDays(1).Date
            LinkButtonFin.Text = CalendarFin.SelectedDate
        End If

    End Sub

    Protected Sub LinkButtonInicio_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButtonInicio.Click
        Me.CalendarInicio.Visible = Not Me.CalendarInicio.Visible
    End Sub

    Protected Sub LinkButtonFin_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButtonFin.Click
        Me.CalendarFin.Visible = Not Me.CalendarFin.Visible
    End Sub

    Protected Sub CalendarInicio_SelectionChanged(ByVal sender As Object, ByVal e As EventArgs) Handles CalendarInicio.SelectionChanged
        LinkButtonInicio.Text = Me.CalendarInicio.SelectedDate
        CalendarInicio.Visible = False
    End Sub

    Protected Sub CalendarFin_SelectionChanged(ByVal sender As Object, ByVal e As EventArgs) Handles CalendarFin.SelectionChanged
        LinkButtonFin.Text = CalendarFin.SelectedDate
        CalendarFin.Visible = False
    End Sub

    Protected Sub GridViewVMasVisto_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewVMasVisto.SelectedIndexChanged

    End Sub
End Class