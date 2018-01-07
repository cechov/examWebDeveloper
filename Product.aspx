<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Product.aspx.vb" Inherits="Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <asp:FormView ID="FormViewProduct" runat="server" DataSourceID="ProductDataSource" OnItemUpdating="FormViewProduct_ItemUpdating">
                <EditItemTemplate>
                    <br />
                    <div class="SiteMapPath">
                        <asp:SiteMapPath ID="SiteMapPath1" runat="server" Enabled='<%# Eval("ProductID") %>'>
                            <CurrentNodeTemplate></CurrentNodeTemplate>
                            <NodeStyle CssClass="SiteMapPath" />
                        </asp:SiteMapPath>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Overskrift") %>'></asp:Label>
                    </div>
                    <br /><br />
                    <asp:Image ID="Image3" runat="server" CssClass="ProductImage" ImageUrl='<%# Util.imgURL(Eval("Produktbilde", "~/uploads/{0}"), "~/img/missing.gif")%>' />
                    <div class="fileuploadstyle col-xs-12">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>
                    <asp:Label ID="UploadError" runat="server" Text="OBS! Filtypen må være .jpg, og mindre enn 1 MB."></asp:Label>
                    <br />
                    <div class="col-xs-12">
                            <hr class="ProductLine" />
                        <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="right EditViewIcon" ImageUrl="~/img/cancel.gif" />
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" CssClass="right EditViewIcon" ImageUrl="~/img/save.gif" />
                        <asp:DropDownList ID="KategoriDropDown" runat="server" DataSourceID="KategoriDataSource" DataTextField="CategoryType" DataValueField="CategoryID" SelectedValue='<%# Bind("Kategori")%>' CssClass="right Space"></asp:DropDownList>
                        <asp:DropDownList ID="KrydderDropDown" runat="server" DataSourceID="KrydderDataSource" DataTextField="SpiceType" DataValueField="SpiceID" SelectedValue='<%# Bind("Styrke")%>' CssClass="right Space"></asp:DropDownList>
                        
                            <div class="left">
                                <span class="ProductPlace"><b>Restaurant:</b> </span>
                                <asp:TextBox ID="PlaceLbl" runat="server" CssClass="Space" Height="20" Text='<%# Bind("Sted")%>' PlaceHolder="Hjemme" />
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

                    <div style="background-color:#F9FBF7;">
            <div class="col-md-6 ProductBox">
                <div class="ProductUnderHeadline">
                    Ingredienser
                    <hr class="ProductUnderLine" />
                </div>
                
                <asp:ListView ID="IngredientsEditList" runat="server" DataKeyNames="ID,MåleenhetID" DataSourceID="IngredientsDataSource" GroupItemCount="1" InsertItemPosition="None">
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <EmptyDataTemplate>
                        Det er ikke oppgitt noen ingredienser.
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <td runat="server" id="IngredientsItem" class="AllergensBox">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/img/point.gif" Width="10px" />
                            <asp:Label ID="MengdeLabel" runat="server" Text='<%# Eval("Mengde") %>' />
                            <asp:Label ID="Måleenhet1Label" runat="server" Text='<%# Eval("Måleenhet1") %>' />
                            <asp:Label ID="IngrediensLabel" runat="server" Text='<%# Eval("Ingrediens") %>' />
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style=""></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>
            </div>

            <div class="col-md-6 ProductBox">
                <div class="ProductUnderHeadline">
                    Allergener
                    <hr class="ProductUnderLine" />
                </div>

                <asp:ListView ID="AllergenerList" runat="server" DataSourceID="AllergensDataSource" GroupItemCount="2" DataKeyNames="ID" InsertItemPosition="None">
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <EmptyDataTemplate>
                        Det er ikke oppgitt noen allergener.
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <td runat="server" class="AllergensBox">
                            <asp:Image ID="Image1" runat="server" Height="30px" CssClass="AllergensImg" ImageUrl='<%# Eval("AllergenType", "~/img/all_{0}.gif") %>' />
                            <asp:Label ID="AllergenTypeLabel" runat="server" Text='<%# Eval("AllergenType") %>' />
                            <br />
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" border="0">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server"></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>

            </div>
                <div class="clear">
                    <br />
                </div>
            </div>

            <hr class="ProductLine" />
                        <div class="ProductInfo right">
                                <b>Skrevet av:</b>
                                <asp:HyperLink ID="BrukernavnLabel" runat="server" CssClass="link" Text='<%# Bind("Brukernavn") %>' NavigateUrl='<%# Eval("Brukernavn", "~/Profile.aspx?Usr={0}") %>'></asp:HyperLink> 
                                <b>Publisert:</b>
                                <asp:Label ID="DatoLabel" runat="server" Text='<%# Bind("Dato", "{0:dd/MM/yyyy}") %>' />
                            </div>
                </EditItemTemplate>
                <ItemTemplate>
                    <br />
                    <div class="SiteMapPath right">
                        <asp:SiteMapPath ID="SiteMapPath" runat="server" Enabled='<%# Eval("ProductID") %>'>
                            <CurrentNodeTemplate></CurrentNodeTemplate>
                            <NodeStyle CssClass="SiteMapPath" />
                        </asp:SiteMapPath>
                        <asp:Label ID="Current" runat="server" Text='<%# Eval("Overskrift") %>'></asp:Label>
                    </div>
                    <br /><br />
                    <asp:Image ID="Image1" runat="server" CssClass="ProductImage" ImageUrl='<%# Util.imgURL(Eval("Produktbilde", "~/uploads/{0}"), "~/img/missing.gif")%>' />
                    <br />
                    <div class="col-xs-12">
                            <hr class="ProductLine" />
                        <asp:ImageButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" CssClass="EditIcon right" ImageUrl="~/img/edit.gif" />

                        <asp:LoginView ID="LikeLoginView" runat="server">
                            <LoggedInTemplate>
                                <asp:FormView ID="LikeFormView" runat="server" DataKeyNames="ID" DataSourceID="HeartDataSource" CssClass="right" OnDataBound="LikeFormView_DataBound" >
                                    <InsertItemTemplate>
                                        <asp:ImageButton ID="LikeButton" runat="server" CssClass="EditIcon" CausesValidation="True" CommandName="Insert" ImageUrl="~/img/like.gif" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="UnlikeButton" runat="server" CssClass="EditIcon" CausesValidation="True" CommandName="Delete" ImageUrl="~/img/unlike.gif" />
                                    </ItemTemplate>
                                </asp:FormView>
                            </LoggedInTemplate>
                        </asp:LoginView>
                        <asp:Image ID="KategoriImage" runat="server" CssClass="ProductIconCat right" ImageUrl='<%# Eval("Kategori", "~/img/cat_{0}.gif")%>' />
                        <asp:Image ID="StyrkeImage" runat="server" CssClass="ProductIconSpice right" ImageUrl='<%# Eval("Styrke", "~/img/spice_{0}.gif")%>' />

                            <div class="ProductPlace left">
                                <b>Restaurant:</b> 
                                <asp:Label ID="lblPlace" runat="server" Text='<%# Bind("Sted")%>' />
                                <asp:Image ID="imgChar" runat="server" Width="15" ImageUrl='<%# Bind ("Karakter", "~/img/dice{0}.gif") %>' />
                            </div>
                        <br />
                        <hr class="ProductLine" />
                            <br />
                    </div>

                    <asp:Label ID="OverskriftLabel" runat="server" Text='<%# Bind("Overskrift") %>' CssClass="col-xs-12 ProductHeadline"></asp:Label>
                    
                    <div class="clear"><br /><br /></div>

                    <div class="col-xs-12">
                        <asp:Label ID="IngressLabel" runat="server" CssClass="bold" Text='<%# Bind("Ingress") %>' />
                        <br />
                        <br />
                        <asp:Label ID="BeskrivelseLabel" runat="server" Text='<%# Bind("Beskrivelse") %>' />
                        <br />
                    </div>

                    <div class="clear">
                        <br />
                    </div>

                    <a name="ProductIngredient"></a>

                    <div class="col-xs-12 ProductBox">
                        <div class="ProductUnderHeadline">
                            <asp:Label ID="FremgLbl" runat="server" Text="Fremgangsmåte" />
                                <div class="right timeinfo">
                                    <asp:Image ID="FremgangstidImg" CssClass="FremgangstidImg" runat="server" ImageUrl="~/img/time.gif" Height="15px" />
                                    <asp:Label ID="FremgangstidLabel" runat="server" Text='<%# Bind("Fremgangstid") %>' />
                                    <asp:Label ID="minutes" runat="server" Text="min." />
                                </div>
                            <hr class="ProductUnderLine" />
                        </div>
                        <asp:Label ID="FremgangsmåteLabel" runat="server" Text='<%# Bind("Fremgangsmåte") %>' />
                        <br /><br />

                        <div style="background-color:#F9FBF7;">
            <div class="col-md-6 ProductBox">
                <div class="ProductUnderHeadline">
                    Ingredienser
                    <asp:HyperLink ID="plusbuttoningredients" NavigateUrl="#" runat="server" data-toggle="modal" data-target="#AddIngrediensModal" CssClass="right" >
                        <asp:Image ID="AddIngredients" runat="server" ImageUrl="~/img/plus.gif" Width="20" />
                    </asp:HyperLink>

                    <div class="modal fade" id="AddIngrediensModal" tabindex="-1" role="dialog" aria-labelledby="helpModalLabel" aria-hidden="false">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">
                                        <span aria-hidden="true">&times;</span>
                                        <span class="sr-only">Avbryt</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="IngredientsDataSource" DefaultMode="Insert" Width="100%" CssClass="center">
                                        <InsertItemTemplate>
                                            <asp:Panel ID="IngredientsPanel" runat="server" DefaultButton="UpdateButton">
                                                <asp:TextBox ID="InsertMengdeTextBox" runat="server" Text='<%# Bind("Mengde") %>' Placeholder="0" Width="100" Height="30" />
                                                <asp:DropDownList ID="MåleenhetDropDown" runat="server" DataSourceID="MåleenhetDataSource" DataTextField="Måleenhet" DataValueField="MåleenhetID" SelectedValue='<%# Bind("Måleenhet")%>' Width="100" Height="30">
                                                </asp:DropDownList>
                                                <asp:TextBox ID="InsertIngrediensTextBox" runat="server" Text='<%# Bind("Ingrediens") %>' Placeholder="Ingrediens" />
                                                <asp:ImageButton ID="UpdateButton" runat="server" CommandName="Insert" ImageUrl="~/img/save.gif" Width="30px" CssClass="right" PostBackUrl="#ProductIngredient" />
                                            </asp:Panel>
                                        </InsertItemTemplate>
                                    </asp:FormView>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="ProductUnderLine" />
                </div>

                <asp:ListView ID="IngredientsEditListView" runat="server" DataKeyNames="ID,MåleenhetID" DataSourceID="IngredientsDataSource" GroupItemCount="1" InsertItemPosition="None">
                    <EditItemTemplate>
                        <td runat="server">
                            <asp:TextBox ID="MengdeTextBox" runat="server" Text='<%# Bind("Mengde") %>' Height="30" Width="50" />
                            <asp:DropDownList ID="MåleenhetDropDown" runat="server" DataSourceID="MåleenhetDataSource" DataTextField="Måleenhet" DataValueField="MåleenhetID" SelectedValue='<%# Bind("Måleenhet")%>' Height="30" Width="80">
                            </asp:DropDownList>
                            <asp:TextBox ID="IngrediensTextBox" runat="server" Text='<%# Bind("Ingrediens") %>' Height="30" Width="100" />
                            <asp:ImageButton ID="CancelButton" runat="server" CommandName="Cancel" ImageUrl="~/img/cancel.gif" Width="20px" CssClass="right" PostBackUrl="#ProductIngredient" />
                            <asp:ImageButton ID="UpdateButton" runat="server" CommandName="Update" ImageUrl="~/img/save.gif" Width="20px" CssClass="right" PostBackUrl="#ProductIngredient" />
                            <br />
                        </td>
                    </EditItemTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <EmptyDataTemplate>
                        Det er ikke oppgitt noen ingredienser.
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <td runat="server" id="IngredientsItem" class="AllergensBox">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/img/point.gif" Width="10px" />
                            <asp:Label ID="MengdeLabel" runat="server" Text='<%# Eval("Mengde") %>' />
                            <asp:Label ID="Måleenhet1Label" runat="server" Text='<%# Eval("Måleenhet1") %>' />
                            <asp:Label ID="IngrediensLabel" runat="server" Text='<%# Eval("Ingrediens") %>' />
                            <asp:ImageButton ID="EditButton" runat="server" CommandName="Edit" ImageUrl="~/img/edit.gif" Width="20px" PostBackUrl="#ProductIngredient" />
                            <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" ImageUrl="~/img/cancel.gif" Width="20px" PostBackUrl="#ProductIngredient" />
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style=""></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>

                <asp:ListView ID="IngredientsListView" runat="server" DataKeyNames="ID,MåleenhetID" DataSourceID="IngredientsDataSource" GroupItemCount="1" InsertItemPosition="None">
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <EmptyDataTemplate>
                        Det er ikke oppgitt noen ingredienser.
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <td runat="server" id="IngredientsItem" class="AllergensBox">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/img/point.gif" Width="10px" />
                            <asp:Label ID="MengdeLabel" runat="server" Text='<%# Eval("Mengde") %>' />
                            <asp:Label ID="Måleenhet1Label" runat="server" Text='<%# Eval("Måleenhet1") %>' />
                            <asp:Label ID="IngrediensLabel" runat="server" Text='<%# Eval("Ingrediens") %>' />
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style=""></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>
            </div>

            <div class="col-md-6 ProductBox">
                <div class="ProductUnderHeadline">
                    Allergener

                    <asp:HyperLink ID="plusbuttonallergens" NavigateUrl="#" runat="server" data-toggle="modal" data-target="#AddAllergenModal" CssClass="right" >
                        <asp:Image ID="addimage" runat="server" ImageUrl="~/img/plus.gif" Width="20" />
                    </asp:HyperLink>

                    <div class="modal fade" id="AddAllergenModal" tabindex="-1" role="dialog" aria-labelledby="helpModalLabel" aria-hidden="false">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">
                                        <span aria-hidden="true">&times;</span>
                                        <span class="sr-only">Avbryt</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <asp:FormView ID="FormView2" runat="server" DataKeyNames="ID" DataSourceID="AllergensDataSource" DefaultMode="Insert" Width="100%" CssClass="center">
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="AllergenTypeDropDown" runat="server" DataSourceID="AllergenTypeDataSource" DataTextField="AllergenType" DataValueField="AllergenID" SelectedValue='<%# Bind("AllergenID")%>'>
                                            </asp:DropDownList>
                                            <asp:ImageButton ID="InsertButton" runat="server" CommandName="Insert" ImageUrl="~/img/save.gif" Width="30px" CssClass="right" PostBackUrl="#ProductAllergens" />
                                        </InsertItemTemplate>
                                    </asp:FormView>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="ProductUnderLine" />
                </div>

                <asp:ListView ID="AllergenerEditListView" runat="server" DataSourceID="AllergensDataSource" GroupItemCount="2" DataKeyNames="ID" InsertItemPosition="None">
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <EmptyDataTemplate>
                        Det er ikke oppgitt noen allergener.
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <td runat="server" class="AllergensBox">
                            <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" ImageUrl="~/img/cancel.gif" Width="20px" CssClass="right AllergensDelete" PostBackUrl="#ProductAllergens" />
                            <asp:Image ID="Image1" runat="server" Height="30px" CssClass="AllergensImg" ImageUrl='<%# Eval("AllergenType", "~/img/all_{0}.gif") %>' />
                            <asp:Label ID="AllergenTypeLabel" runat="server" Text='<%# Eval("AllergenType") %>' />
                            <br />
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" border="0">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server"></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>

                <asp:ListView ID="AllergenerListView" runat="server" DataSourceID="AllergensDataSource" GroupItemCount="2" DataKeyNames="ID" InsertItemPosition="None">
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <EmptyDataTemplate>
                        Det er ikke oppgitt noen allergener.
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <td runat="server" class="AllergensBox">
                            <asp:Image ID="Image1" runat="server" Height="30px" CssClass="AllergensImg" ImageUrl='<%# Eval("AllergenType", "~/img/all_{0}.gif") %>' />
                            <asp:Label ID="AllergenTypeLabel" runat="server" Text='<%# Eval("AllergenType") %>' />
                            <br />
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" border="0">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server"></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>

            </div>
                <div class="clear">
                    <br />
                </div>
            </div>

                        <hr class="ProductLine" />
                        <div class="ProductInfo right">
                                <b>Skrevet av:</b>
                                <asp:HyperLink ID="BrukernavnLabel" runat="server" CssClass="link" Text='<%# Bind("Brukernavn") %>' NavigateUrl='<%# Eval("Brukernavn", "~/Profile.aspx?Usr={0}") %>'></asp:HyperLink> 
                                <b>Publisert:</b>
                                <asp:Label ID="DatoLabel" runat="server" Text='<%# Bind("Dato", "{0:dd/MM/yyyy}") %>' />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:FormView>

            <br />

            <a name="ProductAllergens"></a>
            
            <div class="clear">
                <br />
            </div>

            <div class="col-xs-12 ProductBox">
                <a href="#" class="ProductAddComment col-xs-12" data-toggle="modal" data-target="#CommentModal">Klikk for å legge til kommentar
                </a>

                <asp:LoginView ID="LoginView4" runat="server">
                    <LoggedInTemplate>
                        <div class="modal fade" id="CommentModal" tabindex="-1" role="dialog" aria-labelledby="helpModalLabel" aria-hidden="false">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        Legg igjen en kommentar
                                        <button type="button" class="close" data-dismiss="modal">
                                            <span aria-hidden="true">&times;</span>
                                            <span class="sr-only">Avbryt</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <asp:FormView ID="NewComment" runat="server" DataKeyNames="CommentID" DataSourceID="CommentsDataSource" DefaultMode="Insert" Width="100%">
                                            <InsertItemTemplate>
                                                <asp:Panel ID="pNewComment" runat="server" DefaultButton="InsertButton">
                                                    Tittel:
                                                        <asp:TextBox ID="TittelTextBox" runat="server" Text='<%# Bind("Tittel") %>' Width="100%" />
                                                    <br /><br />
                                                    Kommentar:
                                                        <asp:TextBox ID="KommentarTextBox" runat="server" TextMode="MultiLine" Text='<%# Bind("Kommentar") %>' Width="100%" />
                                                    <br />
                                                    <hr />
                                                    <asp:ImageButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" OnClick="InsertButton_Click" ImageUrl="~/img/save.gif" CssClass="right" Width="30" />
                                                </asp:Panel> 
                                            </InsertItemTemplate>
                                        </asp:FormView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </LoggedInTemplate>
                    <AnonymousTemplate>
                        <div class="modal fade" id="CommentModal" tabindex="-1" role="dialog" aria-labelledby="helpModalLabel" aria-hidden="false">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        Du må logge inn
                                            <button type="button" class="close" data-dismiss="modal">
                                                <span aria-hidden="true">&times;</span>
                                                <span class="sr-only">Avbryt</span>
                                            </button>
                                    </div>
                                    <div class="modal-body">
                                        <asp:Image ID="WarningImg" runat="server" ImageUrl="~/img/warning.gif" CssClass="WarningImg left" />
                                        Det er ikke mulig å kommentere uten å være medlem. Vennligst logg inn eller registrer deg som ny bruker.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </AnonymousTemplate>
                </asp:LoginView>

                <br />
                <br />


                <asp:ListView ID="DisplayComments" runat="server" DataKeyNames="CommentID" DataSourceID="CommentsDataSource">
                    <EmptyDataTemplate>
                        Det er ingen kommentarer enda.
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <div class="comment">
                            <div class="col-xs-12">
                                <asp:LoginView ID="LoginView5" runat="server">
                                    <RoleGroups>
                                        <asp:RoleGroup Roles="admin">
                                            <ContentTemplate>
                                                <asp:LinkButton ID="DeleteLinkButton" runat="server" Text="&times;" CssClass="right" CommandName="Delete" OnClientClick="return confirm('Vennligst bekreft sletting av kommentar. Denne handlingen kan ikke angres.')" />
                                            </ContentTemplate>
                                        </asp:RoleGroup>
                                    </RoleGroups>
                                    <LoggedInTemplate>
                                        <asp:LinkButton ID="linkReport" runat="server" CssClass="link right" Font-Size="Smaller" CommandName="Update" Text='<%# If(Eval("Alert").ToString().Equals("True"), "", " Rapporter som upassende ") %>' OnClientClick="return confirm('Vennligst bekreft rapportaring av upassende kommentar. Denne handlingen kan ikke angres.')"></asp:LinkButton>
                                    </LoggedInTemplate>
                                </asp:LoginView>

                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("CommentID") %>' />

                                <div class="ProfilePic left">
                                    <asp:Image ID="imgProfilbilde" runat="server" Height="100%" ImageUrl='<%# Util.imgURL(Eval("Profilbilde", "~/user/uploads/{0}"), "~/img/user.jpg")%>' />
                                </div>
                                
                                <div class="left">
                                    <asp:Label ID="UserComment" runat="server" CssClass="ProductInfo" Text='<%# Eval("Brukernavn") %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="DateComment" runat="server" CssClass="ProductInfo" Text='<%# Eval("Dato", "{0:dd/MM/yyyy}")%>'></asp:Label>
                                </div>
                            </div>
                            <div class="col-xs-3"></div>
                            <div class="col-xs-9 commentLine">
                                <asp:Label ID="Label3" runat="server" CssClass="commentTitle" Text='<%# Eval("Tittel") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Kommentar") %>'></asp:Label>
                            </div>
                            <div class="clear">
                                <br />
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" runat="server">
                            <span runat="server" id="itemPlaceholder" style="padding-top: 40px;" />
                        </div>
                        <div></div>
                    </LayoutTemplate>
                </asp:ListView>
            </div>

    <%--SQL Data Sources--%>

            <asp:SqlDataSource ID="ProductDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>" 
                SelectCommand="SELECT * FROM [Product] WHERE ([ProductID] = @ProductID)" 
                UpdateCommand="UPDATE [Product] SET [Overskrift] = @Overskrift, [Ingress] = @Ingress, [Beskrivelse] = @Beskrivelse, [Fremgangsmåte] = @Fremgangsmåte, [Fremgangstid] = @Fremgangstid, [Sted] = @Sted, [Karakter] = @Karakter, [Kategori] = @Kategori, [Styrke] = @Styrke, [Brukernavn] = @Brukernavn, [Produktbilde] = @Produktbilde, [Dato] = @Dato WHERE [ProductID] = @ProductID">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="ProductID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Overskrift" Type="String" />
                    <asp:Parameter Name="Ingress" Type="String" />
                    <asp:Parameter Name="Beskrivelse" Type="String" />
                    <asp:Parameter Name="Fremgangsmåte" Type="String" />
                    <asp:Parameter Name="Fremgangstid" Type="Int32" />
                    <asp:Parameter Name="Sted" Type="String" />
                    <asp:Parameter Name="Karakter" Type="Int32" />
                    <asp:Parameter Name="Kategori" Type="Int32" />
                    <asp:Parameter Name="Styrke" Type="Int32" />
                    <asp:Parameter Name="Brukernavn" Type="String" />
                    <asp:Parameter Name="Produktbilde" Type="String" />
                    <asp:Parameter DbType="Date" Name="Dato" />
                    <asp:QueryStringParameter DefaultValue="1" Name="ProductID" QueryStringField="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="KrydderDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>" 
                SelectCommand="SELECT * FROM [Styrke] ORDER BY [SpiceID]">
            </asp:SqlDataSource>
            
            <asp:SqlDataSource ID="KategoriDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>" 
                SelectCommand="SELECT * FROM [Kategori] ORDER BY [CategoryID]">
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="HeartDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>" 
                DeleteCommand="DELETE FROM [UserFavourites] WHERE [ID] = @ID" 
                InsertCommand="INSERT INTO [UserFavourites] ([ProductID], [Username]) VALUES (@ProductID, @Username)" 
                SelectCommand="SELECT * FROM [UserFavourites] WHERE (([ProductID] = @ProductID) AND ([Username] = @Username))">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="ProductID" QueryStringField="ID" Type="Int32" />
                    <asp:ProfileParameter Name="Username" PropertyName="UserName" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="ProductID" QueryStringField="ID" Type="Int32" />
                    <asp:ProfileParameter Name="Username" PropertyName="UserName" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="CommentsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>" 
                DeleteCommand="DELETE FROM [Comments] WHERE [CommentID] = @original_CommentID" 
                InsertCommand="INSERT INTO [Comments] ([ProductID], [Brukernavn], [Tittel], [Kommentar], [Dato], [Alert]) VALUES (@ProductID, @Brukernavn, @Tittel, @Kommentar, GETDATE(), 'false')" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT * FROM [Comments] LEFT JOIN [UserProfiles] ON [Comments].[Brukernavn] = [UserProfiles].[Username] WHERE ([ProductID] = @ProductID) ORDER BY [CommentID] DESC"
                UpdateCommand="UPDATE [Comments] SET [Alert] = 'True' WHERE [CommentID] = @CommentID">
                <DeleteParameters>
                    <asp:Parameter Name="original_CommentID" Type="Int32"/>
                </DeleteParameters>
                <InsertParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="ProductID" QueryStringField="ID" Type="Int32" />
                    <asp:ProfileParameter Name="Brukernavn" PropertyName="UserName" Type="String" />
                    <asp:Parameter Name="Tittel" Type="String" />
                    <asp:Parameter Name="Kommentar" Type="String" />
                    <asp:Parameter DbType="Date" Name="Dato" />
                    <asp:Parameter Name="Alert" Type="Boolean" DefaultValue="False" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="ProductID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Alert" Type="Boolean" DefaultValue="False" />
                    <asp:Parameter Name="CommentID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="MåleenhetDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>" 
                SelectCommand="SELECT * FROM [Måleenhet] ORDER BY [MåleenhetID]">
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="IngredientsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>" 
                DeleteCommand="DELETE FROM [ProductIngredienser] WHERE [ID] = @ID" 
                InsertCommand="INSERT INTO [ProductIngredienser] ([ProductID], [Mengde], [Måleenhet], [Ingrediens]) VALUES (@ProductID, @Mengde, @Måleenhet, @Ingrediens)" 
                SelectCommand="SELECT * FROM [ProductIngredienser] JOIN [Måleenhet] ON [ProductIngredienser].[Måleenhet] = [Måleenhet].[MåleenhetID] WHERE ([ProductID] = @ProductID) ORDER BY [ID]" 
                UpdateCommand="UPDATE [ProductIngredienser] SET [ProductID] = @ProductID, [Mengde] = @Mengde, [Måleenhet] = @Måleenhet, [Ingrediens] = @Ingrediens WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="ProductID" QueryStringField="ID" Type="Int32" />
                    <asp:Parameter Name="Mengde" Type="Int32" />
                    <asp:Parameter Name="Måleenhet" Type="Int32" />
                    <asp:Parameter Name="Ingrediens" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="ProductID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="ProductID" QueryStringField="ID" Type="Int32" />
                    <asp:Parameter Name="Mengde" Type="Int32" />
                    <asp:Parameter Name="Måleenhet" Type="Int32" />
                    <asp:Parameter Name="Ingrediens" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="AllergenTypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>" 
                SelectCommand="SELECT * FROM [Allergener] ORDER BY [AllergenID]">
            </asp:SqlDataSource>
        
            <asp:SqlDataSource ID="AllergensDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TacoHeavenConnectionString %>" 
                SelectCommand="SELECT * FROM [ProductAllergener] JOIN [Allergener] ON [ProductAllergener].[AllergenID] = [Allergener].[AllergenID] WHERE ([ProductID] = @ProductID) ORDER BY [ProductAllergener].[AllergenID]" 
                DeleteCommand="DELETE FROM [ProductAllergener] WHERE [ID] = @ID" 
                InsertCommand="INSERT INTO [ProductAllergener] ([ProductID], [AllergenID]) VALUES (@ProductID, @AllergenID)">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="ProductID" QueryStringField="ID" Type="Int32" />
                    <asp:Parameter Name="AllergenID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProductID" Type="Int32" />
                    <asp:Parameter Name="AllergenID" Type="Int32" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="ProductID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

</asp:Content>

