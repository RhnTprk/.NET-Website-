<%@ Page Title="" Language="C#" MasterPageFile="~/uye/uyePaneller.Master" AutoEventWireup="true" CodeBehind="~/uye/muzikbilgi.aspx.cs" Inherits="CdSite.muzikbilgi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="height: 578px">
        
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="muziksql" Height="296px" Width="752px">
                <Columns>
                    <asp:BoundField DataField="ad" HeaderText="Ad" SortExpression="ad" />
                    <asp:BoundField DataField="sanatci" HeaderText="Sanatçı" SortExpression="sanatci" />
                    <asp:BoundField DataField="album" HeaderText="Albüm" SortExpression="album" />
                    <asp:BoundField DataField="sure" HeaderText="Süre" SortExpression="sure" />
                    <asp:BoundField DataField="yapimYil" HeaderText="Yapım Yılı" SortExpression="yapimYil" />
                    <asp:BoundField DataField="adet" HeaderText="Adet" SortExpression="adet" />
                    <asp:BoundField DataField="fiyat" HeaderText="Fiyat" SortExpression="fiyat" />    
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
            <asp:SqlDataSource ID="muziksql" runat="server" ConnectionString="<%$ ConnectionStrings:CdSiteConnectionString %>" SelectCommand="select dm.*, lm.ad muzikTur, lm.id mzk_id from dt_muzik dm join lu_muzikTur lm on dm.muzikTur_id=lm.id"></asp:SqlDataSource>
        
        </div>
</asp:Content>
