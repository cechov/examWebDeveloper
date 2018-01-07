
Partial Class admin_AdminComments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Bind_Data()
        End If
    End Sub

    Private Sub Bind_Data()
        Dim consString As String = ConfigurationManager.ConnectionStrings("TacoHeavenConnectionString").ConnectionString
        Using conn As New SqlConnection(consString)
            Dim cmd As New SqlCommand("SELECT * FROM [Comments]", conn)
            cmd.CommandType = CommandType.Text
            conn.Open()
            AdminProducts.DataBind()
        End Using
    End Sub

    Public Sub cbAlert_CheckedChanged(sender As Object, e As EventArgs)
        Dim cbAlert As CheckBox = DirectCast(sender, CheckBox)
        Dim nID As Int64 = Convert.ToInt64(AdminProducts.DataKeys(DirectCast(cbAlert.NamingContainer, GridViewRow).RowIndex).Value)

        Dim sQuery As String = "UPDATE Comments SET Alert = @Alert WHERE CommentID = @CommentID"
        Dim consString As String = ConfigurationManager.ConnectionStrings("TacoHeavenConnectionString").ConnectionString
        Using conn As New SqlConnection(consString)
            Dim com As New SqlCommand(sQuery, conn)

            com.Parameters.Add("@Alert", SqlDbType.Bit).Value = cbAlert.Checked
            com.Parameters.Add("@CommentID", SqlDbType.BigInt).Value = nID

            conn.Open()
            com.ExecuteNonQuery()
        End Using

        Bind_Data()
    End Sub

End Class
