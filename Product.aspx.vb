
Partial Class Product
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim EditButton As ImageButton = CType(Me.FormViewProduct.FindControl("EditButton"), ImageButton)
        Dim BrukernavnLabel As HyperLink = CType(Me.FormViewProduct.FindControl("BrukernavnLabel"), HyperLink)
        Dim plusbuttoningredients As HyperLink = CType(Me.FormViewProduct.FindControl("plusbuttoningredients"), HyperLink)
        Dim plusbuttonallergens As HyperLink = CType(Me.FormViewProduct.FindControl("plusbuttonallergens"), HyperLink)
        Dim IngredientsEditListView As ListView = CType(Me.FormViewProduct.FindControl("IngredientsEditListView"), ListView)
        Dim IngredientsListView As ListView = CType(Me.FormViewProduct.FindControl("IngredientsListView"), ListView)
        Dim AllergenerEditListView As ListView = CType(Me.FormViewProduct.FindControl("AllergenerEditListView"), ListView)
        Dim AllergenerListView As ListView = CType(Me.FormViewProduct.FindControl("AllergenerListView"), ListView)
        Dim imgChar As Image = CType(Me.FormViewProduct.FindControl("imgChar"), Image)
        Dim lblPlace As Label = CType(Me.FormViewProduct.FindControl("lblPlace"), Label)
        Dim FremgangstidImg As Image = CType(Me.FormViewProduct.FindControl("FremgangstidImg"), Image)
        Dim FremgangstidLabel As Label = CType(Me.FormViewProduct.FindControl("FremgangstidLabel"), Label)
        Dim minutes As Label = CType(Me.FormViewProduct.FindControl("minutes"), Label)
        Dim FremgangsmåteLabel As Label = CType(Me.FormViewProduct.FindControl("FremgangsmåteLabel"), Label)

        If Not IsPostBack Then
            If User.Identity.Name = BrukernavnLabel.Text Then
                EditButton.Visible = True
                plusbuttoningredients.Visible = True
                plusbuttonallergens.Visible = True
                IngredientsEditListView.Visible = True
                IngredientsListView.Visible = False
                AllergenerEditListView.Visible = True
                AllergenerListView.Visible = False
            Else
                EditButton.Visible = False
                plusbuttoningredients.Visible = False
                plusbuttonallergens.Visible = False
                IngredientsEditListView.Visible = False
                IngredientsListView.Visible = True
                AllergenerEditListView.Visible = False
                AllergenerListView.Visible = True

                If Not FremgangstidLabel.Text > "" Then
                    FremgangstidImg.Visible = False
                    minutes.Visible = False
                End If

                If Not FremgangsmåteLabel.Text > "" And FremgangstidLabel.Text = "" Then
                    FremgangsmåteLabel.Text = "Det er ikke lagt til en fremgangsmåte."
                End If
            End If

            If lblPlace.Text = "" Then
                lblPlace.Text = "Hjemme"
                imgChar.Visible = False
            End If

            If User.Identity.IsAuthenticated Then
                Dim LikeLoginView As LoginView = CType(Me.FormViewProduct.FindControl("LikeLoginView"), LoginView)
                Dim LikeFormView As FormView = CType(LikeLoginView.FindControl("LikeFormView"), FormView)
                LikeFormView.DataBind()
            End If

        End If
    End Sub

    Protected Sub FormViewProduct_ItemUpdated(sender As Object, e As FormViewUpdatedEventArgs) Handles FormViewProduct.ItemUpdated
        Response.Redirect(Request.RawUrl)
    End Sub

    Protected Sub InsertButton_Click(sender As Object, e As ImageClickEventArgs)
        Dim NewComment As FormView = CType(Me.LoginView4.FindControl("NewComment"), FormView)
        Dim pNewComment As Panel = CType(NewComment.FindControl("pNewComment"), Panel)
        Dim TittelTextBox As TextBox = CType(pNewComment.FindControl("TittelTextBox"), TextBox)
        Dim KommentarTextBox As TextBox = CType(pNewComment.FindControl("KommentarTextBox"), TextBox)
        Dim InsertButton As ImageButton = CType(pNewComment.FindControl("InsertButton"), ImageButton)

        If TittelTextBox.Text = "" Or KommentarTextBox.Text = "" Then
            Response.Redirect(Request.RawUrl)
        End If
    End Sub

    Public Sub LikeFormView_DataBound(sender As Object, e As EventArgs)
        Dim LikeLoginView As LoginView = CType(Me.FormViewProduct.FindControl("LikeLoginView"), LoginView)
        Dim LikeFormView As FormView = CType(LikeLoginView.FindControl("LikeFormView"), FormView)

        If LikeFormView.DataItemCount = 0 Then
            LikeFormView.ChangeMode(FormViewMode.Insert)
        Else
            LikeFormView.ChangeMode(FormViewMode.ReadOnly)
        End If
    End Sub

    Protected Sub FormViewProduct_ItemUpdating(sender As Object, e As FormViewUpdateEventArgs)
        Dim FileUpload1 As FileUpload = CType(Me.FormViewProduct.FindControl("FileUpload1"), FileUpload)

        If FileUpload1.HasFile Then
            Dim fileExt As String
            fileExt = System.IO.Path.GetExtension(FileUpload1.FileName)

            If (fileExt = ".jpg") And FileUpload1.PostedFile.ContentLength < 1024000 Then
                FileUpload1.SaveAs(Server.MapPath("uploads\ ") & "product_" & Request.QueryString("ID") & fileExt)
                e.NewValues.Item("Produktbilde") = "product_" & Request.QueryString("ID") & fileExt
            End If
        End If
    End Sub
End Class
