<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Paneller.Master" AutoEventWireup="true" CodeBehind="~/admin/muzik.aspx.cs" Inherits="CdSite.muzik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
    <div style="height: 577px">
        <asp:GridView ID="muzikler" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id,mzk_id" DataSourceID="muziklerr" Height="289px" Width="740px" OnSelectedIndexChanged="muzikler_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                <asp:BoundField DataField="ad" HeaderText="Adı" SortExpression="ad" />
                <asp:BoundField DataField="sanatci" HeaderText="Sanatçı" SortExpression="sanatci" />
                <asp:BoundField DataField="album" HeaderText="Albüm Adı" SortExpression="album" />
                <asp:BoundField DataField="sure" HeaderText="Süresi" SortExpression="sure" />
                <asp:BoundField DataField="yapimYil" HeaderText="Yapım Yılı" SortExpression="yapimYil" />
                <asp:BoundField DataField="adet" HeaderText="Adet" SortExpression="adet" />
                <asp:BoundField DataField="fiyat" HeaderText="Fiyatı" SortExpression="fiyat" />
                <asp:BoundField DataField="muzikTur" HeaderText="Tür" SortExpression="muzikTur" />
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
        <asp:SqlDataSource ID="muziklerr" runat="server" ConnectionString="<%$ ConnectionStrings:CdSiteConnectionString %>" SelectCommand="select dm.*, lm.ad muzikTur, lm.id mzk_id from dt_muzik dm join lu_muzikTur lm on dm.muzikTur_id=lm.id"></asp:SqlDataSource>
        &nbsp;
        &nbsp;
        <div style="height: 60px; margin-top: 10px">
            <asp:Button ID="btn_mzkguncelle" runat="server" BorderStyle="Solid" Height="46px" OnClick="btn_mzkguncelle_Click" Text="Müziği Güncelle" Width="128px" style="margin-left: 128px" />
            <asp:Button ID="btn_mzksil" runat="server" BorderStyle="Solid" Height="46px" style="margin-left: 61px" Text="Müziği Sil" Width="128px" OnClick="btn_mzksil_Click" />
            <asp:Button ID="btn_mzkekle" runat="server" BorderStyle="Solid" Height="46px" style="margin-left: 62px" Text="Müzik Ekle" Width="128px" OnClick="btn_mzkekle_Click" />
        </div>
    </div>
    
</asp:Content>
