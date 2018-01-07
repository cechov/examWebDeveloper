
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim IngressLabel As Label = CType(Me.fwWeeksProduct.FindControl("IngressLabel"), Label)

        If Len(IngressLabel.Text) > 150 Then
            IngressLabel.Text = IngressLabel.Text.Substring(0, 100) & "..."
        Else
            IngressLabel.Text += "..."
        End If
    End Sub
End Class
