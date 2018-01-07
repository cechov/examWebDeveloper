Imports Microsoft.VisualBasic

Namespace TH.Utilities

    Public Class Util
        Public Shared Function imgURL(ByVal url As String, ByVal alt As String) As String
            If url > "" Then
                imgURL = url
            Else
                imgURL = alt
            End If
        End Function

        Public Shared Function lblText(ByVal text As String, ByVal alt As String) As String
            If text > "" Then
                lblText = text
            Else
                lblText = alt
            End If
        End Function
    End Class


End Namespace

