<%@ Page Title="" Language="C#" MasterPageFile="~/uye/uyePaneller.Master" AutoEventWireup="true" CodeBehind="~/uye/oyunbilgi.aspx.cs" Inherits="CdSite.oyunbilgi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 578px">

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="oyunsql" Height="379px" Width="749px">
            <Columns>
                <asp:BoundField DataField="ad" HeaderText="Ad" SortExpression="ad" />
                <asp:BoundField DataField="yapimYil" HeaderText="Yapım Yılı" SortExpression="yapimYil" />
                <asp:BoundField DataField="yapimci" HeaderText="Yapımcı" SortExpression="yapimci" />
                <asp:BoundField DataField="platform" HeaderText="Platform" SortExpression="platform" />              
                <asp:BoundField DataField="adet" HeaderText="Adet" SortExpression="adet" />
                <asp:BoundField DataField="fiyat" HeaderText="Fiyat" SortExpression="fiyat" />
                <asp:BoundField DataField="oyunTur" HeaderText="Tür" SortExpression="oyunTur" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        <asp:SqlDataSource ID="oyunsql" runat="server" ConnectionString="<%$ ConnectionStrings:CdSiteConnectionString %>" SelectCommand="select do.*,lo.ad oyunTur,lo.id oyunTur_id from dt_oyun do 
join lu_oyunTur lo on do.oyunTur_id=lo.id"></asp:SqlDataSource>

    </div>
</asp:Content>
