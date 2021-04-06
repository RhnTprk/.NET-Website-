<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Paneller.Master" AutoEventWireup="true" CodeBehind="kGuncelle.aspx.cs" Inherits="CdSite.admin.kGuncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="height: 578px">
        <div style="height:84px">

                <asp:Label ID="Label5" runat="server" Style="color: #000066; font-weight: 700; font-size: x-large" Text="Kullanıcı ara :"></asp:Label>
                &nbsp;<asp:TextBox ID="txt_arama" runat="server" Height="16px" Style="margin-left: 13px" AutoPostBack="True"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="**" ControlToValidate="txt_arama" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>

        </div>
        <asp:GridView ID="kullanicilarListe" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="kullanicisql" DataKeyNames="id" Height="225px" Width="466px" OnSelectedIndexChanged="kullanicilarListe_SelectedIndexChanged" style="margin-left: 98px">
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                <asp:BoundField DataField="ad" HeaderText="ad" SortExpression="ad" />
                <asp:BoundField DataField="soyad" HeaderText="soyad" SortExpression="soyad" />
                <asp:BoundField DataField="tcNo" HeaderText="tcNo" SortExpression="tcNo" />
                <asp:BoundField DataField="dogumTarih" HeaderText="dogumTarih" SortExpression="dogumTarih" />
                <asp:BoundField DataField="eposta" HeaderText="eposta" SortExpression="eposta" />
                <asp:CheckBoxField DataField="yetki" HeaderText="yetki" SortExpression="yetki" />
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
        <asp:SqlDataSource ID="kullanicisql" runat="server" ConnectionString="<%$ ConnectionStrings:CdSiteConnectionString %>" SelectCommand="SELECT [id], [ad], [soyad], [tcNo], [dogumTarih], [eposta], [yetki] FROM [dt_kullanici] WHERE (([ad] LIKE '%' + @ad + '%') OR ([eposta] LIKE '%' + @eposta + '%') OR ([soyad] LIKE '%' + @soyad + '%'))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txt_arama" Name="ad" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txt_arama" Name="eposta" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txt_arama" Name="soyad" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div style="height: 42px; margin-top: 28px">
            <asp:Button ID="btn_kGuncelle" runat="server" Height="37px" OnClick="btn_kGuncelle_Click" style="margin-left: 293px" Text="Seçilen Kullanıcıyı Güncele" Width="185px" BorderStyle="None" />
        </div>
    </div>
</asp:Content>

