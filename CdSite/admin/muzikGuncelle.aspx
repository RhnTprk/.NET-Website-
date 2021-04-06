<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Paneller.Master" AutoEventWireup="true" CodeBehind="~/admin/muzikGuncelle.aspx.cs" Inherits="CdSite.muzikGuncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <div style="height: 500px; width: 527px;">
        <div style="width: 353px">
            <div style="width:99px; float:left; margin-left:10px; height: 19px; margin-top: 12px;" ><strong style="color: #CC0000">Müzik Adı:</strong></div>
            <asp:TextBox ID="txt_adi" runat="server" style="width:200px; height:35px; line-height:45px; margin-left:5px; border-radius:5px;" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="**" ControlToValidate="txt_adi" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>
        </div>
        <div style="width: 353px">
            <div style="width:100px;  float:left; margin-left:10px; margin-top: 12px;" ><strong style="color: #CC0000">Sanatçı:</strong></div>
            <asp:TextBox ID="txt_sanatci" runat="server" style="width:200px; height:35px; line-height:45px; margin-left:5px; border-radius:5px;" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="**" ControlToValidate="txt_sanatci" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>
        </div>
        <div style="width: 353px">
            <div style="width:100px;  float:left; margin-left:10px;margin-top: 12px;" ><strong style="color: #CC0000">Albüm Adı:</strong></div>
            <asp:TextBox ID="txt_albumAdi" runat="server" style="width:200px; height:35px; line-height:45px; margin-left:5px; border-radius:5px;" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="**" ControlToValidate="txt_albumAdi" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>
        </div>
        <div style="width: 353px">
            <div style="width:100px;  float:left; margin-left:10px;margin-top: 12px;" ><strong style="color: #CC0000">Süresi:</strong></div>
            <asp:TextBox ID="txt_sure" runat="server" style="width:200px; height:35px; line-height:45px; margin-left:5px; border-radius:5px;" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="**" ControlToValidate="txt_sure" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>
        </div>
        <div style="width: 353px">
            <div style="width:100px;  float:left; margin-left:10px;margin-top: 12px;" ><strong style="color: #CC0000">Yapım Yılı:</strong></div>
            <asp:TextBox ID="txt_yapimyili" runat="server" style="width:200px; height:35px; line-height:45px; margin-left:5px; border-radius:5px;" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="**" ControlToValidate="txt_yapimyili" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>
        </div>
        <div style="width: 353px; height: 44px;">
            <div style="width:100px;  float:left; margin-left:10px;margin-top: 12px;" ><strong style="color: #CC0000">Barkod No:</strong></div>
            <asp:TextBox ID="txt_barkod" runat="server" style="width:200px; height:35px; line-height:45px; margin-left:5px; border-radius:5px;" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="**" ControlToValidate="txt_barkod" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>
        </div>
        <div style="width: 353px; height: 44px;">
            <div style="width:100px;  float:left; margin-left:10px;margin-top: 12px;" ><strong style="color: #CC0000">Adet:</strong></div>
            <asp:TextBox ID="txt_adet" runat="server" style="width:200px; height:35px; line-height:45px; margin-left:5px; border-radius:5px;" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="**" ControlToValidate="txt_adet" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>
        </div>
         <div style="width: 353px; height: 44px;">
            <div style="width:100px;  float:left; margin-left:10px;margin-top: 12px;" ><strong style="color: #CC0000">Fiyatı:</strong></div>
            <asp:TextBox ID="txt_fiyat" runat="server" style="width:200px; height:35px; line-height:45px; margin-left:5px; border-radius:5px;" ></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="**" ControlToValidate="txt_fiyat" Display="Dynamic" Font-Bold="true" ForeColor="Maroon" Font-Size="Large" ValidationGroup="bg"></asp:RequiredFieldValidator>
        </div>
        <div style="width: 353px">
            <div style="width:100px;  float:left; margin-left:10px;margin-top: 12px;" ><strong style="color: #CC0000">Müzik Türü:</strong></div>
            <asp:DropDownList ID="turListe" runat="server" DataSourceID="muzikturler" DataTextField="ad" DataValueField="id" style="margin-left: 7px; margin-top: 9px; width:200px"></asp:DropDownList>
<%--            <asp:ListBox ID="turListe" runat="server" DataSourceID="muzikturler" DataTextField="ad" DataValueField="ad" Height="87px" style="margin-left: 7px; margin-top: 9px"></asp:ListBox>--%>
            <asp:SqlDataSource ID="muzikturler" runat="server" ConnectionString="<%$ ConnectionStrings:CdSiteConnectionString %>" SelectCommand="SELECT id,[ad] FROM [lu_muzikTur]"></asp:SqlDataSource>
            
        </div>
        <div style="margin-top:100px; margin-left:187px; height: 55px; width: 182px;margin-top: 12px;" >
            <asp:Button ID="btn_dbekle" runat="server" Height="41px" Text="Güncelle" Width="180px" OnClick="btn_dbekle_Click" ValidationGroup="bg"/>
        </div>
    </div>
</asp:Content>

