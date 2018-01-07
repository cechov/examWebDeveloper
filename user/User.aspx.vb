
Partial Class user_User
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim Usernm As Label = CType(Me.FormView1.FindControl("Usernm"), Label)
        Dim Email As Label = CType(Me.FormView1.FindControl("Email"), Label)
        Dim Passw As Label = CType(Me.FormView1.FindControl("Passw"), Label)

        Usernm.Text = Membership.GetUser().UserName
        Email.Text = Membership.GetUser().Email
        Passw.Text = "*******"
    End Sub

    Protected Sub FormView1_DataBound(sender As Object, e As EventArgs) Handles FormView1.DataBound
        If FormView1.DataItemCount = 0 Then

            ' Get the UserId of the just-added user
            Dim newUser As String = User.Identity.Name()

            ' Insert a new record into UserProfiles
            Dim sQuery As String = "INSERT INTO UserProfiles(Username) VALUES(@Username)"
            Dim consString As String = ConfigurationManager.ConnectionStrings("TacoHeavenConnectionString").ConnectionString

            Using conn As New SqlConnection(consString)
                conn.Open()
                Dim com As New SqlCommand(sQuery, conn)

                com.Parameters.AddWithValue("@Username", newUser)
                com.ExecuteNonQuery()
                conn.Close()
            End Using

            FormView1.DataBind()
        End If
    End Sub

    Protected Sub CustomValidator1_ServerValidate(source As Object, args As ServerValidateEventArgs)
        Dim fDatoTextBox As TextBox = CType(Me.FormView1.FindControl("fDatoTextBox"), TextBox)
        If Not fDatoTextBox.Text = "" Then
            IsDate(fDatoTextBox.Text)
        End If
    End Sub

    Protected Sub FormView1_ItemUpdating(sender As Object, e As FormViewUpdateEventArgs) Handles FormView1.ItemUpdating
        Dim FileUpload1 As FileUpload = CType(Me.FormView1.FindControl("FileUpload1"), FileUpload)

        If FileUpload1.HasFile Then
            Dim fileExt As String
            fileExt = System.IO.Path.GetExtension(FileUpload1.FileName)

            If (fileExt = ".jpg") And FileUpload1.PostedFile.ContentLength < 1024000 Then
                FileUpload1.SaveAs(Server.MapPath("uploads\ ") & "user_" & Membership.GetUser().UserName & fileExt)
                e.NewValues.Item("Profilbilde") = "user_" & Membership.GetUser().UserName & fileExt
            End If
        End If
    End Sub
End Class
