
Partial Class SearchResult
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim key As String = Request.QueryString("KEY")
        ProductsDataSource.SelectCommand += " WHERE Overskrift + Ingress + COALESCE(Sted, '') + CategoryType + SpiceType + Brukernavn LIKE '%" & key & "%'"

        Headline.Text = "Søkeresultat for: <span class='red'> " & key & "</span>"

        If Not (SearchResult.Rows.Count > 0) Then
            NoResult.Text = "Søket ditt ga ingen resultater."
            SearchResult.Visible = False
        End If
    End Sub
End Class
