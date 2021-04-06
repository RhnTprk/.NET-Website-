<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Paneller.Master" AutoEventWireup="true" CodeBehind="~/admin/film.aspx.cs" Inherits="CdSite.film" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <asp:GridView ID="filmler" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id,ft_id" DataSourceID="SqlDataSource1" Height="111px" Width="743px" OnSelectedIndexChanged="filmler_SelectedIndexChanged1">
        <Columns>
            <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
            <asp:BoundField DataField="ad" HeaderText="Film Adı" SortExpression="ad" />
            <asp:BoundField DataField="yapimYil" HeaderText="Yapım Yılı" SortExpression="yapimYil" />
            <asp:BoundField DataField="yapimci" HeaderText="Yapımcısı" SortExpression="yapimci" />
            <asp:BoundField DataField="sure" HeaderText="Süresi" SortExpression="sure" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CdSiteConnectionString %>" SelectCommand="select df.*, lf.ad filmTur, lf.id ft_id from dt_film df
join lu_filmTur lf on df.filmTur_id=lf.id"></asp:SqlDataSource>
    &nbsp;
&nbsp;<div style="height: 60px; margin-top: 10px">
    <asp:Button ID="btn_flmguncelle" runat="server" BorderStyle="Solid" Height="46px" OnClick="btn_flmguncelle_Click" Text="Filmi Güncelle" Width="121px" Style="margin-left: 129px" />
    <asp:Button ID="btn_flmsil" runat="server" BorderStyle="Solid" Height="46px" Style="margin-left: 63px" Text="Filmi Sil" Width="128px" OnClick="btn_flmsil_Click" />
    <asp:Button ID="btn_flmekle" runat="server" BorderStyle="Solid" Height="46px" Style="margin-left: 62px" Text="Film Ekle" Width="128px" OnClick="btn_flmekle_Click" />
    </div>
    <div style="height: 50px; margin-top: 5px">
    </div>
</asp:Content>
