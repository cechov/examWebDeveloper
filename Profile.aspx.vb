
Partial Class Profile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim FornavnLabel As Label = CType(Me.FormView1.FindControl("FornavnLabel"), Label)
        Dim EtternavnLabel As Label = CType(Me.FormView1.FindControl("EtternavnLabel"), Label)
        Dim AdminInfo As Panel = CType(Me.FormView1.FindControl("AdminInfo"), Panel)
        Dim fDatoLabel As Label = CType(AdminInfo.FindControl("fDatoLabel"), Label)
        Dim age As Label = CType(Me.FormView1.FindControl("age"), Label)
        Dim Email As Label = CType(Me.FormView1.FindControl("Email"), Label)

        If System.Web.HttpContext.Current.User.IsInRole("admin") Then
            AdminInfo.Visible = True
        Else
            AdminInfo.Visible = False
        End If

        If Not IsPostBack Then
            If FornavnLabel.Text = "" Or EtternavnLabel.Text = "" Then
                If FornavnLabel.Text = "" And EtternavnLabel.Text > "" Then
                    FornavnLabel.Text = ""
                ElseIf FornavnLabel.Text > "" And EtternavnLabel.Text = "" Then
                    EtternavnLabel.Text = ""
                Else
                    FornavnLabel.Text = "Ikke oppgitt"
                    EtternavnLabel.Text = ""
                End If
            End If

            If fDatoLabel.Text > "" Then
                Dim format As String = "ddd d/MMM yyy HH:mm"
                Dim curTime As DateTime = DateTime.Now
                Dim birthDate As DateTime = fDatoLabel.Text
                Dim elapsed As TimeSpan
                elapsed = curTime - birthDate
                age.Text = Int(elapsed.Days / 365.25)
            Else
                fDatoLabel.Text = "Ikke oppgitt"
                age.Text = "Ikke oppgitt"
            End If
        End If

        Email.Text = Membership.GetUser(username:=Request.QueryString("Usr")).Email




        Dim UserProductCount As Integer = UserProducts.Rows.Count()

        If UserProductCount > 0 Then
            User.Text = "Siste " & UserProductCount & " anmeldelser"
        Else
            User.Text = "Siste anmeldelser"
        End If
    End Sub
End Class
