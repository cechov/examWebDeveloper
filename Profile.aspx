<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Profile.aspx.vb" Inherits="Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="ProductUnderHeadline">
        Profil
                <hr class="ProductUnderLine" />
    </div>

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="UsersDataSource" DefaultMode="ReadOnly" CssClass="col-xs-12">
        <ItemTemplate>
            <div class="col-md-3">
                <div class="imagebox left">
                    <asp:Image ID="imgProfilbilde" runat="server" Height="100%" ImageUrl='<%# Util.imgURL(Eval("Profilbilde", "~/user/uploads/{0}"), "~/img/user.jpg")%>' />
                </div>
                <div class="clear visible-xs"></div>
            </div>

            <div class="col-md-9">
                <br />
                <asp:Label ID="Label18" runat="server" Text="Kontoinformasjon" CssClass="ProductUnderHeadline"></asp:Label>
                <hr class="ProductUnderLine" />
                <div class="col-sm-4">
                    <asp:Image ID="Image5" runat="server" ImageUrl="~/img/user.gif" Height="40" CssClass="left icons" />
                    <div class="left">
                        <asp:Label ID="Label1" runat="server" Text="Brukernavn:" CssClass="bold"></asp:Label>
                        <br />
                        <asp:Label ID="Usernm" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
                    </div>
                    <div class="clear visible-xs">
                        <br />
                    </div>
                </div>
                <div class="col-sm-4">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/img/user.gif" Height="40" CssClass="left icons" />
                    <div class="left">
                        <asp:Label ID="Label11" runat="server" Text="Navn:" CssClass="bold"></asp:Label>
                        <br />
                        <asp:Label ID="FornavnLabel" runat="server" Text='<%# Bind("Fornavn") %>' />
                        <asp:Label ID="EtternavnLabel" runat="server" Text='<%# Bind("Etternavn") %>' />
                    </div>
                    <div class="clear visible-xs">
                        <br />
                    </div>
                </div>
                <div class="col-sm-4">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/img/gender.gif" Height="40" CssClass="left icons" />
                    <div class="left">
                        <asp:Label ID="Label7" runat="server" Text="Kjønn:" CssClass="bold"></asp:Label>
                        <br />
                        <asp:Label ID="GenderLabel" runat="server" Text='<%# Util.lblText(Eval("Gender", "{0}"), "Ikke oppgitt")%>'></asp:Label>
                    </div>
                    <div class="clear visible-xs">
                        <br />
                    </div>
                </div>

            </div>

            <div class="clear">
                <br />
                <br />
            </div>

            <div class="col-xs-12">
                <asp:Label ID="Label8" runat="server" Text="Personlig informasjon" CssClass="ProductUnderHeadline"></asp:Label>
                <hr class="ProductUnderLine" />
                
                <div class="col-sm-4">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/img/relationshipstatus.gif" Height="40" CssClass="left icons" />
                    <div class="left">
                        <asp:Label ID="Label9" runat="server" Text="Sivilstatus:" CssClass="bold"></asp:Label>
                        <br />
                        <asp:Label ID="RelationLabel" runat="server" Text='<%# Util.lblText(Eval("Sivilstatus", "{0}"), "Ikke oppgitt")%>'></asp:Label>
                    </div>
                    <div class="clear visible-xs">
                        <br />
                    </div>
                </div>

                <div class="col-sm-4">
                    <asp:Image ID="Image10" runat="server" ImageUrl="~/img/birthday.gif" Height="40" CssClass="left icons" />
                    <div class="left">
                        <asp:Label ID="Label14" runat="server" Text="Fødselsdato:" CssClass="bold"></asp:Label>
                        <br />
                        <asp:Label ID="fDatoLabel" runat="server" Text='<%# Eval("fDato", "{0:dd/MM/yyyy}") %>' />
                    </div>
                    <div class="clear visible-xs">
                        <br />
                    </div>
                </div>

                <div class="col-sm-4">
                    <asp:Image ID="Image11" runat="server" ImageUrl="~/img/age.gif" Height="40" CssClass="left icons" />
                    <div class="left">
                        <asp:Label ID="Label16" runat="server" Text="Alder:" CssClass="bold"></asp:Label>
                        <br />
                        <asp:Label ID="age" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>

            <div class="clear">
                <br />
                <br />
            </div>

            <asp:Panel ID="AdminInfo" runat="server" >
                <div class="col-sm-12">
                    <asp:Label ID="Label4" runat="server" Text="Adresseinformasjon" CssClass="ProductUnderHeadline"></asp:Label>
                    <hr class="ProductUnderLine" />
                    <div class="col-sm-4">
                        <asp:Image ID="Image8" runat="server" ImageUrl="~/img/home.gif" Height="40" CssClass="left icons" />
                        <div class="left">
                            <asp:Label ID="Label5" runat="server" Text="Adresse:" CssClass="bold"></asp:Label>
                            <br />
                            <asp:Label ID="AdresseTextBox" runat="server" Text='<%# Util.lblText(Eval("Adresse", "{0}"), "Ikke oppgitt") %>' />
                        </div>
                        <div class="clear visible-xs">
                            <br />
                        </div>
                    </div>

                    <div class="col-sm-8">
                        <asp:Image ID="Image9" runat="server" ImageUrl="~/img/adress.gif" Height="40" CssClass="left icons" />
                        <div class="left">
                            <asp:Label ID="Label6" runat="server" Text="Postnummer og sted:" CssClass="bold"></asp:Label>
                            <br />
                            <asp:Label ID="PostnrTextBox" runat="server" Text='<%# Bind("Postnr", "{0:0000}") %>' />
                            <asp:Label ID="PoststedTextBox" runat="server" Text='<%# Bind("Poststed") %>' />
                        </div>
                        <div class="clear visible-xs">
                            <br />
                        </div>
                    </div>
                </div>

                <div class="clear">
                    <br />
                    <br />
                </div>

                <div class="col-xs-12">
                    <asp:Label ID="Label10" runat="server" Text="Annen informasjon" CssClass="ProductUnderHeadline"></asp:Label>
                    <hr class="ProductUnderLine" />

                    <div class="col-sm-8">
                        <asp:Image ID="Image6" runat="server" ImageUrl="~/img/mail.gif" Height="40" CssClass="left icons" />
                        <div class="left">
                            <asp:Label ID="Label2" runat="server" Text="E-post:" CssClass="bold"></asp:Label>
                            <br />
                            <asp:Label ID="Email" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="clear visible-xs">
                            <br />
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <asp:Image ID="Image4" runat="server" ImageUrl="~/img/money.gif" Height="40" CssClass="left icons" />
                        <div class="left">
                            <asp:Label ID="Label12" runat="server" Text="Årsinntekt:" CssClass="bold"></asp:Label>
                            <br />
                            <asp:Label ID="InntektTextBox" runat="server" Text='<%# Util.lblText(Eval("Inntekt", "{0:###,###,###,###}"), "Ikke oppgitt")%>' />
                        </div>
                    </div>
                </div>
            </asp:Panel>

            <div class="clear">
                <br />
                <br />
            </div>
        </ItemTemplate>
    </asp:FormView>

    <div class="clear"></div>

    <br />
    <br />
    <div class="ProductUnderHeadline">
        <asp:Label ID="User" runat="server" Text=""></asp:Label>
        <hr class="ProductUnderLine" />
    </div>

    <%
        'Place pagecount
        If (UserProducts.Rows.Count > 0) Then
            Response.Write("<div class='col-sm-12 PageCount'>Nå vises side " & UserProducts.PageIndex + 1 & " av " & UserProducts.PageCount() & "</div>")
        End If
    %>

    <asp:GridView ID="UserProducts" runat="server" CssClass="col-sm-12" BorderStyle="None" GridLines="Horizontal" CellPadding="5" ForeColor="Black" EmptyDataText="Du har ikke opprettet noen anmeldelser." AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="ProductsDataSource" PageSize="10">
        <Columns>
            <asp:TemplateField ItemStyle-Width="25%">
                <ItemTemplate>
                    <asp:Image ID="ImgProduct" runat="server" CssClass="SearchImage" ImageUrl='<%# Util.imgURL(Eval("Produktbilde", "~/uploads/{0}"), "~/img/missing.gif")%>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Overskrift" HeaderText="Overskrift" SortExpression="Overskrift" ItemStyle-CssClass="bold">
                <HeaderStyle Width="20%" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Sted" SortExpression="Sted">
                <ItemTemplate>
                    <asp:Label ID="Place" runat="server" Text='<%# Util.lblText(Eval("Sted", "{0}"), "Hjemme")%>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Karakter">
                <ItemTemplate>
                    <asp:Image ID="Char" runat="server" Width="20px" Visible='<%# Util.imgURL(Eval("Karakter", "True"), "False")%>' ImageUrl='<%# Util.imgURL(Eval("Karakter", "~/img/dice{0}.gif"), "~/img/cancel.gif")%>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="SpiceType" HeaderText="Styrke" SortExpression="Styrke" />
            <asp:BoundField DataField="Dato" HeaderText="Dato" SortExpression="Dato" DataFormatString="{0:d}" />
            <asp:BoundField DataField="CategoryType" HeaderText="Kategori" SortExpression="Kategori" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="GoProduct" runat="server" ImageUrl="~/img/go.gif" CssClass="GoImg" Width="10px" PostBackUrl='<%# Eval("ProductID", "~/Product.aspx?ID={0}")%>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="HeaderStyle" ForeColor="white" />
        <RowStyle CssClass="RowStyle" />
        <PagerStyle CssClass="PagerStyle" ForeColor="#BD1D2D" HorizontalAlign="Right" />
    </asp:GridView>
    <div class="clear">
        <br />
        <br />
    </div>

    <asp:SqlDataSource ID="UsersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>" 
        SelectCommand="SELECT * FROM [UserProfiles] WHERE Username = @UserName">
        <SelectParameters>
            <asp:QueryStringParameter Name="Username" QueryStringField="Usr" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource> 

    <asp:SqlDataSource ID="ProductsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>" 
        SelectCommand="SELECT TOP 5 * FROM [Product] LEFT JOIN [Styrke] ON [Product].[Styrke] = [Styrke].[SpiceID] LEFT JOIN [Kategori] ON [Product].[Kategori] = [Kategori].[CategoryID] WHERE ([Brukernavn] = @Brukernavn) ORDER BY [ProductID] DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="Brukernavn" QueryStringField="Usr" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

