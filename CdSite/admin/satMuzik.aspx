<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Paneller.Master" AutoEventWireup="true" CodeBehind="satMuzik.aspx.cs" Inherits="CdSite.admin.satMuzik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="height: 506px; width: 741px;">
        <div>
            <asp:Label ID="Label4" runat="server" Style="color: #000066; font-weight: 700; font-size: x-large" Text="Müzik Adı :"></asp:Label>
            &nbsp;<asp:Label ID="lbl_muzikad" runat="server" Style="color: #CC0000; font-weight: 700; font-size: x-large"></asp:Label>

            <br />
            <br />
            <div style="width: 740px; margin-top: 0px; height: 54px;">

                <asp:Label ID="Label5" runat="server" Style="color: #000066; font-weight: 700; font-size: x-large" Text="Kullanıcı ara :"></asp:Label>
                <asp:TextBox ID="txt_arama" runat="server" Height="18px" Style="margin-left: 13px" AutoPostBack="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="**" ControlToValidate="txt_arama" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>
                <asp:GridView ID="kullanicilar" runat="server" Style="margin-left: 348px; margin-top: -60px;" AllowPaging="True" DataSourceID="SqlDataSource1" DataKeyNames="id" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnSelectedIndexChanged="kullanicilar_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="ad" HeaderText="ad" SortExpression="ad" />
                        <asp:BoundField DataField="soyad" HeaderText="soyad" SortExpression="soyad" />
                        <asp:BoundField DataField="eposta" HeaderText="eposta" SortExpression="eposta" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CdSiteConnectionString %>" SelectCommand="SELECT id,[ad], [soyad], [eposta] FROM [dt_kullanici] WHERE (([ad] LIKE '%' + @ad + '%') OR ([eposta] LIKE '%' + @eposta + '%') OR ([soyad] LIKE '%' + @soyad + '%')) 
">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txt_arama" Name="ad" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txt_arama" Name="eposta" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txt_arama" Name="soyad" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="kullanicilarsql" runat="server" ConnectionString="<%$ ConnectionStrings:CdSiteConnectionString %>" SelectCommand="SELECT [ad], [soyad], [eposta] FROM [dt_kullanici] WHERE ([ad] = @ad)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txt_arama" Name="ad" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                &nbsp;
            </div>

        </div>
        <div style="width: 353px">
            <div style="width: 100px; float: left; margin-left: 10px; margin-top: 12px;"><strong style="color: #CC0000">Adet:</strong></div>
            <asp:TextBox ID="txt_adet" runat="server" Style="width: 200px; height: 35px; line-height: 45px; margin-left: 5px; border-radius: 5px;"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="**" ControlToValidate="txt_adet" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>
        </div>
        <div style="width: 353px">
            <div style="width: 100px; float: left; margin-left: 10px; margin-top: 12px;"><strong style="color: #CC0000">Alınan Tarih:</strong></div>
            <asp:TextBox ID="txt_atarih" runat="server" Style="width: 200px; height: 35px; line-height: 45px; margin-left: 5px; border-radius: 5px;"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="**" ControlToValidate="txt_atarih" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg" Operator="DataTypeCheck" Type="Date" SetFocusOnError="True"></asp:CompareValidator>
        </div>
        <div style="height: 134px; margin-top: 20px">

            <asp:Button ID="btn_sat" runat="server" Height="45px" Text="Sat" Width="129px" Style="margin-left: 156px" OnClick="btn_sat_Click" ValidationGroup="bg" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Style="font-weight: 700; font-size: xx-large; color: #0000CC" Text="Ücret :"></asp:Label>
            &nbsp;
            <asp:Label ID="lbl_ucret" runat="server" Style="font-weight: 700; color: #CC0000; font-size: xx-large"></asp:Label>
            <br />
            <br />


        </div>

    </div>
</asp:Content>

