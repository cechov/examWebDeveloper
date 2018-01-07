<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="col-xs-12">
                <div class="ProductUnderHeadline">
                    Ukens produkt
                    <hr class="ProductUnderLine" />
                </div>
            </div>

            <div class="col-xs-12">
                <asp:FormView ID="fwWeeksProduct" runat="server" DataSourceID="ProductDataSource">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlWeeksProduct" runat="server" NavigateUrl='<%# Eval("ProductID", "~/Product.aspx?ID={0}")%>' >
                        <div class="redline">
                            <div class="wrapWeeksProduct col-sm-6 hidden-xs">
                                <asp:Image ID="Image1" runat="server" CssClass="imgWeeksProduct" ImageUrl='<%# Util.imgURL(Eval("Produktbilde", "~/uploads/{0}"), "~/img/missingS.gif")%>' />
                            </div>
                            <asp:Image ID="Image2" runat="server" CssClass="col-xs-12 visible-xs" ImageUrl='<%# Util.imgURL(Eval("Produktbilde", "~/uploads/{0}"), "~/img/missing.gif")%>' />
                            <div class="clear visible-xs"><br /></div>
                            <div class="col-sm-6">
                                <asp:Image ID="KategoriImage" runat="server" CssClass="ProductIconCat right" ImageUrl='<%# Eval("Kategori", "~/img/cat_{0}.gif")%>' />
                                <asp:Image ID="StyrkeImage" runat="server" CssClass="ProductIconSpice right" ImageUrl='<%# Eval("Styrke", "~/img/spice_{0}.gif")%>' />
                                <asp:Label ID="OverskriftLabel" runat="server" Text='<%# Bind("Overskrift") %>' CssClass="lblWeeksHeadline left"></asp:Label>
                                <br />
                                <hr/>
                                <asp:Label ID="IngressLabel" runat="server" Text='<%# Bind("Ingress") %>' />
                            </div>
                            <div class="clear"></div>
                        </div>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:FormView>
            </div>
            
            <div class="clear"><br /><br /></div>
            
            <div class="col-xs-12">
                <div class="ProductUnderHeadline">
                    Våre mest populære produkter
                    <hr class="ProductUnderLine" />
                </div>
            </div>

            <div class="col-xs-12">
                <asp:ListView ID="lwTopProduct" runat="server" DataKeyNames="ProductID" DataSourceID="TopProductDataSource" >
                    <ItemTemplate>
                        <asp:HyperLink ID="hlTopProduct" runat="server" CssClass="col-md-4 col-sm-6 col-xs-12 hlTopProduct" NavigateUrl='<%# Eval("ProductID", "~/Product.aspx?ID={0}")%>'>
                            <div class="TopProduct">  
                                <div class="imgTopProduct">
                                    <asp:Image ID="Image3" runat="server" ImageUrl='<%# Util.imgURL(Eval("Produktbilde", "~/uploads/{0}"), "~/img/missingS.gif")%>' Width="100%" />
                                </div>
                                <br />
                                <asp:Image ID="CommentImage" runat="server" ImageUrl="~/img/comments.gif" CssClass="TopProdIcon" />
                                <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("commentcount") %>' />
                                <asp:Image ID="HeartImage" runat="server" ImageUrl="~/img/heart.gif" CssClass="TopProdIcon" />
                                <asp:Label ID="HeartLabel" runat="server" Text='<%# Eval("productheart") %>' />
                                <br /><br />
                                <asp:Label ID="OverskriftLabel" runat="server" Text ='<%# If(Len(Eval("Overskrift").ToString()) > 20, Eval("Overskrift").Substring(0, 20) & "...", Eval("Overskrift"))%>' />
                                <br />
                            </div>
                            <br />
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:ListView>
            </div>
            
            <div class="clear"><br /><br /></div>

    <asp:SqlDataSource ID="ProductDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>" 
                SelectCommand="SELECT TOP 1 * FROM [Product] ORDER BY [ProductID] DESC" >
            </asp:SqlDataSource>

    <asp:SqlDataSource ID="TopProductDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>" 
                SelectCommand="SELECT TOP 6 [Product].[ProductID], [Product].[Overskrift], [Product].[Produktbilde], [Product].[Kategori], [Product].[Styrke], COALESCE(x.cnt,0) AS commentcount, COALESCE(y.cnt,0) AS productheart FROM [Product] LEFT OUTER JOIN (SELECT [Comments].[ProductID], COUNT(*) cnt FROM [Comments] GROUP BY [Comments].[ProductID]) x ON [Product].[ProductID] = x.ProductID LEFT OUTER JOIN (SELECT [UserFavourites].[ProductID], COUNT(*) cnt FROM [UserFavourites] GROUP BY [UserFavourites].[ProductID]) y ON [Product].[ProductID] = y.ProductID ORDER BY productheart DESC" >
    </asp:SqlDataSource> 

</asp:Content>

