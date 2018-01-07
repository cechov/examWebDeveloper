<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="ChangePassword.aspx.vb" Inherits="user_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="ProductUnderHeadline">
                Min side
                <hr class="ProductUnderLine" />
            </div>
            <div class="col-xs-12">
                <br />
                <asp:Label ID="Label18" runat="server" Text="Endre passord" CssClass="ProductUnderHeadline"></asp:Label>
                <hr class="ProductUnderLine" />
                <asp:Image ID="Image5" runat="server" ImageUrl="~/img/key.gif" Height="40" CssClass="left icons" />
                <asp:ChangePassword ID="ChangePassword1" runat="server" ChangePasswordFailureText="Passordet er feil eller nytt passord er ugyldig. Minimumslengde er {0} tegn, inkludert {1} spesialtegn eller nummer." CssClass="col-xs-12" ConfirmPasswordCompareErrorMessage="Du må bekrefte det nye passordet." ConfirmPasswordRequiredErrorMessage="Du må bekrefte det nye passordet." NewPasswordRegularExpressionErrorMessage="Vennligst skriv inn et annet passord." NewPasswordRequiredErrorMessage="Du må skrive inn et nytt passord." PasswordRequiredErrorMessage="Du må skrive inn ditt gamle passord." SuccessText="Passordet er endret. " SuccessTitleText="Passordet er endret.">
                    <ChangePasswordTemplate>
                        <asp:Panel ID="EditPasw" runat="server" DefaultButton="ChangePasswordPushButton">
                           <div class="col-xs-12">
                               <asp:Label ID="TextBox1" runat="server" Text="Gammelt passord"></asp:Label>
                               <br />
                               <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password" CssClass="col-xs-12"></asp:TextBox>
                               <br /><br />
                            </div> 
                            <div class="col-xs-12">
                                <asp:Label ID="Label1" runat="server" Text="Nytt passord"></asp:Label>
                                <br />
                                <asp:TextBox ID="NewPassword" runat="server" TextMode="Password" CssClass="col-xs-12"></asp:TextBox>
                                <br /><br />
                            </div> 
                            <div class="col-xs-12">
                                <asp:Label ID="Label2" runat="server" Text="Bekreft nytt passord"></asp:Label>
                                <br />
                                <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password" CssClass="col-xs-12"></asp:TextBox>
                                <br /><br />
                            </div> 
                            <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry." ValidationGroup="ChangePassword1"></asp:CompareValidator>
                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                        </asp:Panel>
                        <asp:ImageButton ID="ChangePasswordPushButton" runat="server" ImageUrl="~/img/save.gif" Width="30px" CssClass="right" CommandName="ChangePassword" ValidationGroup="ChangePassword1" />   
                        <div class="clear"></div>
                        <hr />
                        <asp:ImageButton ID="UserButton" runat="server" ImageUrl="~/img/back.gif" Width="30px" CssClass="left" CausesValidation="False" CommandName="Cancel" PostBackUrl="~/user/User.aspx" />
                        <asp:Label ID="label3" runat="server" Text="Gå tilbake"  CssClass="btnBack"></asp:Label>
                    </ChangePasswordTemplate>
                    <SuccessTemplate>
                        <asp:Label ID="label1" runat="server" Text="Passordet er endret."></asp:Label>
                        <hr />
                        <asp:ImageButton ID="UserButton" runat="server" ImageUrl="~/img/back.gif" Width="30px"  CssClass="left" PostBackUrl="~/user/User.aspx" />
                        <asp:Label ID="label3" runat="server" Text="Gå tilbake"  CssClass="btnBack"></asp:Label>
                    </SuccessTemplate>
                    <FailureTextStyle CssClass="red" />
                </asp:ChangePassword>
                <br />
                <br />
        </div> 

        <div class="clear"><br /><br /></div>

</asp:Content>

