using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite.admin
{
    public partial class satisMuzikGuncelle : System.Web.UI.Page
    {
        public int m_id { get { return Session["satilanM_id"] == null ? 0 : int.Parse(Session["satilanM_id"].ToString()); } }

        veriDataContext _dc = new veriDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (m_id == 0)
                Response.Redirect("sAlanlar.aspx");
            if (IsPostBack)
                return;
            var tx = _dc.tx_satis.FirstOrDefault(t => t.id == m_id);
            var muzik = _dc.dt_muziks.FirstOrDefault(f => f.id == tx.muzik_id);
            var kullanici = _dc.dt_kullanicis.FirstOrDefault(k => k.id == tx.kullanici_id);
            lbl_ad.Text = kullanici.ad;
            lbl_soyad.Text = kullanici.soyad;
            lbl_eposta.Text = kullanici.eposta;
            lbl_muzikad.Text = muzik.ad;
            txt_adet.Text = Convert.ToString(tx.adet);
            txt_atarih.Text = Convert.ToString(tx.tarih.ToString("dd.MM.yyyy"));
            txt_fiyat.Text = Convert.ToString(tx.ucret);
            muzik.adet += tx.adet;
            _dc.SubmitChanges();
        }

        protected void btn_guncelle_Click(object sender, EventArgs e)
        {
            var tx = _dc.tx_satis.FirstOrDefault(t => t.id == m_id);
            var muzik = _dc.dt_muziks.FirstOrDefault(f => f.id == tx.muzik_id);
            if (muzik.adet < Convert.ToInt16(txt_adet.Text))
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Girdiğiniz sayıda Müzik mevcut değil...')</script>");
            }
            else if (DateTime.Parse(txt_atarih.Text) > DateTime.Today)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Girdiğiniz tarihler hatalı...')</script>");
            }
            else
            {
                tx.adet = Convert.ToInt16(txt_adet.Text);
                tx.tarih = DateTime.Parse(txt_atarih.Text);
                tx.ucret = muzik.fiyat * Convert.ToInt16(txt_adet.Text);
                muzik.adet -= Convert.ToInt16(txt_adet.Text);
                _dc.SubmitChanges();
                Response.Write("<script LANGUAGE='JavaScript' >alert('Bilgiler Güncellendi...')</script>");
            }

        }
    }
}