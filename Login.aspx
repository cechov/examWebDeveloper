<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="ProductUnderHeadline">
                Logg inn
                <hr class="ProductUnderLine" />
            </div>
            <asp:Login ID="Login1" runat="server" CssClass="col-xs-12" FailureText="Pålogging mislyktes. Vennligst prøv igjen." LoginButtonText="Logg inn" PasswordRequiredErrorMessage="Du må skrive inn passord." RememberMeText="Husk meg." UserNameRequiredErrorMessage="Du må skrive inn brukernavn.">
                <LayoutTemplate>
                    <asp:Panel ID="Login" runat="server" DefaultButton="LoginButton">
                        <div class="col-sm-6 col-xs-12">
                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Brukernavn:</asp:Label>
                            <br />
                            <asp:TextBox ID="UserName" runat="server" CssClass="txtbox col-xs-11" BackColor="#f9fbf7"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Du må skrive inn brukernavn." ForeColor="#CC0000" ToolTip="Du må skrive inn brukernavn." ValidationGroup="ctl00$Login" CssClass="col-xs-1">*</asp:RequiredFieldValidator>
                            <br />
                            <br />
                        </div>
                        <div class="col-sm-6 col-xs-12">
                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Passord:</asp:Label>
                            <br />
                            <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="txtbox col-xs-11" BackColor="#f9fbf7"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Du må skrive inn passord." ForeColor="#CC0000" ToolTip="Du må skrive inn passord." ValidationGroup="ctl00$Login" CssClass="col-xs-1">*</asp:RequiredFieldValidator>
                        </div>
                        <div class="col-sm-12 col-xs-12">
                            <asp:CheckBox ID="RememberMe" runat="server" Text="Husk meg" />
                        </div>
                    </asp:Panel>
                    <div class="col-sm-12 col-xs-12">
                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Logg inn" CssClass="okbtn right" ValidationGroup="ctl00$Login" />
                        <br />
                        <br />
                    </div>
                    <div class="col-sm-12, col-xs-12">
                        <br />
                        <hr class="ProductUnderLine" />
                        <asp:LinkButton CssClass="PasswordRecoveryLink" runat="server" OnClick="Link_Click">Glemt passord?</asp:LinkButton>                          
                        <hr class="ProductUnderLine" />
                    </div>
                    <div class="col-sm-12 col-xs-12 red">
                        <br />
                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                    </div>
                </LayoutTemplate>
                <HyperLinkStyle ForeColor="#006600" />
                <FailureTextStyle BackColor="#f9fbf7" BorderColor="#BD1D2D" BorderStyle="Solid" BorderWidth="1px" ForeColor="#BD1D2D" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" Width="100%" />
                <ValidatorTextStyle ForeColor="#CC0000" />
            </asp:Login>
            <div class="clear"><br /></div>

            <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" CssClass="col-xs-12" Visible="false" >
            <UserNameTemplate>
                <div class="col-sm-3"></div>
                <div class="col-sm-6 col-xs-12">
                    <asp:Label ID="RecoveryLabel" runat="server" Text="Skriv inn brukernavnet ditt for å motta passordet på e-post."></asp:Label>
                    <br /><br />
                    <asp:TextBox ID="UserName" runat="server" CssClass="txtbox col-xs-11"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="PasswordRecovery1" CssClass="col-xs-1">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                    <br />
                    <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" Text="Send" ValidationGroup="PasswordRecovery1" CssClass="okbtn col-xs-11" />
                </div> 
                <div class="col-sm-6 col-xs-12"></div> 
            </UserNameTemplate>
        </asp:PasswordRecovery>
            
</asp:Content>

