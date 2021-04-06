using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite
{
    public partial class adminEkle : System.Web.UI.Page
    {
        veriDataContext veri = new veriDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_ekle_Click(object sender, EventArgs e)
        {
            try
            {
                int yas = DateTime.Today.Year - DateTime.Parse(txt_dogumt.Text).Year;
                dt_kullanici k = new dt_kullanici();
                k.ad = txt_ad.Text;
                k.soyad = txt_soyad.Text;
                k.tcNo = Convert.ToDecimal(txt_tcNo.Text);
                if (yas < 18)
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Kullanıcı 18 yaşından küçük olamaz!!!')</script>");
                    return;
                }
                else if(DateTime.Parse(txt_dogumt.Text).Year > DateTime.Today.Year)
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Girilen tarih hatalı!!!')</script>");
                    return;
                }
                k.dogumTarih = Convert.ToDateTime(txt_dogumt.Text);
                k.eposta = txt_eposta.Text;
                k.sifre = txt_sifre.Text;
                if(txt_sifre.Text.Trim().Length < 8)
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Şifre 8 karakterden az olamaz !!!')</script>");
                    return;
                }
                if (box_yetki.Checked)
                    k.yetki = true;
                else
                    k.yetki = false;
                var kontrol = veri.dt_kullanicis.FirstOrDefault(c => c.tcNo == Convert.ToDecimal(txt_tcNo.Text) || c.eposta == txt_eposta.Text);
                if (kontrol != null)
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Böyle bir kullanıcı zaten var !!!')</script>");
                }
                else
                {
                    veri.dt_kullanicis.InsertOnSubmit(k);
                    veri.SubmitChanges();
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Kullanıcı başarıyla eklendi...')</script>");
                }
            }
            catch
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Lütfen bilgileri kontrol edip tekrar deneyiniz...')</script>");
            }
        }
    }
}