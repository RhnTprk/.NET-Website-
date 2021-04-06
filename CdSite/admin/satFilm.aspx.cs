using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite.admin
{
    public partial class satFilm : System.Web.UI.Page
    {
        public int _film_id { get { return Session["satF_id"] == null ? 0 : int.Parse(Session["satF_id"].ToString()); } }

        veriDataContext _dc = new veriDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (_film_id == 0)
                Response.Redirect("satis.aspx");
            var film = _dc.dt_films.FirstOrDefault(f => f.id == _film_id);
            lbl_filmad.Text = film.ad;
        }

        protected void btn_sat_Click(object sender, EventArgs e)
        {           
            var kontrol = _dc.tx_satis.FirstOrDefault(k => k.kullanici_id.Equals(Session["satFilmKullanici_id"]) && k.film_id == _film_id);
            var film = _dc.dt_films.FirstOrDefault(g => g.id == _film_id);
            
            if (kontrol == null)
            {             
                tx_sati ekle = new tx_sati();
                ekle.kullanici_id = Convert.ToInt32(Session["satFilmKullanici_id"]);
                ekle.film_id = _film_id;
                if (film.adet < Convert.ToInt16(txt_adet.Text))
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Girdiğiniz adette film mevcut değil...')</script>");
                else
                {
                    ekle.adet = Convert.ToInt16(txt_adet.Text);
                    ekle.ucret = Convert.ToDouble(ekle.adet * film.fiyat);
                    if (txt_atarih.Text.Trim() == "" || DateTime.Parse(txt_atarih.Text) > DateTime.Now)
                        txt_atarih.Text = DateTime.Now.ToString("dd.MM.yyyy");
                    ekle.tarih = DateTime.Parse(txt_atarih.Text);
                    film.adet = Convert.ToInt16(Convert.ToInt32(film.adet) - Convert.ToInt32(ekle.adet));
                    _dc.tx_satis.InsertOnSubmit(ekle);
                    _dc.SubmitChanges();
                    lbl_ucret.Text = Convert.ToString(ekle.ucret);                  
                }
            }
            else if (kontrol != null)
                Response.Write("<script LANGUAGE='JavaScript' >alert('Bu kullanıcı zaten bu filmi satın almış. Satış Listesi kısmından güncelleyebilirsiniz...')</script>");
        }

        protected void kullanicilar_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = kullanicilar.SelectedIndex;
            Session["satFilmKullanici_id"] = kullanicilar.DataKeys[index].Value;
        }
    }
    
}