<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Paneller.Master" AutoEventWireup="true" CodeBehind="sAlanlar.aspx.cs" Inherits="CdSite.admin.sAlanlar" %>

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
            <asp:Panel ID="Panel1" runat="server" GroupingText="Satılan filmler">
                <asp:GridView ID="filmler" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="k_id,film_id,tx_id" DataSourceID="filmlersql" OnSelectedIndexChanged="filmler_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                        <asp:BoundField DataField="ad" HeaderText="Adı" SortExpression="ad" />
                        <asp:BoundField DataField="soyad" HeaderText="Soyadı" SortExpression="soyad" />
                        <asp:BoundField DataField="posta" HeaderText="E-Posta" SortExpression="posta" />
                        <asp:BoundField DataField="film_ad" HeaderText="Film Adı" SortExpression="film_ad" />
                        <asp:BoundField DataField="adet" HeaderText="Adet" SortExpression="adet" />
                        <asp:BoundField DataField="ucret" HeaderText="Ücret" SortExpression="ucret" />
                        <asp:BoundField DataField="tarih" HeaderText="Tarih" SortExpression="tarih" />
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
                <asp:SqlDataSource ID="filmlersql" runat="server" ConnectionString="<%$ ConnectionStrings:CdSiteConnectionString %>" SelectCommand="select dk.id k_id,df.id film_id,ts.id tx_id,dk.ad ad,dk.soyad soyad,dk.eposta posta,df.ad film_ad,ts.adet adet,ts.ucret ucret,ts.tarih tarih from dt_film df join tx_satis ts on df.id = ts.film_id join dt_kullanici dk on ts.kullanici_id = dk.id"></asp:SqlDataSource>
                <div style="height: 34px; margin-top: 22px">
                    <asp:Button ID="btn_fguncelle" runat="server" Height="33px" Style="margin-left: 180px" Text="Bilgileri Güncelle" Width="130px" OnClick="btn_fguncelle_Click" />
                    <asp:Button ID="btn_fsil" runat="server" Height="32px" OnClick="btn_fsil_Click" Style="margin-left: 135px; margin-bottom: 0px" Text="SİL" Width="128px" />
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Visible="false" GroupingText="Satılan müzikler" Height="558px">
                <asp:GridView ID="muzikler" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="k_id,muzik_id,tx_id" DataSourceID="muziklerr" Height="289px" Width="740px" OnSelectedIndexChanged="muzikler_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                        <asp:BoundField DataField="ad" HeaderText="Adı" SortExpression="ad" />
                        <asp:BoundField DataField="soyad" HeaderText="Soyadı" SortExpression="soyad" />
                        <asp:BoundField DataField="posta" HeaderText="E-Posta" SortExpression="posta" />
                        <asp:BoundField DataField="muzik_ad" HeaderText="Müzik Adı" SortExpression="muzik_ad" />
                        <asp:BoundField DataField="adet" HeaderText="Adet" SortExpression="adet" />
                        <asp:BoundField DataField="ucret" HeaderText="Ücret" SortExpression="ucret" />
                        <asp:BoundField DataField="tarih" HeaderText="Tarih" SortExpression="tarih" />
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
                <asp:SqlDataSource ID="muziklerr" runat="server" ConnectionString="<%$ ConnectionStrings:CdSiteConnectionString %>" SelectCommand="select dk.id k_id,df.id muzik_id,ts.id tx_id,dk.ad ad,dk.soyad soyad,dk.eposta posta,df.ad muzik_ad,ts.adet adet,ts.ucret ucret,ts.tarih tarih from dt_muzik df join tx_satis ts on df.id = ts.muzik_id join dt_kullanici dk on ts.kullanici_id = dk.id"></asp:SqlDataSource>
                <div style="height: 34px; margin-top: 22px">
                    <asp:Button ID="btn_mguncelle" runat="server" Height="33px" Style="margin-left: 180px" Text="Bilgileri Güncelle" Width="130px" OnClick="btn_mguncelle_Click" />
                    <asp:Button ID="btn_msil" runat="server" Height="32px" OnClick="btn_msil_Click" Style="margin-left: 135px; margin-bottom: 0px" Text="SİL" Width="128px" />
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel3" runat="server" Visible="false" GroupingText="Satılan oyunlar">
                <asp:GridView ID="oyunlar" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="k_id,oyun_id,tx_id" DataSourceID="oyunsql" Height="258px" Width="741px" OnSelectedIndexChanged="oyunlar_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                        <asp:BoundField DataField="ad" HeaderText="Adı" SortExpression="ad" />
                        <asp:BoundField DataField="soyad" HeaderText="Soyadı" SortExpression="soyad" />
                        <asp:BoundField DataField="posta" HeaderText="E-Posta" SortExpression="posta" />
                        <asp:BoundField DataField="oyun_ad" HeaderText="Oyun Adı" SortExpression="oyun_ad" />
                        <asp:BoundField DataField="adet" HeaderText="Adet" SortExpression="adet" />
                        <asp:BoundField DataField="ucret" HeaderText="Ücret" SortExpression="ucret" />
                        <asp:BoundField DataField="tarih" HeaderText="Tarih" SortExpression="tarih" />
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
                <asp:SqlDataSource ID="oyunsql" runat="server" ConnectionString="<%$ ConnectionStrings:CdSiteConnectionString %>" SelectCommand="select dk.id k_id,df.id oyun_id,ts.id tx_id,dk.ad ad,dk.soyad soyad,dk.eposta posta,df.ad oyun_ad,ts.adet adet,ts.ucret ucret,ts.tarih tarih from dt_oyun df join tx_satis ts on df.id = ts.oyun_id join dt_kullanici dk on ts.kullanici_id = dk.id"></asp:SqlDataSource>
                <div style="height: 34px; margin-top: 22px">
                    <asp:Button ID="btn_oguncelle" runat="server" Height="33px" Style="margin-left: 180px" Text="Bilgileri Güncelle" Width="130px" OnClick="btn_oguncelle_Click" />
                    <asp:Button ID="btn_osil" runat="server" Height="32px" OnClick="btn_osil_Click" Style="margin-left: 135px; margin-bottom: 0px" Text="SİL" Width="128px" />
                </div>
            </asp:Panel>
        </div>
    </div>
    <br />
</asp:Content>

