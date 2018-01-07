<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Products.aspx.vb" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="ProductUnderHeadline">
                Alle anmeldelser
                <hr class="ProductUnderLine" />
            </div>

            <%
                'Place pagecount
                If (MyProducts.Rows.Count > 0) Then
                    Response.Write("<div class='col-sm-12 PageCount'>Nå vises side " & MyProducts.PageIndex + 1 & " av " & MyProducts.PageCount() & "</div>")
                End If
            %>

            <asp:GridView ID="MyProducts" runat="server" CssClass="col-sm-12" BorderStyle="None" GridLines="Horizontal" CellPadding="5" ForeColor="Black" EmptyDataText="Du har ikke opprettet noen anmeldelser." AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="ProductsDataSource" PageSize="10">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="25%">
                        <ItemTemplate>
                            <asp:Image ID="ImgProduct" runat="server" CssClass="SearchImage" ImageUrl='<%# Util.imgURL(Eval("Produktbilde", "~/uploads/{0}"), "~/img/missing.gif")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Overskrift" HeaderText="Overskrift" SortExpression="Overskrift" ItemStyle-CssClass="bold">
                        <HeaderStyle Width="20%" />
                    </asp:Boundfield>
                    <asp:TemplateField HeaderText="Sted" SortExpression="Sted">
                        <ItemTemplate>
                            <asp:Label Id="Place" runat="server" Text='<%# Util.lblText(Eval("Sted", "{0}"), "Hjemme")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Karakter">
                        <ItemTemplate>
                            <asp:Image Id="Char" runat="server" Width="20px" Visible='<%# Util.imgURL(Eval("Karakter", "True"), "False")%>' ImageUrl='<%# Util.imgURL(Eval("Karakter", "~/img/dice{0}.gif"), "~/img/cancel.gif")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="SpiceType" HeaderText="Styrke" SortExpression="Styrke" />
                    <asp:BoundField DataField="Dato" HeaderText="Dato" SortExpression="Dato" DataFormatString="{0:d}" />
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
        SelectCommand="SELECT * FROM [Product] LEFT JOIN [Styrke] ON [Product].[Styrke] = [Styrke].[SpiceID] LEFT JOIN [Kategori] ON [Product].[Kategori] = [Kategori].[CategoryID] ORDER BY [ProductID] DESC">
    </asp:SqlDataSource>
</asp:Content>

