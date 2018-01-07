
Partial Class NewUser
    Inherits System.Web.UI.Page

    'Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
    '    If User.Identity.IsAuthenticated = True Then
    '        Response.Redirect("~/user/User.aspx")
    '    End If
    'End Sub

    Protected Sub TermsOfUseLink_Click(sender As Object, e As EventArgs)
        If TermsOfUse.Visible = False Then
            TermsOfUse.Visible = True
        Else
            TermsOfUse.Visible = False
        End If
    End Sub

    Protected Sub NewUserWizard_CreatedUser(ByVal sender As Object, ByVal e As System.EventArgs) Handles NewUserWizard.CreatedUser
        
    End Sub
End Class
