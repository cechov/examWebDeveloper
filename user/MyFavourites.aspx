<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="MyFavourites.aspx.vb" Inherits="user_MyFavourites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="ProductUnderHeadline">
                Mine favoritter
                <hr class="ProductUnderLine" />
            </div>

            <%
                'Place pagecount
                If (MyProducts.Rows.Count > 0) Then
                    Response.Write("<div class='col-sm-12 PageCount'>Nå vises side " & MyProducts.PageIndex + 1 & " av " & MyProducts.PageCount() & "</div>")
                End If
            %>

            <asp:GridView ID="MyProducts" runat="server" CssClass="col-sm-12" BorderStyle="None" GridLines="Horizontal" CellPadding="5" ForeColor="Black" EmptyDataText="Du har ikke lagt til noen favoritter." AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="ProductsDataSource" PageSize="10">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="25%">
                        <ItemTemplate>
                            <asp:Image ID="ImgProduct" runat="server" CssClass="SearchImage" ImageUrl='<%# Util.imgURL(Eval("Produktbilde", "~/uploads/{0}"), "~/img/missing.gif")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Overskrift" HeaderText="Overskrift" SortExpression="Overskrift" ItemStyle-CssClass="bold">
                        <HeaderStyle Width="50%" />
                    </asp:Boundfield>
                    <asp:BoundField DataField="SpiceType" HeaderText="Styrke" SortExpression="Styrke" />
                    <asp:BoundField DataField="CategoryType" HeaderText="Kategori" SortExpression="Kategori" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton Id="GoProduct" runat="server" ImageUrl="~/img/go.gif" CssClass="GoImg" Width="10px" PostBackUrl='<%# Eval("ProductID", "~/Product.aspx?ID={0}")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle CssClass="HeaderStyle" ForeColor="white" />
                <RowStyle CssClass="RowStyle" />
                <PagerStyle CssClass="PagerStyle" ForeColor="#BD1D2D" HorizontalAlign="Right" />
            </asp:GridView>

            <div class="clear"><br /><br /></div>

    <asp:SqlDataSource ID="ProductsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>" 
        SelectCommand="SELECT * FROM [UserFavourites] LEFT JOIN [Product] ON [UserFavourites].[ProductID] = [Product].[ProductID] LEFT JOIN [Styrke] ON [Product].[Styrke] = [Styrke].[SpiceID] LEFT JOIN [Kategori] ON [Product].[Kategori] = [Kategori].[CategoryID] WHERE ([UserFavourites].[Username] = @Brukernavn) ORDER BY [UserFavourites].[ID] DESC">
        <SelectParameters>
            <asp:ProfileParameter Name="Brukernavn" PropertyName="UserName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

