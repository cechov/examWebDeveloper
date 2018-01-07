<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="AdminUsers.aspx.vb" Inherits="admin_AdminUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="ProductUnderHeadline">
                Administrer brukere
                <hr class="ProductUnderLine" />
            </div>

            <%
                'Place pagecount
                If (MyProducts.Rows.Count > 0) Then
                    Response.Write("<div class='col-sm-12 PageCount'>Nå vises side " & MyProducts.PageIndex + 1 & " av " & MyProducts.PageCount() & "</div>")
                End If
            %>

            <asp:GridView ID="MyProducts" runat="server" CssClass="col-sm-12" BorderStyle="None" GridLines="Horizontal" CellPadding="5" ForeColor="Black" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="UsersDataSource" PageSize="10">
                <Columns>
                    <asp:BoundField DataField="Username" HeaderText="Brukernavn" SortExpression="Username" />
                    <asp:BoundField DataField="Fornavn" HeaderText="Fornavn" SortExpression="Fornavn" NullDisplayText="-" />
                    <asp:BoundField DataField="Etternavn" HeaderText="Etternavn" SortExpression="Etternavn" NullDisplayText="-" />
                    <asp:BoundField DataField="Gender" HeaderText="Kjønn" SortExpression="Gender" NullDisplayText="-" />
                    <asp:BoundField DataField="Sivilstatus" HeaderText="Sivilstatus" SortExpression="Sivilstatus" NullDisplayText="-" />
                    <asp:BoundField DataField="Adresse" HeaderText="Adresse" SortExpression="Adresse" NullDisplayText="-" />
                    <asp:BoundField DataField="Postnr" HeaderText="Postnummer" SortExpression="Postnr" DataFormatString="{0:0000}" NullDisplayText="-" />
                    <asp:BoundField DataField="Poststed" HeaderText="Poststed" SortExpression="Poststed" NullDisplayText="-" />
                    <asp:BoundField DataField="fDato" HeaderText="Fødselsdato" SortExpression="fDato" DataFormatString="{0:d}" NullDisplayText="-" />
                    <asp:BoundField DataField="Inntekt" HeaderText="Årsinntekt" SortExpression="Inntekt" DataFormatString="{0:###,###}" NullDisplayText="-" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton Id="GoProfile" runat="server" ImageUrl="~/img/go.gif" CssClass="GoImg" Width="10px" PostBackUrl='<%# Eval("Username", "~/Profile.aspx?Usr={0}")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle CssClass="HeaderStyle" ForeColor="white" />
                <RowStyle CssClass="RowStyle" />
                <PagerStyle CssClass="PagerStyle" ForeColor="#BD1D2D" HorizontalAlign="Right" />
            </asp:GridView>

    <asp:SqlDataSource ID="UsersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>" 
        SelectCommand="SELECT * FROM [UserProfiles]">
    </asp:SqlDataSource>
</asp:Content>

