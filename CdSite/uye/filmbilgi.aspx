<%@ Page Title="" Language="C#" MasterPageFile="~/uye/uyePaneller.Master" AutoEventWireup="true" CodeBehind="~/uye/filmbilgi.aspx.cs" Inherits="CdSite.filmbilgi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 577px">
        <asp:GridView ID="filmListe" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="filmsql" Height="259px" Width="750px">
            <Columns>
                <asp:BoundField DataField="ad" HeaderText="Ad" SortExpression="ad" />
                <asp:BoundField DataField="yapimYil" HeaderText="Yapım Yılı" SortExpression="yapimYil" />
                <asp:BoundField DataField="yapimci" HeaderText="Yapımcı" SortExpression="yapimci" />
                <asp:BoundField DataField="sure" HeaderText="Süre" SortExpression="sure" />            
                <asp:BoundField DataField="adet" HeaderText="Adet" SortExpression="adet" />
                <asp:BoundField DataField="fiyat" HeaderText="Fiyat" SortExpression="fiyat" />
                <asp:BoundField DataField="filmTur" HeaderText="Tür" SortExpression="filmTur" />
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
        <div style="height: 47px; margin-top: 44px">
        </div>
        <asp:SqlDataSource ID="filmsql" runat="server" ConnectionString="<%$ ConnectionStrings:CdSiteConnectionString %>" SelectCommand="select df.*, lf.ad filmTur, lf.id ft_id from dt_film df join lu_filmTur lf on df.filmTur_id=lf.id"></asp:SqlDataSource>
    </div>
</asp:Content>
