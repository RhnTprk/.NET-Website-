<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Paneller.Master" AutoEventWireup="true" CodeBehind="~/admin/oyun.aspx.cs" Inherits="CdSite.oyun" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div style="height: 577px">
        <asp:GridView ID="oyunlar" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id,oyunTur_id" DataSourceID="oyunsql" Height="258px" Width="741px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                <asp:BoundField DataField="ad" HeaderText="Adı" SortExpression="ad" />
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
        &nbsp;
&nbsp;
        <div style="height: 60px; margin-top: 10px">
            <asp:Button ID="btn_oyunguncelle" runat="server" BorderStyle="Solid" Height="46px" OnClick="btn_oyunguncelle_Click" Text="Oyunu Güncelle" Width="128px" style="margin-left: 125px" />
            <asp:Button ID="btn_oyunsil" runat="server" BorderStyle="Solid" Height="46px" style="margin-left: 61px" Text="Oyunu Sil" Width="128px" OnClick="btn_oyunsil_Click" />
            <asp:Button ID="btn_oyunekle" runat="server" BorderStyle="Solid" Height="46px" style="margin-left: 62px" Text="Oyun Ekle" Width="128px" OnClick="btn_oyunekle_Click" />
        </div>
    </div>

</asp:Content>
