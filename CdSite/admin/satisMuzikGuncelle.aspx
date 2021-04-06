<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Paneller.Master" AutoEventWireup="true" CodeBehind="satisMuzikGuncelle.aspx.cs" Inherits="CdSite.admin.satisMuzikGuncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <div style="height: 506px; width: 741px;">
        <div style="height: 178px">

            <asp:Label ID="Label1" runat="server" Style="color: #000066; font-weight: 700; font-size: x-large" Text="Ad :"></asp:Label>
            &nbsp;<asp:Label ID="lbl_ad" runat="server" Style="color: #CC0000; font-weight: 700; font-size: x-large"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            <asp:Label ID="Label2" runat="server" Style="color: #000066; font-weight: 700; font-size: x-large" Text="Soyad :"></asp:Label>
            &nbsp;<asp:Label ID="lbl_soyad" runat="server" Style="color: #CC0000; font-weight: 700; font-size: x-large"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="Label3" runat="server" Style="color: #000066; font-weight: 700; font-size: x-large" Text="E-Posta :"></asp:Label>
            &nbsp;<asp:Label ID="lbl_eposta" runat="server" Style="color: #CC0000; font-weight: 700; font-size: x-large"></asp:Label>

            <br />

            <asp:Label ID="Label4" runat="server" Style="color: #000066; font-weight: 700; font-size: x-large" Text="Müzik Adı :"></asp:Label>
            &nbsp;<asp:Label ID="lbl_muzikad" runat="server" Style="color: #CC0000; font-weight: 700; font-size: x-large"></asp:Label>

        </div>
        <div style="width: 353px">
            <div style="width: 99px; float: left; margin-left: 10px; height: 19px; margin-top: 12px;"><strong style="color: #CC0000">Adet:</strong></div>
            <asp:TextBox ID="txt_adet" runat="server" Style="width: 200px; height: 35px; line-height: 45px; margin-left: 5px; border-radius: 5px;"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="**" ControlToValidate="txt_adet" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>
        </div>          
        <div style="width: 353px">
            <div style="width: 100px; float: left; margin-left: 10px; margin-top: 12px;"><strong style="color: #CC0000">Fiyat:</strong></div>
            <asp:TextBox ID="txt_fiyat" runat="server" Style="width: 200px; height: 35px; line-height: 45px; margin-left: 5px; border-radius: 5px;"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="**" ControlToValidate="txt_fiyat" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>
        </div>
        <div style="width: 353px">
            <div style="width: 100px; float: left; margin-left: 10px; margin-top: 12px;"><strong style="color: #CC0000">Alınan Tarih:</strong></div>
            <asp:TextBox ID="txt_atarih" runat="server" Style="width: 200px; height: 35px; line-height: 45px; margin-left: 5px; border-radius: 5px;"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator4" runat="server" ErrorMessage="**" ControlToValidate="txt_atarih" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg" Operator="DataTypeCheck" Type="Date" SetFocusOnError="True"></asp:CompareValidator>

        </div>
        <div style="height: 199px; margin-top: 20px">
            <asp:Button ID="btn_guncelle" runat="server" Height="45px" Text="Güncelle" Width="129px" Style="margin-left: 156px" OnClick="btn_guncelle_Click" ValidationGroup="bg" />
            <br />
        </div>
    </div>
</asp:Content>

