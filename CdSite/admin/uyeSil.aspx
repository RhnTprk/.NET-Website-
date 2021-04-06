<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Paneller.Master" AutoEventWireup="true" CodeBehind="~/admin/uyeSil.aspx.cs" Inherits="CdSite.uyeSil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div style="height: 577px">
        <asp:GridView ID="kullanicilar" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="kullanici" DataKeyNames="id" Height="238px" Width="741px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                <asp:BoundField DataField="ad" HeaderText="Ad" SortExpression="ad" />
                <asp:BoundField DataField="soyad" HeaderText="Soyad" SortExpression="soyad" />
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
        <asp:SqlDataSource ID="kullanici" runat="server" ConnectionString="<%$ ConnectionStrings:CdSiteConnectionString %>" SelectCommand="SELECT id,[ad], [soyad], [eposta], [yetki] FROM [dt_kullanici] where yetki=0"></asp:SqlDataSource>
        <div style="height: 43px; margin-top:20px; ">
            <asp:Button ID="btn_sil" runat="server" Height="43px" OnClick="btn_sil_Click" style="margin-left: 306px" Text="Seçilen Üyeyi Sil" Width="158px" />
        </div>
    </div>

</asp:Content>

