using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite.admin
{
    public partial class kiralayanGuncelle : System.Web.UI.Page
    {
        public int _k_id { get { return Session["kiralayan_id"] == null ? 0 : int.Parse(Session["kiralayan_id"].ToString()); } }

        veriDataContext _dc = new veriDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (_k_id == 0)
            {
                Response.Redirect("kirala.aspx");
            }
            if (IsPostBack)
                return;
            filmGetir();
        }

        protected void btn_guncelle_Click(object sender, EventArgs e)
        {
            DateTime atarih = DateTime.Parse(txt_atarih.Text);
            DateTime ttarih = DateTime.Parse(txt_ttarih.Text);
            if (txt_itarih.Text.Trim() == "")
                txt_itarih.Text = "01.01.0001";
            DateTime itarih = DateTime.Parse(txt_itarih.Text);       
            var tx = _dc.tx_filmKiras.FirstOrDefault(t => t.id == _k_id);
            var film = _dc.dt_films.FirstOrDefault(y => y.id == tx.film_id);
            if(film.adet < Convert.ToInt16(txt_adet.Text))
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Girdiğiniz sayıda film mevcut değil...')</script>");
            }
            else if (atarih > ttarih || (itarih.Year != 0001 && itarih < atarih))
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Girdiğiniz tarihler hatalı...')</script>");
            }
            else
            {
                film.adet += (short)(tx.adet - Convert.ToInt16(txt_adet.Text));
                tx.alinanTarih = DateTime.Parse(txt_atarih.Text);
                tx.ucret = film.fiyat * Convert.ToInt16(txt_adet.Text);
                tx.iadeTarih = DateTime.Parse(txt_itarih.Text);
                tx.teslimTarih = DateTime.Parse(txt_ttarih.Text);               
                tx.adet = Convert.ToInt16(txt_adet.Text);                
                _dc.SubmitChanges();
                if (itarih.Year == 0001)
                    txt_itarih.Text = "";
                Response.Write("<script LANGUAGE='JavaScript' >alert('Bilgiler Güncellendi...')</script>");

                filmGetir();
            }         
        }

        protected void filmGetir()
        {
            var tx = _dc.tx_filmKiras.FirstOrDefault(t => t.id == _k_id);
            var yazK = _dc.dt_kullanicis.FirstOrDefault(y => y.id == tx.kullanici_id);
            var yazF = _dc.dt_films.FirstOrDefault(y => y.id == tx.film_id);
            DateTime ttarih = DateTime.Parse(tx.teslimTarih.ToString());
            lbl_ad.Text = yazK.ad;
            lbl_soyad.Text = yazK.soyad;
            lbl_eposta.Text = yazK.eposta;
            lbl_filmad.Text = yazF.ad;
            txt_adet.Text = Convert.ToString(tx.adet);
            txt_atarih.Text = Convert.ToString(tx.alinanTarih.ToString("dd.MM.yyyy"));
            txt_fiyat.Text = Convert.ToString(tx.ucret);
            if (tx.iadeTarih.Year == 0001)
                txt_itarih.Text = "";
            else
                txt_itarih.Text = Convert.ToString(tx.iadeTarih.ToString("dd.MM.yyyy"));
            txt_ttarih.Text = Convert.ToString(ttarih.ToString("dd.MM.yyyy"));
            //yazF.adet += tx.adet;
            //_dc.SubmitChanges();
        }
    }
}