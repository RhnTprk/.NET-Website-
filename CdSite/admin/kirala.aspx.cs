using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite
{
    public partial class kirala : System.Web.UI.Page
    {
        veriDataContext _dc = new veriDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;          
            int ceza;
            var tx = _dc.tx_filmKiras.Where(t => t.iadeTarih.Year == 0001).ToList();
            foreach (var item in tx)
            {
                TimeSpan sonuc;
                DateTime tarih = DateTime.Parse(Convert.ToString(item.teslimTarih));
                if (DateTime.Now > tarih)
                {
                    sonuc = DateTime.Now - tarih;
                    ceza = Convert.ToInt32(sonuc.TotalDays) * 3;
                    item.ucret += ceza;
                    _dc.SubmitChanges();
                }
            }
        }
        protected void btn_kirala_Click(object sender, EventArgs e)
        {
            int index = liste.SelectedIndex;
            if (index == -1)
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden Film Seçiniz...')</script>");
            else
            {
                Session["kiralanacak_id"] = liste.DataKeys[index].Value;
                Response.Redirect("kiralaButon.aspx");
            }
        }

        protected void veriListe_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel1.Visible = veriListe.SelectedValue == "1";
            Panel2.Visible = veriListe.SelectedValue == "2";
        }

        protected void kListe_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = kListe.SelectedIndex;
            Session["kiralayan_id"] = kListe.DataKeys[index].Values[2];
            var _d = Session["kiralayan_id"].ToString();
        }

        protected void btn_sil_Click(object sender, EventArgs e)
        {
            int index = kListe.SelectedIndex;
            if (index == -1)
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden Film Seçiniz...')</script>");
            else
            {
                var sil = _dc.tx_filmKiras.FirstOrDefault(s => s.id.Equals(Session["kiralayan_id"]));
                var film = _dc.dt_films.FirstOrDefault(f => f.id == sil.film_id);
                film.adet += sil.adet;
                _dc.tx_filmKiras.DeleteOnSubmit(sil);
                _dc.SubmitChanges();
                kListe.DataBind();
                liste.DataBind();
            }
        }

        protected void btn_guncelle_Click(object sender, EventArgs e)
        {
            int index = kListe.SelectedIndex;
            if (index == -1)
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden Film Seçiniz...')</script>");
            else
            {
                Response.Redirect("kiralayanGuncelle.aspx");
            }
        }

        protected void liste_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = liste.SelectedIndex;
            Session["kiralanacak_id"] = liste.DataKeys[index].Value;
        }
    }
}