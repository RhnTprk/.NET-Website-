<%@ Page Title="" Language="C#" MasterPageFile="~/uye/uyePaneller.Master" AutoEventWireup="true" CodeBehind="~/uye/kullanicibilgi.aspx.cs" Inherits="CdSite.kullanicilar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="height: 578px">
        <asp:GridView ID="kullanicilarListe" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="kullanicisql" Height="292px" Width="749px">
            <Columns>
                <asp:BoundField DataField="ad" HeaderText="Ad" SortExpression="ad" />
                <asp:BoundField DataField="soyad" HeaderText="Soyad" SortExpression="soyad" />
                <asp:BoundField DataField="tcNo" HeaderText="T.C No" SortExpression="tcNo" />
                <asp:BoundField DataField="dogumTarih" HeaderText="Doğum Tarihi" SortExpression="dogumTarih" />
                <asp:BoundField DataField="eposta" HeaderText="E-posta" SortExpression="eposta" />
                <asp:CheckBoxField DataField="yetki" HeaderText="Yetki" SortExpression="yetki" />
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
        <asp:SqlDataSource ID="kullanicisql" runat="server" ConnectionString="<%$ ConnectionStrings:CdSiteConnectionString %>" SelectCommand="SELECT [ad], [soyad], [tcNo], [dogumTarih], [eposta], [yetki] FROM [dt_kullanici]"></asp:SqlDataSource>
    </div>
</asp:Content>
