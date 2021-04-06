using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite.admin
{
    public partial class btnKguncelle : System.Web.UI.Page
    {
        public int _k_id { get { return Session["k_id"] == null ? 0 : int.Parse(Session["k_id"].ToString()); } }

        veriDataContext _dc = new veriDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (_k_id == 0)
            {
                Response.Redirect("kGuncelle.aspx");
                return;
            }
            if (IsPostBack)
                return;

            var guncel = _dc.dt_kullanicis.FirstOrDefault(k => k.id == _k_id);
            txt_ad.Text = guncel.ad;
            txt_soyad.Text = guncel.soyad;
            txt_tcNo.Text = Convert.ToString(guncel.tcNo);
            txt_dogumt.Text = Convert.ToString(guncel.dogumTarih.ToString("dd.MM.yyyy"));
            txt_eposta.Text = guncel.eposta;
            txt_sifre.Text = guncel.sifre;
        }

        protected void btn_ekle_Click(object sender, EventArgs e)
        {
            int yas = DateTime.Today.Year - DateTime.Parse(txt_dogumt.Text).Year;
            var guncel = _dc.dt_kullanicis.FirstOrDefault(k => k.id == _k_id);
            guncel.ad = txt_ad.Text;
            guncel.soyad = txt_soyad.Text;
            guncel.tcNo = Convert.ToDecimal(txt_tcNo.Text);
            if(guncel.yetki == true && yas < 18)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Admin 18 yaşından küçük olamaz!!!')</script>");
                return;
            }
            else if(guncel.yetki == false && yas < 13)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Üye 13 yaşından küçük olamaz!!!')</script>");
                return;
            }
            else if (DateTime.Parse(txt_dogumt.Text).Year > DateTime.Today.Year)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Girilen tarih hatalı!!!')</script>");
                return;
            }
            guncel.dogumTarih = Convert.ToDateTime(txt_dogumt.Text);
            guncel.eposta = txt_eposta.Text;
            guncel.sifre = txt_sifre.Text;
            if (txt_sifre.Text.Trim().Length < 8)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Şifre 8 karakterden az olamaz !!!')</script>");
                return;
            }
            _dc.SubmitChanges();
            Response.Write("<script LANGUAGE='JavaScript' >alert('Bilgiler güncellendi...')</script>");
        }
    }
}