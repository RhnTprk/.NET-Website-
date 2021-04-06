using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite
{
    public partial class filmGuncelle : System.Web.UI.Page
    {
        public int _film_id { get { return Session["film_id"] == null ? 0 : int.Parse(Session["film_id"].ToString()); } }

        veriDataContext _dc = new veriDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (_film_id == 0)
            {
                Response.Redirect("film.aspx");
                return;
            }

            if (IsPostBack)
                return;

            var guncel = _dc.dt_films.FirstOrDefault(g => g.id == _film_id);

            if (guncel != null)
            {
                txt_adi.Text = guncel.ad;
                txt_yapimyili.Text = Convert.ToString(guncel.yapimYil);
                txt_yapimci.Text = guncel.yapimci;
                txt_sure.Text = Convert.ToString(guncel.sure);
                txt_barkod.Text = guncel.barkod;
                txt_fiyat.Text = Convert.ToString(guncel.fiyat);
                txt_adet.Text = Convert.ToString(guncel.adet);
                turListe.SelectedValue = guncel.filmTur_id.ToString();
            }
        }

        protected void btn_guncelle_Click(object sender, EventArgs e)
        {
            TimeSpan _ts;
            if (!TimeSpan.TryParse(("00:" + txt_sure.Text), out _ts))
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Süre hatalı!')</script>");
                return;
            }

            try
            {
                var kontrol = _dc.tx_filmKiras.FirstOrDefault(k => k.film_id == _film_id);
                var guncelle = _dc.dt_films.FirstOrDefault(g => g.id == _film_id);
                guncelle.ad = txt_adi.Text;
                guncelle.yapimYil = Convert.ToInt16(txt_yapimyili.Text);
                guncelle.yapimci = txt_yapimci.Text;
                guncelle.sure = TimeSpan.Parse(txt_sure.Text);
                guncelle.barkod = txt_barkod.Text;
                guncelle.fiyat = Double.Parse(txt_fiyat.Text);
                if(kontrol != null && kontrol.adet > Convert.ToInt16(txt_adet.Text))
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Girilen adet sayısı hatalıdır...')</script>");
                else
                {
                    guncelle.adet = Convert.ToInt16(txt_adet.Text);
                    guncelle.filmTur_id = Convert.ToInt16(turListe.SelectedValue);
                    _dc.SubmitChanges();
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Film Güncellendi.')</script>");
                }
            }
            catch (Exception _ex)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('" + _ex.Message + "')</script>");
            }

        }
    }
}