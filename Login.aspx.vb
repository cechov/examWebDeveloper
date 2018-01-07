
Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack And User.Identity.IsAuthenticated = True Then
            Response.Redirect("~/user/User.aspx")
        End If

        Dim Login As Panel = CType(Me.Login1.FindControl("Login"), Panel)
        Dim UserName As TextBox = CType(Login.FindControl("UserName"), TextBox)
        UserName.Focus()

    End Sub

    Protected Sub Link_Click(sender As Object, e As EventArgs)
        If PasswordRecovery1.Visible = False Then
            PasswordRecovery1.Visible = True
        Else
            PasswordRecovery1.Visible = False
        End If
    End Sub
End Class
