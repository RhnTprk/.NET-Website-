﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Paneller.Master" AutoEventWireup="true" CodeBehind="~/admin/filmEkle.aspx.cs" Inherits="CdSite.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="height: 506px; width: 741px;">
        <div style="width: 353px">
            <div style="width: 99px; float: left; margin-left: 10px; height: 19px; margin-top: 12px;"><strong style="color: #CC0000">Film Adı:</strong></div>
            <asp:TextBox ID="txt_adi" runat="server" Style="width: 200px; height: 35px; line-height: 45px; margin-left: 5px; border-radius: 5px;"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="**" ControlToValidate="txt_adi" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>
        </div>
        <div style="width: 353px">
            <div style="width: 100px; float: left; margin-left: 10px; margin-top: 12px;"><strong style="color: #CC0000">Yapım Yılı:</strong></div>
            <asp:TextBox ID="txt_yapimyili" runat="server" Style="width: 200px; height: 35px; line-height: 45px; margin-left: 5px; border-radius: 5px;"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="**" SetFocusOnError="true" ValidationExpression="\d{4}" ControlToValidate="txt_yapimyili" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RegularExpressionValidator>
        </div>
        <div style="width: 353px">
            <div style="width: 100px; float: left; margin-left: 10px; margin-top: 12px;"><strong style="color: #CC0000">Yapımcı:</strong></div>
            <asp:TextBox ID="txt_yapimci" runat="server" Style="width: 200px; height: 35px; line-height: 45px; margin-left: 5px; border-radius: 5px;"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="**" ControlToValidate="txt_yapimci" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>

        </div>
        <div style="width: 353px">
            <div style="width: 100px; float: left; margin-left: 10px; margin-top: 12px;"><strong style="color: #CC0000">Süresi:</strong></div>
            <asp:TextBox ID="txt_sure" runat="server" Style="width: 200px; height: 35px; line-height: 45px; margin-left: 5px; border-radius: 5px;"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="**" SetFocusOnError="true" ValidationExpression="\d{2}:\d{2}:\d{2}" ControlToValidate="txt_sure" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RegularExpressionValidator>
        </div>
        <div style="width: 353px">
            <div style="width: 100px; float: left; margin-left: 10px; margin-top: 12px;"><strong style="color: #CC0000">Barkod No:</strong></div>
            <asp:TextBox ID="txt_barkod" runat="server" Style="width: 200px; height: 35px; line-height: 45px; margin-left: 5px; border-radius: 5px;"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="**" ControlToValidate="txt_barkod" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>
        </div>
        <div style="width: 353px; height: 44px;">
            <div style="width: 100px; float: left; margin-left: 10px; margin-top: 12px;"><strong style="color: #CC0000">Fiyatı:</strong></div>
            <asp:TextBox ID="txt_fiyat" runat="server" Style="width: 200px; height: 35px; line-height: 45px; margin-left: 5px; border-radius: 5px;"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="**" ControlToValidate="txt_fiyat" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>
        </div>
        <div style="width: 353px; height: 42px;">
            <div style="width: 100px; float: left; margin-left: 10px; margin-top: 12px;"><strong style="color: #CC0000">Adet:</strong></div>
            <asp:TextBox ID="txt_adet" runat="server" Style="width: 200px; height: 35px; line-height: 45px; margin-left: 5px; border-radius: 5px;"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="**" ControlToValidate="txt_adet" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>
        </div>
        <div style="width: 353px">
            <div style="width: 108px; float: left; margin-left: 10px; margin-top: 12px;"><strong style="color: #CC0000">Film Türü:</strong></div>
            <asp:DropDownList ID="turListe" runat="server" DataSourceID="SqlDataSource1" DataTextField="ad" DataValueField="id" Width="200px" Height="33px" style="margin-top: 11px"></asp:DropDownList>
            <%--            <asp:ListBox ID="turListe" runat="server" DataSourceID="SqlDataSource1" DataTextField="ad" DataValueField="ad" Height="87px" style="margin-left: 7px; margin-top: 9px"></asp:ListBox>--%>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CdSiteConnectionString %>" SelectCommand="SELECT id,[ad] FROM [lu_filmTur]"></asp:SqlDataSource>

        </div>
        <div style="margin-top: 100px; margin-left: 187px; height: 55px; width: 182px; margin-top: 12px;">
            <asp:Button ID="btn_dbekle" runat="server" Height="41px" Text="Ekle" Width="180px" OnClick="btn_dbekle_Click" ValidationGroup="bg" />
        </div>
    </div>
</asp:Content>

