using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite.admin
{
    public partial class satMuzik : System.Web.UI.Page
    {
        public int _muzik_id { get { return Session["satM_id"] == null ? 0 : int.Parse(Session["satM_id"].ToString()); } }

        veriDataContext _dc = new veriDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (_muzik_id == 0)
                Response.Redirect("satis.aspx");
            var muzik = _dc.dt_muziks.FirstOrDefault(f => f.id == _muzik_id);
            lbl_muzikad.Text = muzik.ad;
        }

        protected void btn_sat_Click(object sender, EventArgs e)
        {          
            var kontrol = _dc.tx_satis.FirstOrDefault(k => k.kullanici_id.Equals(Session["satMuzikKullanici_id"]) && k.muzik_id == _muzik_id);
            var muzik = _dc.dt_muziks.FirstOrDefault(g => g.id == _muzik_id);

            if (kontrol == null)
            {              
                tx_sati ekle = new tx_sati();
                ekle.kullanici_id = Convert.ToInt32(Session["satMuzikKullanici_id"]);
                ekle.muzik_id = _muzik_id;
                if (muzik.adet < Convert.ToInt16(txt_adet.Text))
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Girdiğiniz adette müzik mevcut değil...')</script>");
                else
                {
                    ekle.adet = Convert.ToInt16(txt_adet.Text);
                    ekle.ucret = Convert.ToDouble(ekle.adet * muzik.fiyat);
                    if (txt_atarih.Text.Trim() == "" || DateTime.Parse(txt_atarih.Text) > DateTime.Now)
                        txt_atarih.Text = DateTime.Now.ToString("dd.MM.yyyy");
                    ekle.tarih = DateTime.Parse(txt_atarih.Text);
                    muzik.adet = Convert.ToInt16(Convert.ToInt32(muzik.adet) - Convert.ToInt32(ekle.adet));
                    _dc.tx_satis.InsertOnSubmit(ekle);
                    _dc.SubmitChanges();
                    lbl_ucret.Text = Convert.ToString(ekle.ucret);
                }
            }
            else if (kontrol != null)
                Response.Write("<script LANGUAGE='JavaScript' >alert('Bu kullanıcı zaten bu müziği satın almış. Satış Listesi kısmından güncelleyebilirsiniz...')</script>");
        }
        protected void kullanicilar_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = kullanicilar.SelectedIndex;
            Session["satMuzikKullanici_id"] = kullanicilar.DataKeys[index].Value;
        }
    }
}