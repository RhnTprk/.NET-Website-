using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite.uye
{
    public partial class filmKiraButon : System.Web.UI.Page
    {
        public int _film_id { get { return Session["Ukiralanacak_id"] == null ? 0 : int.Parse(Session["Ukiralanacak_id"].ToString()); } }

        veriDataContext _dc = new veriDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (_film_id == 0)
                Response.Redirect("filmKiralama.aspx");
            var guncelle = _dc.dt_films.FirstOrDefault(g => g.id == _film_id);
            lbl_filmad.Text = guncelle.ad;
        }

        protected void btn_kirala_Click(object sender, EventArgs e)
        {
            var kontrol = _dc.tx_filmKiras.FirstOrDefault(k => k.kullanici_id.Equals(Session["Uthis_id"]) && k.film_id == _film_id);
            var film = _dc.dt_films.FirstOrDefault(g => g.id == _film_id);
            
            if (kontrol == null)
            {              
                tx_filmKira ekle = new tx_filmKira();
                ekle.kullanici_id = Convert.ToInt32(Session["Uthis_id"]);
                ekle.film_id = _film_id;
                if (film.adet < Convert.ToInt16(txt_adet.Text))
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Girdiğiniz adette film mevcut değil...')</script>");
                else
                {
                    ekle.adet = Convert.ToInt16(txt_adet.Text);
                    ekle.ucret = Convert.ToDouble(ekle.adet * film.fiyat);
                    if (txt_atarih.Text.Trim() == "")
                        txt_atarih.Text = DateTime.Now.ToString("dd.MM.yyyy");
                    ekle.alinanTarih = DateTime.Parse(txt_atarih.Text);
                    ekle.teslimTarih = ekle.alinanTarih.AddDays(3);
                    film.adet = Convert.ToInt16(Convert.ToInt32(film.adet) - Convert.ToInt32(ekle.adet));
                    _dc.tx_filmKiras.InsertOnSubmit(ekle);
                    _dc.SubmitChanges();

                    lbl_ucret.Text = Convert.ToString(ekle.ucret);
                    lbl_ttarih.Text = Convert.ToString(ekle.alinanTarih.AddDays(3));
                }
            }
            else if (kontrol != null)
                Response.Write("<script LANGUAGE='JavaScript' >alert('Bu kullanıcı zaten bu filmi kiralamış. Film kiralayanlar kısmından güncelleyebilirsiniz...')</script>");


        }

        protected void kullanicilar_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = kullanicilar.SelectedIndex;
            Session["Uthis_id"] = kullanicilar.DataKeys[index].Value;
        }

        protected void btn_arttır_Click(object sender, EventArgs e)
        {
            var guncel = _dc.tx_filmKiras.FirstOrDefault(g => g.film_id == _film_id);
            DateTime tarih = Convert.ToDateTime(lbl_ttarih.Text);
            lbl_ttarih.Text = Convert.ToString(tarih.AddDays(1));
            guncel.teslimTarih = Convert.ToDateTime(lbl_ttarih.Text);
            _dc.SubmitChanges();
        }
    }
}