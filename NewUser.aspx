<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="NewUser.aspx.vb" Inherits="NewUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="ProductUnderHeadline">
                Registrer ny bruker
                <hr class="ProductUnderLine" />
            </div>
            <asp:CreateUserWizard ID="NewUserWizard" runat="server" OnCreatedUser="NewUserWizard_CreatedUser"
                CompleteSuccessText="Brukeren er opprettet. En e-post med brukerdetaljer vil bli sendt til den oppgitte e-postadressen."
                ConfirmPasswordCompareErrorMessage="Du må bekrefte passordet."
                ConfirmPasswordLabelText="Bekreft passordet: "
                ConfirmPasswordRequiredErrorMessage="Du må bekrefte passordet."
                DuplicateEmailErrorMessage="Det finnes allerede en bruker med den oppgitte e-postadressen. Vennligst oppgi en annen e-postadresse."
                DuplicateUserNameErrorMessage="Det finnes allerede en bruker med det oppgitte brukernavnet. Vennligst oppgi et annet brukernavn."
                EmailLabelText="E-post: "
                EmailRegularExpressionErrorMessage="Vennligst oppgi en annen e-post."
                EmailRequiredErrorMessage="Vennligst oppgi en e-postadresse."
                InvalidEmailErrorMessage="Vennligst oppgi e-post."
                InvalidPasswordErrorMessage="Passordet må bestå av minimum {0} tegn, og inneholde {1} spesialtegn."
                PasswordLabelText="Passord:"
                PasswordRegularExpressionErrorMessage="Vennligst oppgi et annet passord."
                PasswordRequiredErrorMessage="Vennligst oppgi et passord."
                UnknownErrorMessage="Brukeren var ikke opprettet. Vennligst prøv igjen."
                UserNameLabelText="Brukernavn: "
                UserNameRequiredErrorMessage="Vennligst oppgi brukernavn."
                CssClass="col-xs-12">
                <WizardSteps>
                    <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                        <ContentTemplate>
                                <div class="col-sm-6 col-xs-12">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Brukernavn: </asp:Label>
                                    <br />
                                    <asp:TextBox ID="UserName" runat="server" CssClass="txtbox col-xs-11" BackColor="#f9fbf7"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Vennligst oppgi brukernavn." ToolTip="Vennligst oppgi brukernavn." ValidationGroup="CreateUserWizard1" CssClass="col-xs-1">*</asp:RequiredFieldValidator>
                                    <br />
                                    <br />
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Passord:</asp:Label>
                                    <br />
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="txtbox col-xs-11" BackColor="#f9fbf7"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Vennligst oppgi et passord." ToolTip="Vennligst oppgi et passord." ValidationGroup="CreateUserWizard1" CssClass="col-xs-1">*</asp:RequiredFieldValidator>
                                    <br />
                                    <br />
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Bekreft passordet: </asp:Label>
                                    <br />
                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="txtbox col-xs-11" BackColor="#f9fbf7"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Du må bekrefte passordet." ToolTip="Du må bekrefte passordet." ValidationGroup="CreateUserWizard1" CssClass="col-xs-1">*</asp:RequiredFieldValidator>
                                    <br />
                                    <br />
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-post: </asp:Label>
                                    <br />
                                    <asp:TextBox ID="Email" runat="server" CssClass="txtbox col-xs-11" BackColor="#f9fbf7"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="Vennligst oppgi en e-postadresse." ToolTip="Vennligst oppgi en e-postadresse." ValidationGroup="CreateUserWizard1" CssClass="col-xs-1">*</asp:RequiredFieldValidator>
                                    <br />
                                    <br />
                                </div>
                            <div class="col-xs-12">
                                <br />
                                <br />
                                <br />
                            </div>
                            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="Du må bekrefte passordet." ValidationGroup="CreateUserWizard1" CssClass="col-xs-1"></asp:CompareValidator>
                            <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            <br />
                            <br />
                            <div class="clear"><br /></div>
                            <hr class="ProductUnderLine" />
                            <asp:LinkButton CssClass="TermsOfUseLink" runat="server" OnClick="TermsOfUseLink_Click">Klikk her for å lese våre brukervilkår.</asp:LinkButton>
                            <hr class="ProductUnderLine" />
                        </ContentTemplate>
                    </asp:CreateUserWizardStep>
                    <asp:CompleteWizardStep ID="CompleteWizardStep2" runat="server">
                        <ContentTemplate>
                            <table style="width: 280px; font-size: 100%;">
                                <tr>
                                    <td align="center" class="red bold" text-align: center; padding-top: 120px;">
                                        <br />
                                        <br />
                                        Kontoen er opprettet. Vennligst logg inn.
                                        <asp:Button ID="Button1" CssClass="loginlink col-sm-6 col-xs-12" runat="server" Text="Logg inn" PostBackUrl="~/Login.aspx" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:CompleteWizardStep>
                </WizardSteps>
                <CreateUserButtonStyle CssClass="okbtn right" />
            </asp:CreateUserWizard>
            <div class="clear"><br /></div>
            <asp:Panel ID="TermsOfUse" runat="server" CssClass="col-xs-12" Visible="false">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla tincidunt facilisis commodo. Phasellus semper nulla malesuada neque malesuada fermentum. Nunc venenatis nulla sit amet lacus lobortis lacinia ac varius nisi. Integer hendrerit, nisi fringilla suscipit hendrerit, erat est scelerisque enim, quis commodo sapien ante ac dolor. Sed nec velit gravida, interdum nisl eu, volutpat metus. Proin luctus nisi urna, non scelerisque ipsum interdum sed. Vestibulum nulla magna, venenatis in lobortis luctus, pretium a ante. Nulla venenatis arcu sit amet porttitor laoreet. Nunc a nisi porttitor est facilisis placerat.
                <br /><br />
                    Aenean hendrerit commodo leo nec dignissim. Suspendisse diam justo, imperdiet et imperdiet id, viverra eget lectus. Suspendisse pulvinar quam eget lacus ullamcorper, sit amet imperdiet sapien porttitor. Ut pulvinar facilisis sapien, in commodo diam hendrerit a. Etiam vestibulum commodo enim, et dapibus velit mattis sit amet. Donec iaculis bibendum odio, vel tincidunt diam hendrerit sollicitudin. Sed et finibus mauris. Etiam accumsan ut sapien vitae mollis. Fusce sit amet semper quam. Phasellus eu tortor placerat, volutpat orci in, commodo ligula.
                <br /><br />
                    In viverra leo sed metus convallis maximus. Praesent fermentum orci nunc, in aliquam tortor vestibulum vel. Suspendisse tortor est, lobortis sagittis lacus ac, varius scelerisque velit. Curabitur sit amet lobortis nulla, quis gravida augue. Vestibulum pulvinar purus feugiat, tristique nunc sit amet, malesuada libero. Ut sit amet quam a felis luctus finibus vel non erat. Praesent felis nisl, bibendum a accumsan ac, egestas id ante. Aliquam erat volutpat. Nulla vitae lacus vel leo malesuada pharetra sed nec lorem.
                <br /><br />
                    Sed ac orci laoreet, egestas nulla sed, ultricies massa. Phasellus in scelerisque velit, eget varius nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus malesuada, quam et venenatis placerat, sapien quam vulputate ante, vel gravida turpis mi et tortor. Nullam posuere ultrices quam. Phasellus bibendum egestas elementum. Integer ornare, ligula scelerisque lacinia fermentum, nisl mauris posuere neque, nec venenatis lectus erat sed orci. Nullam mollis erat nec arcu elementum, et feugiat ante placerat. Maecenas et velit tellus. Vivamus condimentum vehicula tellus. Praesent ac malesuada mi, et elementum leo. Suspendisse potenti.
                <br /><br />
                    Donec non vehicula turpis. Praesent lobortis, lectus quis consequat fringilla, turpis libero gravida risus, nec volutpat enim diam eget dui. Donec sollicitudin, ligula non sodales dictum, purus nulla pharetra purus, sed dapibus libero est in quam. Vestibulum viverra, ante sed consectetur imperdiet, libero risus fermentum turpis, sit amet rhoncus lacus leo vel sapien. Donec semper eu augue vitae feugiat. Praesent a magna non ante aliquam ultricies. Sed faucibus non ipsum vel euismod. Sed at dolor consectetur, bibendum sem vitae, malesuada libero. Vivamus at magna in metus luctus vulputate non a tellus. Nulla eget porta urna. Curabitur imperdiet tincidunt tortor, at dictum lectus cursus vel.
                <br /><br />
            </asp:Panel>
</asp:Content>

