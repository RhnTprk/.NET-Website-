<%@ Page Title="" Language="C#" MasterPageFile="~/uye/uyePaneller.Master" AutoEventWireup="true" CodeBehind="filmKiralama.aspx.cs" Inherits="CdSite.uye.filmKiralama" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 545px">
        <div style="height: 30px">
            <asp:Label ID="Label1" runat="server" Style="font-weight: 700; font-size: xx-large; color: #0000CC" Text="Listelenecek veriyi seçin:"></asp:Label>
            <asp:DropDownList ID="veriListe" runat="server" Height="17px" Style="margin-left: 16px" Width="206px" OnSelectedIndexChanged="veriListe_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem Value="1">Filmler</asp:ListItem>
                <asp:ListItem Value="2">Film Kiralayanlar</asp:ListItem>
            </asp:DropDownList>
            <asp:Panel ID="Panel1" runat="server" GroupingText="Filmler">
                <asp:GridView ID="liste" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="filmlersql" OnSelectedIndexChanged="liste_SelectedIndexChanged">
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
                <asp:SqlDataSource ID="filmlersql" runat="server" ConnectionString="<%$ ConnectionStrings:CdSiteConnectionString %>" SelectCommand="select df.*, lf.ad filmTur, lf.id ft_id from dt_film df
join lu_filmTur lf on df.filmTur_id=lf.id"></asp:SqlDataSource>
                <br />
                <div style="height: 37px">
                    <asp:Button ID="btn_kirala" runat="server" Height="38px" OnClick="btn_kirala_Click" Style="margin-left: 297px" Text="Seçilen Filmi Kirala" Width="145px" />
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Visible="false" GroupingText="Film Kiralayanlar">
                <asp:GridView ID="kListe" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="kiralayanlarsql" DataKeyNames="kullanici_id,film_id,kira_id" Height="185px" Width="487px" Style="margin-top: 20px; margin-left: 0px;" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnSelectedIndexChanged="kListe_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                        <asp:BoundField DataField="ad" HeaderText="Ad" SortExpression="ad" />
                        <asp:BoundField DataField="soyad" HeaderText="Soyad" SortExpression="soyad" />
                        <asp:BoundField DataField="eposta" HeaderText="E-Posta" SortExpression="eposta" />
                        <asp:BoundField DataField="filmAdı" HeaderText="Film Adı" SortExpression="filmAdı" />
                        <asp:BoundField DataField="adet" HeaderText="Adet" SortExpression="adet" />
                        <asp:BoundField DataField="ucret" HeaderText="Ücret" SortExpression="ucret" />
                        <asp:BoundField DataField="atarih" HeaderText="Alınan Tarih" SortExpression="atarih" />
                        <asp:BoundField DataField="ttarih" HeaderText="Teslim Tarihi" SortExpression="ttarih" />
                        <asp:BoundField DataField="itarih" HeaderText="İade Tarihi" SortExpression="itarih" />
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
                <asp:SqlDataSource ID="kiralayanlarsql" runat="server" ConnectionString="<%$ ConnectionStrings:CdSiteConnectionString %>" SelectCommand="select dk.id kullanici_id,dk.ad ad,dk.soyad soyad,dk.eposta eposta,df.id film_id,df.ad filmAdı,tf.id kira_id ,tf.adet adet,tf.ucret ucret,tf.alinanTarih atarih,tf.teslimTarih ttarih,tf.iadeTarih itarih from dt_film df join tx_filmKira tf on df.id=tf.film_id join dt_kullanici dk on tf.kullanici_id=dk.id"></asp:SqlDataSource>
                <div style="height: 34px; margin-top: 22px">
                    <asp:Button ID="btn_guncelle" runat="server" Height="33px" Style="margin-left: 180px" Text="Bilgileri Güncelle" Width="130px" OnClick="btn_guncelle_Click" />
                    <asp:Button ID="btn_sil" runat="server" Height="32px" OnClick="btn_sil_Click" Style="margin-left: 135px; margin-bottom: 0px" Text="SİL" Width="128px" />
                </div>
            </asp:Panel>

        </div>
    </div>
    <br />
</asp:Content>

