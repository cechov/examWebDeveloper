<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="SearchResult.aspx.vb" Inherits="SearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="ProductUnderHeadline">
                <asp:Label ID="Headline" runat="server" Text=""></asp:Label>
                <hr class="ProductUnderLine" />
            </div>

            <%
                'Place pagecount
                If (SearchResult.Rows.Count > 0) Then
                    Response.Write("<div class='col-sm-12 PageCount'>Nå vises side " & SearchResult.PageIndex + 1 & " av " & SearchResult.PageCount() & "</div>")
                End If
            %>

            <asp:Label ID="NoResult" runat="server" Text=""></asp:Label>

            <asp:GridView ID="SearchResult" runat="server" CssClass="col-sm-12" BorderStyle="None" GridLines="Horizontal" CellPadding="5" ForeColor="Black" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="ProductsDataSource" PageSize="10">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="25%">
                        <ItemTemplate>
                            <asp:Image ID="ImgProduct" runat="server" CssClass="SearchImage" ImageUrl='<%# Util.imgURL(Eval("Produktbilde", "~/uploads/{0}"), "~/img/missing.gif")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Overskrift" HeaderText="Overskrift" SortExpression="Overskrift">
                        <HeaderStyle Width="20%"/>
                    </asp:Boundfield>
                    <asp:TemplateField HeaderText="Sted" SortExpression="Sted">
                        <ItemTemplate>
                            <asp:Label Id="Place" runat="server" Text='<%# Util.lblText(Eval("Sted", "{0}"), "Hjemme")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Karakter" SortExpression="Karakter">
                        <ItemTemplate>
                            <asp:Image Id="Char" runat="server" Width="20px" Visible='<%# Util.imgURL(Eval("Karakter", "True"), "False")%>' ImageUrl='<%# Util.imgURL(Eval("Karakter", "~/img/dice{0}.gif"), "~/img/cancel.gif")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="SpiceType" HeaderText="Styrke" SortExpression="Styrke" />
                    <asp:BoundField DataField="CategoryType" HeaderText="Kategori" SortExpression="Kategori" />
                    <asp:TemplateField HeaderText="Forfatter" SortExpression="Brukernavn">
                        <ItemTemplate>
                            <asp:HyperLink Id="Brukernavn" runat="server" CssClass="link" Text='<%# Eval("Brukernavn")%>' NavigateUrl='<%# Eval("Brukernavn", "~/Profile.aspx?Usr={0}")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
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
    
    <asp:SqlDataSource ID="ProductsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>" 
        SelectCommand="SELECT * FROM [Product] LEFT JOIN [Styrke] ON [Product].[Styrke] = [Styrke].[SpiceID] LEFT JOIN [Kategori] ON [Product].[Kategori] = [Kategori].[CategoryID]">
    </asp:SqlDataSource>

</asp:Content>

