<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="AdminComments.aspx.vb" Inherits="admin_AdminComments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="ProductUnderHeadline">
                Administrer kommentarer
                <hr class="ProductUnderLine" />
            </div>

            <%
                'Place pagecount
                If (AdminProducts.Rows.Count > 0) Then
                    Response.Write("<div class='col-sm-12 PageCount'>Nå vises side " & AdminProducts.PageIndex + 1 & " av " & AdminProducts.PageCount() & "</div>")
                End If
            %>

            <asp:GridView ID="AdminProducts" runat="server" CssClass="col-sm-12" BorderStyle="None" GridLines="Horizontal" CellPadding="5" ForeColor="Black" EmptyDataText="Du har ikke opprettet noen anmeldelser." AllowPaging="True" AutoGenerateColumns="False" DataSourceID="CommentsDataSource" DataKeyNames="CommentID" AllowSorting="True">
                <Columns>
                    <asp:TemplateField HeaderText="Alert" SortExpression="Alert" HeaderStyle-Width="10%">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbAlert" runat="server" Checked='<%# Convert.ToBoolean(Eval("Alert")) %>' AutoPostBack="true" CausesValidation="True" OnCheckedChanged="cbAlert_CheckedChanged" Text='<%# If(Eval("Alert").ToString().Equals("True"), " Rapportert ", " Godkjent ") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Overskrift" HeaderText="Overskrift" SortExpression="Overskrift" HeaderStyle-Width="20%" />
                    <asp:TemplateField HeaderText="Brukernavn" SortExpression="Brukernavn">
                        <ItemTemplate>
                            <asp:HyperLink ID="BrukernavnLabel" runat="server" CssClass="link" Text='<%# Bind("Brukernavn") %>' NavigateUrl='<%# Eval("Brukernavn", "~/Profile.aspx?Usr={0}") %>'></asp:HyperLink> 
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Tittel" HeaderText="Tittel" SortExpression="Tittel" />
                    <asp:BoundField DataField="Kommentar" HeaderText="Kommentar" SortExpression="Kommentar" HeaderStyle-Width="30%" />
                    <asp:BoundField DataField="Dato" HeaderText="Dato" SortExpression="Dato" DataFormatString="{0:d}" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton Id="GoProduct" runat="server" ImageUrl="~/img/go.gif" CssClass="GoImg" Width="10" PostBackUrl='<%# Eval("ProductID", "~/Product.aspx?ID={0}")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:LinkButton Id="DeleteComment" runat="server" CssClass="link" CommandName="Delete" Text="&times;" OnClientClick="return confirm('Vennligst bekreft sletting av kommentar. Denne handlingen kan ikke angres.')"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle CssClass="HeaderStyle" ForeColor="white" />
                <RowStyle CssClass="RowStyle" />
                <PagerStyle CssClass="PagerStyle" ForeColor="#BD1D2D" HorizontalAlign="Right" />
            </asp:GridView>


    <asp:SqlDataSource ID="CommentsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>" 
        SelectCommand="SELECT * FROM [Comments] LEFT JOIN [Product] ON [Comments].[ProductID] = [Product].[ProductID] ORDER BY [Comments].[Dato] DESC" 
        DeleteCommand="DELETE FROM [Comments] WHERE [CommentID] = @CommentID" 
        InsertCommand="INSERT INTO [Comments] ([ProductID], [Brukernavn], [Tittel], [Kommentar], [Dato], [Alert]) VALUES (@ProductID, @Brukernavn, @Tittel, @Kommentar, @Dato, @Alert)" 
        UpdateCommand="UPDATE [Comments] SET [ProductID] = @ProductID, [Brukernavn] = @Brukernavn, [Tittel] = @Tittel, [Kommentar] = @Kommentar, [Dato] = @Dato, [Alert] = @Alert WHERE [CommentID] = @CommentID">
        <DeleteParameters>
            <asp:Parameter Name="CommentID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductID" Type="Int32" />
            <asp:Parameter Name="Brukernavn" Type="String" />
            <asp:Parameter Name="Tittel" Type="String" />
            <asp:Parameter Name="Kommentar" Type="String" />
            <asp:Parameter DbType="Date" Name="Dato" />
            <asp:Parameter Name="Alert" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ProductID" Type="Int32" />
            <asp:Parameter Name="Brukernavn" Type="String" />
            <asp:Parameter Name="Tittel" Type="String" />
            <asp:Parameter Name="Kommentar" Type="String" />
            <asp:Parameter DbType="Date" Name="Dato" />
            <asp:Parameter Name="Alert" Type="Boolean" />
            <asp:Parameter Name="CommentID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

