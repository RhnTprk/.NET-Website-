using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite.admin
{
    public partial class satOyun : System.Web.UI.Page
    {
        public int _oyun_id { get { return Session["satO_id"] == null ? 0 : int.Parse(Session["satO_id"].ToString()); } }

        veriDataContext _dc = new veriDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (_oyun_id == 0)
                Response.Redirect("satis.aspx");
            var oyun = _dc.dt_oyuns.FirstOrDefault(f => f.id == _oyun_id);
            lbl_oyunad.Text = oyun.ad;
        }

        protected void btn_sat_Click(object sender, EventArgs e)
        {          
            var kontrol = _dc.tx_satis.FirstOrDefault(k => k.kullanici_id.Equals(Session["satOyunKullanici_id"]) && k.oyun_id == _oyun_id);
            var oyun = _dc.dt_oyuns.FirstOrDefault(g => g.id == _oyun_id);

            if (kontrol == null)
            {
                tx_sati ekle = new tx_sati();
                ekle.kullanici_id = Convert.ToInt32(Session["satOyunKullanici_id"]);
                ekle.oyun_id = _oyun_id;
                if (oyun.adet < Convert.ToInt16(txt_adet.Text))
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Girdiğiniz adette oyun mevcut değil...')</script>");
                else
                {
                    ekle.adet = Convert.ToInt16(txt_adet.Text);
                    ekle.ucret = Convert.ToDouble(ekle.adet * oyun.fiyat);
                    if (txt_atarih.Text.Trim() == "" || DateTime.Parse(txt_atarih.Text) > DateTime.Now)
                        txt_atarih.Text = DateTime.Now.ToString("dd.MM.yyyy");
                    ekle.tarih = DateTime.Parse(txt_atarih.Text);
                    oyun.adet = Convert.ToInt16(Convert.ToInt32(oyun.adet) - Convert.ToInt32(ekle.adet));
                    _dc.tx_satis.InsertOnSubmit(ekle);
                    _dc.SubmitChanges();
                    lbl_ucret.Text = Convert.ToString(ekle.ucret);
                }
            }
            else if (kontrol != null)
                Response.Write("<script LANGUAGE='JavaScript' >alert('Bu kullanıcı zaten bu oyunu satın almış. Satış Listesi kısmından güncelleyebilirsiniz...')</script>");
        }
        protected void kullanicilar_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = kullanicilar.SelectedIndex;
            Session["satOyunKullanici_id"] = kullanicilar.DataKeys[index].Value;
        }
    }
}