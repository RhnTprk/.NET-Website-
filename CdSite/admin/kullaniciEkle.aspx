<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Paneller.Master" AutoEventWireup="true" CodeBehind="~/admin/kullaniciEkle.aspx.cs" Inherits="CdSite.adminEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="height: 577px">
        <div style="width: 353px">
            <div style="width: 99px; float: left; margin-left: 10px; height: 19px; margin-top: 12px;"><strong style="color: #CC0000">Ad:</strong></div>
            <asp:TextBox ID="txt_ad" runat="server" Style="width: 200px; height: 35px; line-height: 45px; margin-left: 5px; border-radius: 5px;"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="**" ControlToValidate="txt_ad" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>

        </div>
        <div style="width: 353px">
            <div style="width: 100px; float: left; margin-left: 10px; margin-top: 12px;"><strong style="color: #CC0000">Soyad:</strong></div>
            <asp:TextBox ID="txt_soyad" runat="server" Style="width: 200px; height: 35px; line-height: 45px; margin-left: 5px; border-radius: 5px;"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="**" ControlToValidate="txt_soyad" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>
        </div>
        <div style="width: 353px">
            <div style="width: 100px; float: left; margin-left: 10px; margin-top: 12px;"><strong style="color: #CC0000">T.C No:</strong></div>
            <asp:TextBox ID="txt_tcNo" runat="server" Style="width: 200px; height: 35px; line-height: 45px; margin-left: 5px; border-radius: 5px;"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="**" SetFocusOnError="true" ValidationExpression="\d{11}" ControlToValidate="txt_tcNo" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RegularExpressionValidator>
        </div>
        <div style="width: 353px">
            <div style="width: 100px; float: left; margin-left: 10px; margin-top: 12px;"><strong style="color: #CC0000">D.Tarihi:</strong></div>
            <asp:TextBox ID="txt_dogumt" runat="server" Style="width: 200px; height: 35px; line-height: 45px; margin-left: 5px; border-radius: 5px;"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="**" ControlToValidate="txt_dogumt" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg" Operator="DataTypeCheck" Type="Date" SetFocusOnError="True"></asp:CompareValidator>
        </div>
        <div style="width: 353px">
            <div style="width: 100px; float: left; margin-left: 10px; margin-top: 15px;"><strong style="color: #CC0000">E-Posta:</strong></div>
            <asp:TextBox ID="txt_eposta" runat="server" Style="line-height: 45px; margin-left: 5px; border-radius: 5px;" Height="32px" Width="199px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="**" ControlToValidate="txt_eposta" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>
        </div>
        <div style="width: 353px; height: 44px;">
            <div style="width: 100px; float: left; margin-left: 10px; margin-top: 12px;"><strong style="color: #CC0000">Şifre:</strong></div>
            <asp:TextBox ID="txt_sifre" runat="server" Style="width: 200px; height: 35px; line-height: 45px; margin-left: 5px; border-radius: 5px;" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="**" ControlToValidate="txt_sifre" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>
        </div>
        <div style="width: 353px; height: 44px;">
            <div style="width: 100px; float: left; margin-left: 10px; margin-top: 12px;"><strong style="color: #CC0000">Admin :</strong></div>
            <div style="width: 100px; float: left; margin-left: 10px; margin-top: 12px;">
                <asp:CheckBox ID="box_yetki" runat="server" />
            </div>
        </div>
        <div style="margin-top: 30px">
            <asp:Button ID="btn_ekle" runat="server" Text="Ekle" Height="39px" Width="140px" Style="margin-left: 203px" OnClick="btn_ekle_Click" ValidationGroup="bg" />
        </div>
    </div>
</asp:Content>
