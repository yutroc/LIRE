Imports System.Data.SqlClient

Public Class Login
    Inherits System.Web.UI.Page
    Private nombreUsuario As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session.Item("idRol") = 6

    End Sub
    Protected Sub LoginUser_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles LoginUser.Authenticate
        'Debug.WriteLine("holamiundo")
        If (validarUsuario(LoginUser.UserName, LoginUser.Password)) Then
            'FormsAuthentication.RedirectFromLoginPage(LoginUser.UserName, LoginUser.RememberMeSet)
            FormsAuthentication.RedirectFromLoginPage(nombreUsuario, LoginUser.RememberMeSet)

            
        End If

    End Sub

    Protected Function validarUsuario(ByVal login As String, ByRef password As String) As Boolean

        Dim consultaSQL As String
        Dim usuarioEncontrado As Boolean
        usuarioEncontrado = False
        ' consultaSQL = "SELECT nombres,numero_vendedor FROM Vendedor WHERE apaterno='" & login.Trim() & "' AND password='" & password & "' "
        consultaSQL = "SELECT * FROM usuario WHERE usuario.username='" & login.Trim() & "' AND password='" & password & "' "
        'select * from usuario where usuario.username='yutroc'and password=123
        Dim conectar As String = ConfigurationManager.ConnectionStrings("LireConnectionString").ConnectionString
        Dim sqlconectar As SqlConnection = New SqlConnection(conectar)
        Dim cmd As SqlCommand = New SqlCommand(consultaSQL, sqlconectar)
        cmd.Connection.Open()

        Try
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If (dr.HasRows) Then
                dr.Read()
                usuarioEncontrado = True
                nombreUsuario = dr("username")
                Session.Add("password", dr("password"))
                Session.Add("idRol", dr("id_rol"))
                Roles.CreateRole("admin")


                Debug.WriteLine(dr("id_rol"))
            End If
        Catch ex As Exception

        End Try

        cmd.Connection.Close()
        Return usuarioEncontrado
    End Function

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Session.Add("idRolDefault", "1")
        Session.Add("fechaActual", Date.Now())
        Session.Add("iconoDefault", "icono")
        Session.Add("biografiaDegault", "biografia")
        Response.Redirect("Registrarse.aspx")
    End Sub
End Class