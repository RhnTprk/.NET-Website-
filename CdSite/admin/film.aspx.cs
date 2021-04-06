using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite
{
    public partial class film : System.Web.UI.Page
    {
        veriDataContext _dc = new veriDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_flmguncelle_Click(object sender, EventArgs e)
        {
            int index = filmler.SelectedIndex;
            if (index == -1)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden Film Seçiniz...')</script>");
            }
            else
                Response.Redirect("filmGuncelle.aspx");

        }

        protected void btn_flmekle_Click(object sender, EventArgs e)
        {
            Response.Redirect("filmEkle.aspx");
        }

        protected void btn_flmsil_Click(object sender, EventArgs e)
        {
            var tk = _dc.tx_filmKiras.FirstOrDefault(k => k.film_id.Equals(Session["film_id"]));
            var ts = _dc.tx_satis.FirstOrDefault(s => s.film_id.Equals(Session["film_id"]));
            int index = filmler.SelectedIndex;
            if (index == -1)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden Film Seçiniz...')</script>");
            }          
            else if(tk != null || ts != null)
                Response.Write("<script LANGUAGE='JavaScript' >alert('Bu ürünü silemezsiniz.Satılmış veya kiralanmış...')</script>");
            else
            {               
                var sil = _dc.dt_films.First(q => q.id == Convert.ToInt32(Session["film_id"]));
                _dc.dt_films.DeleteOnSubmit(sil);
                _dc.SubmitChanges();
                Response.Write("<script LANGUAGE='JavaScript' >alert('Film Silindi.')</script>");
                filmler.DataBind();
            }
        }

        protected void filmler_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int index = filmler.SelectedIndex;
            Session["film_id"] = filmler.DataKeys[index].Values[0];
        }

        protected void btn_kirala_Click(object sender, EventArgs e)
        {
            Response.Redirect("filmKiralama.aspx");
        }

        protected void btn_sat_Click(object sender, EventArgs e)
        {
            Response.Redirect("filmSat.aspx");
        }
    }
}