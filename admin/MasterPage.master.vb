
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub xsSearchBtn_Click(sender As Object, e As ImageClickEventArgs) Handles xsSearchBtn.Click
        If xsSearchBox.Text > "" Then
            Response.Redirect("~/SearchResult.aspx?KEY=" & xsSearchBox.Text)
        End If
    End Sub

    Protected Sub Search_Click(sender As Object, e As ImageClickEventArgs) Handles Search.Click
        If lgSearchWrap.Visible = False Then
            lgSearchWrap.Visible = True
            lgSearchBox.Focus()
        Else
            If lgSearchBox.Text > "" Then
                Response.Redirect("~/SearchResult.aspx?KEY=" & lgSearchBox.Text)
            Else
                lgSearchWrap.Visible = False
            End If
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            lgSearchWrap.Visible = False
        End If
    End Sub
End Class

