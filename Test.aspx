<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Test.aspx.vb" Inherits="Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#BD1D2D" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Size="8pt" ForeColor="#BD1D2D" Height="230px" Width="250px" FirstDayOfWeek="Monday" NextPrevFormat="FullMonth">
                                <DayHeaderStyle BackColor="#e5e5e5" ForeColor="black" CssClass="DayHeader" />
                                <NextPrevStyle Font-Size="8pt" ForeColor="White" CssClass="NextPrev" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <SelectorStyle BackColor="#BD1D2D" ForeColor="White" />
                                <TitleStyle BackColor="#BD1D2D" Font-Bold="True" Font-Size="10pt" ForeColor="White" Height="30px" />
                                <TodayDayStyle BackColor="#e5e5e5" />
                                <WeekendDayStyle BackColor="#f5f5f5" />
                            </asp:Calendar> 
    </form>
</body>
</html>
