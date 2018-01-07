<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="User.aspx.vb" Inherits="user_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="UsersDataSource" DefaultMode="Edit" CssClass="col-xs-12">
            <EditItemTemplate>
                <div class="ProductUnderHeadline">
                    Min side
                    <asp:ImageButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/img/save.gif" Width="30" CssClass="right SaveProfile" />
                    <hr class="ProductUnderLine" />
                </div>

                <div class="col-md-3">
                    <div class="imagebox left">
                        <asp:Image ID="imgProfilbilde" runat="server" Height="100%" ImageUrl='<%# Util.imgURL(Eval("Profilbilde", "~/user/uploads/{0}"), "~/img/user.jpg")%>' />
                    </div>
                </div>

                <div class="clear visible-xs"></div>

                <div class="col-md-9">
                    <div class="ProductUnderHeadline">
                        Endre profilbilde
                        <hr class="ProductUnderLine" />
                    </div>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <br />
                    <asp:Label ID="UploadError" runat="server" Text="OBS! Filtypen må være .jpg, og mindre enn 1 MB."></asp:Label>
                    <div class="clear visible-xs"></div>
                </div>

                <div class="col-md-12">
                    <br />
                    <asp:Label ID="Label18" runat="server" Text="Kontoinformasjon" CssClass="ProductUnderHeadline"></asp:Label>
                    <hr class="ProductUnderLine" />
                    <div class="col-sm-4">
                        <asp:Image ID="Image5" runat="server" ImageUrl="~/img/user.gif" Height="40" CssClass="left icons" />
                        <div class="left">
                            <asp:Label ID="Label1" runat="server" Text="Brukernavn:" CssClass="bold"></asp:Label>
                            <br />
                            <asp:Label ID="Usernm" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="clear visible-xs"><br /></div>
                    </div>
                    <div class="col-sm-5">
                        <asp:Image ID="Image6" runat="server" ImageUrl="~/img/mail.gif" Height="40" CssClass="left icons" />
                        <div class="left">
                            <asp:Label ID="Label2" runat="server" Text="E-post:" CssClass="bold"></asp:Label>
                            <br />
                            <asp:Label ID="Email" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="clear visible-xs"><br /></div>
                    </div>

                    <div class="col-sm-3">
                        <asp:Image ID="Image7" runat="server" ImageUrl="~/img/key.gif" Height="40" CssClass="left icons" />
                        <div class="left">
                            <asp:Label ID="Label3" runat="server" Text="Passord:" CssClass="bold"></asp:Label>
                            <br />
                            <asp:Label ID="Passw" runat="server" Text="" CssClass="left"></asp:Label>
                            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/img/edit.gif" Width="30" CssClass="right EditBtn" PostBackUrl="~/user/ChangePassword.aspx" />
                        </div>
                    </div>
                </div>

                <div class="clear"><br /><br /></div>

                <div class="col-xs-12">
                    <asp:Label ID="Label8" runat="server" Text="Personlig informasjon" CssClass="ProductUnderHeadline"></asp:Label>
                    <hr class="ProductUnderLine" />
                    <div class="col-sm-8">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/img/user.gif" Height="40" CssClass="left icons" />
                        <div class="left">
                            <asp:Label ID="Label11" runat="server" Text="Navn:" CssClass="bold"></asp:Label>
                            <br />
                            <asp:TextBox ID="FornavnTextBox" runat="server" Text='<%# Bind("Fornavn") %>' PlaceHolder="Fornavn" CssClass="col-sm-6 col-xs-12" />
                            <asp:TextBox ID="EtternavnTextBox" runat="server" Text='<%# Bind("Etternavn") %>' PlaceHolder="Etternavn" CssClass="col-sm-6 col-xs-12" />
                        </div>
                        <div class="clear visible-xs"><br /></div>
                    </div>

                    <div class="col-sm-4">
                        <asp:Image ID="Image10" runat="server" ImageUrl="~/img/birthday.gif" Height="40" CssClass="left icons" />
                        <div class="left">
                            <asp:Label ID="Label14" runat="server" Text="Fødselsdato:" CssClass="bold"></asp:Label>
                            <br />  
                            <asp:TextBox ID="fDatoTextBox" runat="server" Text='<%# Bind("fDato", "{0:dd/MM/yyyy}") %>' CssClass="col-xs-12" />
                        </div>
                        <div class="clear visible-xs"><br /></div>
                    </div>
                </div>

            <div class="clear"><br /></div>

            <div class="col-xs-12">
                <asp:Label ID="Label4" runat="server" Text="Adresseinformasjon" CssClass="ProductUnderHeadline"></asp:Label>
                <hr class="ProductUnderLine" />
                <div class="col-xs-12 col-sm-4">
                    <asp:Image ID="Image8" runat="server" ImageUrl="~/img/home.gif" Height="40" CssClass="left icons" />
                    <div class="left">
                        <asp:Label ID="Label5" runat="server" Text="Adresse:" CssClass="bold"></asp:Label>
                        <br />
                        <asp:TextBox ID="AdresseTextBox" runat="server" Text='<%# Bind("Adresse") %>' CssClass="col-xs-12" PlaceHolder="Adresse" />
                    </div>
                    <div class="clear visible-xs"><br /></div>
                </div>

                <div class="col-sm-8">
                    <asp:Image ID="Image9" runat="server" ImageUrl="~/img/adress.gif" Height="40" CssClass="left icons" />
                    <div class="left">
                        <asp:Label ID="Label6" runat="server" Text="Postnummer og sted:" CssClass="bold"></asp:Label>
                        <br />
                        <asp:TextBox ID="PostnrTextBox" runat="server" Text='<%# Bind("Postnr", "{0:0000}")%>' PlaceHolder="0000" CssClass="col-sm-4 col-xs-12" />
                        <asp:TextBox ID="PoststedTextBox" runat="server" Text='<%# Bind("Poststed") %>' PlaceHolder="Poststed" CssClass="col-sm-8 col-xs-12" />
                    </div>
                    <div class="clear visible-xs"><br /></div>
                </div>
            </div>

            <div class="clear"><br /><br /></div>

            <div class="col-xs-12">
                <asp:Label ID="Label10" runat="server" Text="Annen informasjon" CssClass="ProductUnderHeadline"></asp:Label>
                <hr class="ProductUnderLine" />
                <div class="col-sm-4">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/img/gender.gif" Height="40" CssClass="left icons" />
                    <div class="left">
                        <asp:Label ID="Label7" runat="server" Text="Kjønn:" CssClass="bold"></asp:Label>
                        <br />
                        <asp:DropDownList id="dlGender" runat="server" SelectedValue='<%# Bind("Gender")%>' CssClass="col-xs-12" Height="25px">
                            <asp:ListItem Text="Ikke oppgitt" Value=""></asp:ListItem>
                            <asp:ListItem Text="Kvinne" Value="Kvinne"></asp:ListItem>
                            <asp:ListItem Text="Mann" Value="Mann"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="clear visible-xs"><br /></div>
                </div>

                <div class="col-sm-4">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/img/relationshipstatus.gif" Height="40" CssClass="left icons" />
                    <div class="left">
                        <asp:Label ID="Label9" runat="server" Text="Sivilstatus:" CssClass="bold"></asp:Label>
                        <br />
                        <asp:DropDownList id="dlRelation" runat="server" SelectedValue='<%# Bind("Sivilstatus")%>' CssClass="col-xs-12" Height="25px">
                            <asp:ListItem Text="Ikke oppgitt" Value=""></asp:ListItem>
                            <asp:ListItem Text="Ugift" Value="Ugift"></asp:ListItem>
                            <asp:ListItem Text="Gift" Value="Gift"></asp:ListItem>
                            <asp:ListItem Text="Skilt" Value="Skilt"></asp:ListItem>
                            <asp:ListItem Text="Enke/Enkemann" Value="Enke/Enkemann"></asp:ListItem>
                            <asp:ListItem Text="Samboer" Value="Samboer"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="clear visible-xs"><br /></div>
                </div>

                <div class="col-sm-4">
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/img/money.gif" Height="40" CssClass="left icons" />
                    <div class="left">
                        <asp:Label ID="Label12" runat="server" Text="Årsinntekt:" CssClass="bold"></asp:Label>
                        <br />
                        <asp:TextBox ID="InntektTextBox" runat="server" Text='<%# Bind("Inntekt") %>' PlaceHolder="300 000" CssClass="col-xs-12" />
                    </div>
                </div>
            </div>

            <div class="clear"><br /><br /></div>           
            </EditItemTemplate>
        </asp:FormView> 

            <div class="clear"><br /><br /></div>


    <asp:SqlDataSource ID="UsersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>" 
        SelectCommand="SELECT * FROM [UserProfiles] WHERE Username = @UserName"
        UpdateCommand="UPDATE [UserProfiles] SET [Fornavn] = @Fornavn, [Etternavn] = @Etternavn, [Gender] = @Gender, [Adresse] = @Adresse, [Postnr] = @Postnr, [Poststed] = @Poststed, [fDato] = @fDato, [Sivilstatus] = @Sivilstatus, [Inntekt] = @Inntekt, [Profilbilde] = @Profilbilde WHERE [ID] = @ID">
        <SelectParameters>
            <asp:ProfileParameter Name="UserName" PropertyName="UserName" Type="String" />
        </SelectParameters>
        <UpdateParameters>
                <asp:Parameter Name="Fornavn" Type="String" />
                <asp:Parameter Name="Etternavn" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Adresse" Type="String" />
                <asp:Parameter Name="Postnr" Type="Int32" />
                <asp:Parameter Name="Poststed" Type="String" />
                <asp:Parameter DbType="Date" Name="fDato" />
                <asp:Parameter Name="Sivilstatus" Type="String" />
                <asp:Parameter Name="Inntekt" Type="Int32" />
                <asp:Parameter Name="Profilbilde" Type="String" />
            </UpdateParameters>
    </asp:SqlDataSource>  

</asp:Content>

