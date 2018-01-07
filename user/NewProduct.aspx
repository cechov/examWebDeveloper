<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="NewProduct.aspx.vb" Inherits="user_NewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <asp:FormView ID="FormViewProduct" runat="server" DataSourceID="ProductDataSource" DefaultMode="Insert">
                <InsertItemTemplate>
                    <br />
                    <div class="SiteMapPath">
                        <asp:SiteMapPath ID="SiteMapPath1" runat="server" Enabled='<%# Eval("ProductID") %>'>
                            <CurrentNodeTemplate></CurrentNodeTemplate>
                            <NodeStyle CssClass="SiteMapPath" />
                        </asp:SiteMapPath>
                        <asp:Label ID="Label5" runat="server" Text="Ny anmeldelse"></asp:Label>
                    </div>
                    <hr />
                    <asp:Image ID="Image3" runat="server" CssClass="ProductImage" ImageUrl='<%# Util.imgURL(Eval("Produktbilde", "~/uploads/product_{0}.jpeg"), "~/img/missing.gif")%>' />
                    <div class="fileuploadstyle col-xs-12">
                        <asp:FileUpload ID="FileUpload2" runat="server" />
                    </div>
                    <br />
                    <div class="col-xs-12">
                            <hr class="ProductLine" />
                        <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="true" PostBackUrl="~/user/MyProducts.aspx" CssClass="right EditViewIcon" ImageUrl="~/img/cancel.gif" />
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Insert" CssClass="right EditViewIcon" ImageUrl="~/img/save.gif" />
                        <asp:DropDownList ID="KategoriDropDown" runat="server" DataSourceID="KategoriDataSource" DataTextField="CategoryType" DataValueField="CategoryID" SelectedValue='<%# Bind("Kategori")%>' CssClass="right Space"></asp:DropDownList>
                        <asp:DropDownList ID="KrydderDropDown" runat="server" DataSourceID="KrydderDataSource" DataTextField="SpiceType" DataValueField="SpiceID" SelectedValue='<%# Bind("Styrke")%>' CssClass="right Space"></asp:DropDownList>
                        
                            <div class="left">
                                <span class="ProductPlace"><b>Restaurant:</b> </span>
                                <asp:TextBox ID="PlaceLbl" runat="server" CssClass="Space" Height="20" Text='<%# Bind("Sted")%>' PlaceHolder="Restaurant" OnTextChanged="PlaceLbl_TextChanged" />
                                <asp:DropDownList id="dlChar" runat="server" CssClass="Space" Height="20" SelectedValue='<%# Bind("Karakter")%>'>
                                    <asp:ListItem Text="0" Value=""></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        <br />
                        <hr class="ProductLine" />
                            <br />
                    </div>
                    
                    <div class="col-xs-12">
                        <asp:TextBox ID="OverskriftLabel" runat="server" Text='<%# Bind("Overskrift") %>' CssClass="col-xs-12 ProductHeadline" PlaceHolder="Overskrift"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Du må skrive inn overskrift." CssClass="red" ControlToValidate="OverskriftLabel" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>

                    <div class="clear"><br /><br /></div>

                    <div class="col-xs-12">
                        <asp:TextBox ID="IngressTextBox" runat="server" CssClass="bold" Width="100%" TextMode="MultiLine" Text='<%# Bind("Ingress") %>' PlaceHolder="Ingress" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Du må skrive inn ingress." CssClass="red" ControlToValidate="IngressTextBox" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <asp:TextBox ID="BeskrivelseTextBox" runat="server" Width="100%" Height="300px" TextMode="MultiLine" Text='<%# Bind("Beskrivelse") %>' PlaceHolder="Brødtekst" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Du må skrive inn beskrivelse." CssClass="red" ControlToValidate="BeskrivelseTextBox" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <br />
                    </div>

                    <br />
                    <br />

                    <div class="col-xs-12 ProductBox">
                        <div class="ProductUnderHeadline">
                            Fremgangsmåte
                                <div class="right timeinfo">
                                    <asp:Image ID="FremgangstidImg" CssClass="FremgangstidImg" runat="server" ImageUrl="~/img/time.gif" Height="15px" />
                                    <asp:TextBox ID="FremgangstidTextBox" runat="server" Width="50" Text='<%# Bind("Fremgangstid") %>' PlaceHolder="0" />
                                    min.
                                </div>
                            <hr class="ProductUnderLine" />
                        </div>
                        <asp:TextBox ID="FremgangsmåteTextBox" runat="server" Width="100%" Height="200px" TextMode="MultiLine" Text='<%# Bind("Fremgangsmåte") %>' PlaceHolder="Om du har laget en rett selv kan du beskrive fremgangsmåten her." />
                    </div>

                    <div class="clear"><br /><br /></div>
                </InsertItemTemplate>
            </asp:FormView>

    <asp:SqlDataSource ID="ProductDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>"
        InsertCommand="INSERT INTO [Product] ([Overskrift], [Ingress], [Beskrivelse], [Fremgangsmåte], [Fremgangstid], [Sted], [Karakter], [Kategori], [Styrke], [Brukernavn], [Produktbilde], [Dato]) VALUES (@Overskrift, @Ingress, @Beskrivelse, @Fremgangsmåte, @Fremgangstid, @Sted, @Karakter, @Kategori, @Styrke, @Brukernavn, @Produktbilde, GetDate())"
        SelectCommand="SELECT * FROM [Product] WHERE ([ProductID] = @ProductID)">
        <InsertParameters>
            <asp:Parameter Name="Overskrift" Type="String" />
            <asp:Parameter Name="Ingress" Type="String" />
            <asp:Parameter Name="Beskrivelse" Type="String" />
            <asp:Parameter Name="Fremgangsmåte" Type="String" />
            <asp:Parameter Name="Fremgangstid" Type="Int32" />
            <asp:Parameter Name="Sted" Type="String" />
            <asp:Parameter Name="Karakter" Type="Int32" />
            <asp:Parameter Name="Kategori" Type="Int32" />
            <asp:Parameter Name="Styrke" Type="Int32" />
            <asp:ProfileParameter Name="Brukernavn" PropertyName="UserName" Type="String" />
            <asp:Parameter Name="Produktbilde" Type="String" />
            <asp:Parameter DbType="Date" Name="Dato" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="KrydderDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>"
        SelectCommand="SELECT * FROM [Styrke] ORDER BY [SpiceID]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="KategoriDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>"
        SelectCommand="SELECT * FROM [Kategori] ORDER BY [CategoryID]"></asp:SqlDataSource>

</asp:Content>

