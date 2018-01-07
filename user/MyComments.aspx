<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="MyComments.aspx.vb" Inherits="user_MyComments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="ProductUnderHeadline">
                Mine kommentarer
                <hr class="ProductUnderLine" />
            </div>

            <%
                'Place pagecount
                If (MyProducts.Rows.Count > 0) Then
                    Response.Write("<div class='col-sm-12 PageCount'>Nå vises side " & MyProducts.PageIndex + 1 & " av " & MyProducts.PageCount() & "</div>")
                End If
            %>

            <asp:GridView ID="MyProducts" runat="server" CssClass="col-sm-12" BorderStyle="None" GridLines="Horizontal" CellPadding="5" ForeColor="Black" EmptyDataText="Du har ingen kommentarer." AllowPaging="True" AutoGenerateColumns="False" DataSourceID="CommentsDataSource" DataKeyNames="CommentID">
                <Columns>
                    <asp:BoundField DataField="Overskrift" HeaderText="Anmeldelse" SortExpression="Overskrift" />
                    <asp:BoundField DataField="Tittel" HeaderText="Kommentar tittel" SortExpression="Tittel" />
                    <asp:BoundField DataField="Kommentar" HeaderText="Kommentar tekst" SortExpression="Kommentar" />
                    <asp:BoundField DataField="Dato" HeaderText="Dato" SortExpression="Dato" DataFormatString="{0:d}" />
                    <asp:TemplateField HeaderStyle-Width="30px">
                        <ItemTemplate>
                            <asp:ImageButton Id="GoProduct" runat="server" ImageUrl="~/img/go.gif" CssClass="GoImg right" Width="10px" PostBackUrl='<%# Eval("ProductID", "~/Product.aspx?ID={0}")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle CssClass="HeaderStyle" ForeColor="white" />
                <RowStyle CssClass="RowStyle" />
                <PagerStyle CssClass="PagerStyle" ForeColor="#BD1D2D" HorizontalAlign="Right" />
            </asp:GridView>

            <div class="clear"><br /><br /></div>

    <asp:SqlDataSource ID="CommentsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>" 
        SelectCommand="SELECT * FROM [Comments] LEFT JOIN [Product] ON [Comments].[ProductID] = [Product].[ProductID] WHERE ([Comments].[Brukernavn] = @Brukernavn) ORDER BY [Comments].[Dato] DESC">
        <SelectParameters>
            <asp:ProfileParameter Name="Brukernavn" PropertyName="UserName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

