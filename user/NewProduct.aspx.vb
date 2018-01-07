
Partial Class user_NewProduct
    Inherits System.Web.UI.Page

    Protected Sub FormViewProduct_ItemInserted(sender As Object, e As FormViewInsertedEventArgs) Handles FormViewProduct.ItemInserted
        Response.Redirect("~/user/MyProducts.aspx")
    End Sub

    Protected Sub PlaceLbl_TextChanged(sender As Object, e As EventArgs)
        Dim PlaceLbl As TextBox = CType(Me.FormViewProduct.FindControl("PlaceLbl"), TextBox)

        If Len(PlaceLbl.Text) > 0 Then
            PlaceLbl.Text = PlaceLbl.Text.Substring(0, 1).ToUpper() + PlaceLbl.Text.Substring(1)
        End If
    End Sub
End Class
