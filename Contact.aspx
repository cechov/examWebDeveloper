<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Contact.aspx.vb" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="col-sm-7">
        <div class="ProductUnderHeadline">
            Kontakt oss
            <hr class="ProductUnderLine" />
        </div>
        Vi er her for å svare på eventuelle spørsmål du måtte ha om våre tjenester. Nå ut til oss og vi vil svare så snart vi kan.
        <br /><br />
        Mange av spørsmålene vi mottar er besvart under våre brukerbetingelser. De finnes under menyvalget for ny bruker.
        <br /><br />
        Vi er tilgjengelige på telefon hverdager kl. 08:00 - 17:00.
        <br /><br /><br />
    </div>
    <div class="col-sm-4" style="background-color:#F9FBF7; padding:20px; padding-top:40px; position:relative; top:-20px;">
        <asp:ImageButton ID="ImageButton1" runat="server" CssClass="left contacticon" ImageUrl="~/img/mailto.gif" Width="30" PostBackUrl="MailTo:post@tacoheaven.no" />
        <div class="left">
            <asp:Label ID="Label1" runat="server" CssClass="bold" Text="E-post"></asp:Label>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="link" NavigateUrl="MailTo:post@tacoheaven.no">post@tacoheaven.no</asp:HyperLink>  
        </div>
        <div class="clear"><br /></div>
        <asp:ImageButton ID="ImageButton2" runat="server" CssClass="left contacticon" ImageUrl="~/img/phone.gif" Width="30" PostBackUrl="tel:+4712345678" />
        <div class="left">
            <asp:Label ID="Label2" runat="server" CssClass="bold" Text="Telefon"></asp:Label>
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="link" NavigateUrl="tel:+4712345678">+47 123 45 678</asp:HyperLink>  
        </div>
        <div class="clear"><br /></div>
        <asp:Image ID="Image1" runat="server" CssClass="left contacticon" ImageUrl="~/img/adr.gif" Width="30" />
        <div class="left">
            <asp:Label ID="Label3" runat="server" CssClass="bold" Text="Adresse"></asp:Label>
            <br />
            <asp:Label ID="Label4" runat="server" CssClass="red" Text="Gate 1"></asp:Label>
            <br />
            <asp:Label ID="Label5" runat="server" CssClass="red" Text="0001 Oslo"></asp:Label>
            <br />
            <asp:Label ID="Label6" runat="server" CssClass="red" Text="Norway"></asp:Label>
        </div>
        <div class="clear"></div>
        <hr class="ProductUnderHeadline" />
        <asp:ImageButton ID="ImageButton3" runat="server" CssClass="left contacticon" ImageUrl="~/img/fb.gif" Width="30" PostBackUrl="www.facebook.com/tacoheaven" />
        <asp:ImageButton ID="ImageButton4" runat="server" CssClass="left contacticon" ImageUrl="~/img/tw.gif" Width="30" PostBackUrl="www.twitter.com/tacoheaven" />
    </div>
    
</asp:Content>

