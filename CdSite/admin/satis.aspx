<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Paneller.Master" AutoEventWireup="true" CodeBehind="satis.aspx.cs" Inherits="CdSite.admin.satis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="height: 545px">
        <div style="height: 30px">
            <asp:Label ID="Label1" runat="server" Style="font-weight: 700; font-size: xx-large; color: #0000CC" Text="Listelenecek veriyi seçin:"></asp:Label>
            <asp:DropDownList ID="veriListe" runat="server" Height="17px" Style="margin-left: 16px" Width="206px" OnSelectedIndexChanged="veriListe_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem Value="1">Filmler</asp:ListItem>
                <asp:ListItem Value="2">Müzikler</asp:ListItem>
                <asp:ListItem Value="3">Oyunlar</asp:ListItem>
            </asp:DropDownList>
            <asp:Panel ID="Panel1" runat="server" GroupingText="Filmler">
                <asp:GridView ID="filmler" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="filmlersql" OnSelectedIndexChanged="filmler_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                        <asp:BoundField DataField="ad" HeaderText="Adı" SortExpression="ad" />
                        <asp:BoundField DataField="yapimYil" HeaderText="Yapım Yılı" SortExpression="yapimYil" />
                        <asp:BoundField DataField="yapimci" HeaderText="Yapımcı" SortExpression="yapimci" />
                        <asp:BoundField DataField="sure" HeaderText="Süre" SortExpression="sure" />
                        <asp:BoundField DataField="fiyat" HeaderText="Fiyat" SortExpression="fiyat" />
                        <asp:BoundField DataField="adet" HeaderText="Adet" SortExpression="adet" />
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
                <asp:SqlDataSource ID="filmlersql" runat="server" ConnectionString="<%$ ConnectionStrings:CdSiteConnectionString %>" SelectCommand="select df.*, lf.ad filmTur, lf.id ft_id from dt_film df join lu_filmTur lf on df.filmTur_id=lf.id"></asp:SqlDataSource>
                <br />
                <div style="height: 37px">
                    <asp:Button ID="btn_fsat" runat="server" Height="38px" OnClick="btn_fsat_Click" Style="margin-left: 297px" Text="Seçilen Filmi Sat" Width="145px" />
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Visible="false" GroupingText="Müzikler" Height="558px">
                <asp:GridView ID="muzikler" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id,mzk_id" DataSourceID="muziklerr" Height="289px" Width="740px" OnSelectedIndexChanged="muzikler_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                        <asp:BoundField DataField="ad" HeaderText="Adı" SortExpression="ad" />
                        <asp:BoundField DataField="sanatci" HeaderText="Sanatçı" SortExpression="sanatci" />
                        <asp:BoundField DataField="album" HeaderText="Albüm Adı" SortExpression="album" />
                        <asp:BoundField DataField="sure" HeaderText="Süresi" SortExpression="sure" />
                        <asp:BoundField DataField="yapimYil" HeaderText="Yapım Yılı" SortExpression="yapimYil" />
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
                <br />
                <div style="height: 37px">
                    <asp:Button ID="btn_msat" runat="server" Height="38px" OnClick="btn_msat_Click" Style="margin-left: 297px" Text="Seçilen Müziği Sat" Width="145px" />
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel3" runat="server" Visible="false" GroupingText="Oyunlar">
                <asp:GridView ID="oyunlar" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id,oyunTur_id" DataSourceID="oyunsql" Height="258px" Width="741px" OnSelectedIndexChanged="oyunlar_SelectedIndexChanged">
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
                <asp:SqlDataSource ID="oyunsql" runat="server" ConnectionString="<%$ ConnectionStrings:CdSiteConnectionString %>" SelectCommand="select do.*,lo.ad oyunTur,lo.id oyunTur_id from dt_oyun do join lu_oyunTur lo on do.oyunTur_id=lo.id"></asp:SqlDataSource>
                <br />
                <div style="height: 37px">
                    <asp:Button ID="btn_osat" runat="server" Height="38px" OnClick="btn_osat_Click" Style="margin-left: 297px" Text="Seçilen Oyunu Sat" Width="145px" />
                </div>
            </asp:Panel>
        </div>
    </div>
    <br />
</asp:Content>

