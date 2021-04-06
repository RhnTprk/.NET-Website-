<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KullaniciGiris.aspx.cs" Inherits="CdSite.KullaniciGiris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="width: 1816px; height: 324px; background-image: url('images/303828.jpg'); text-align: center;">
                <strong style="color: white; font-size: 45px; line-height: 150px;">HOŞGELDİNİZ</strong>&nbsp;
            </div>
            <div style="width: 500px; height: 45px; margin: 0 auto; margin-top: 25px;">
                <div style="width: 100px; line-height: 45px; float: left; margin-left: 5px;"><strong>E-posta:</strong></div>
                <asp:TextBox ID="txt_posta" runat="server" MaxLength="100" Width="200px" Height="35px" Style="line-height: 45px; margin-left: 5px; border-radius: 5px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="**" ControlToValidate="txt_posta" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="ug"></asp:RequiredFieldValidator>
            </div>

            <div style="width: 500px; height: 45px; margin: 0 auto; margin-top: 25px;">
                <div style="width: 100px; line-height: 45px; float: left; margin-left: 5px;"><strong>Şifre:</strong></div>
                <asp:TextBox ID="txt_sifre" runat="server" MaxLength="99"  Width="200px" Height="35px" Style="line-height: 45px; margin-left: 5px; border-radius: 5px;" TextMode="Password"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="**" ControlToValidate="txt_sifre" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="ug"></asp:RequiredFieldValidator>
            </div>

            <div style="width: 500px; height: 140px; margin-top: 25px; margin-left: auto; margin-right: auto; margin-bottom: 0;">
                <asp:Button ID="btn_giris" runat="server" Text="GİRİŞ " Style="margin-left: 200px; line-height: 50px;" OnClick="btn_giris_Click" ValidationGroup="ug" Height="43px" Width="94px" />
                <div style="width: 352px; margin-left: 69px; margin-top: 30px;">
                    <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
