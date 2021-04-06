using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite.admin
{
    public partial class sAlanlar : System.Web.UI.Page
    {
        veriDataContext _dc = new veriDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void veriListe_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel1.Visible = veriListe.SelectedValue == "1";
            Panel2.Visible = veriListe.SelectedValue == "2";
            Panel3.Visible = veriListe.SelectedValue == "3";
        }

        protected void btn_fguncelle_Click(object sender, EventArgs e)
        {
            if (Session["satilanF_id"] == null)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden film seçiniz!!!')</script>");
                return;
            }
            Response.Redirect("satisFilmGuncelle.aspx");
        }

        protected void btn_mguncelle_Click(object sender, EventArgs e)
        {
            if (Session["satilanM_id"] == null)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden müzik seçiniz!!!')</script>");
                return;
            }
            Response.Redirect("satisMuzikGuncelle.aspx");
        }

        protected void btn_fsil_Click(object sender, EventArgs e)
        {
            if (Session["satilanF_id"] == null)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden film seçiniz!!!')</script>");
                return;
            }
            var tx = _dc.tx_satis.FirstOrDefault(t => t.id.Equals(Session["satilanF_id"]));
            _dc.tx_satis.DeleteOnSubmit(tx);
            _dc.SubmitChanges();
            filmler.DataBind();
        }

        protected void btn_oguncelle_Click(object sender, EventArgs e)
        {
            if (Session["satilanO_id"] == null)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden oyun seçiniz!!!')</script>");
                return;
            }
            Response.Redirect("satisOyunGuncelle.aspx");
        }

        protected void filmler_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = filmler.SelectedIndex;
            Session["satilanF_id"] = filmler.DataKeys[index].Values[2];
        }

        protected void muzikler_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = muzikler.SelectedIndex;
            Session["satilanM_id"] = muzikler.DataKeys[index].Values[2];
        }

        protected void oyunlar_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = oyunlar.SelectedIndex;
            Session["satilanO_id"] = oyunlar.DataKeys[index].Values[2];
        }

        protected void btn_msil_Click(object sender, EventArgs e)
        {
            if (Session["satilanM_id"] == null)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden müzik seçiniz!!!')</script>");
                return;
            }
            var tx = _dc.tx_satis.FirstOrDefault(t => t.id.Equals(Session["satilanM_id"]));
            _dc.tx_satis.DeleteOnSubmit(tx);
            _dc.SubmitChanges();
            muzikler.DataBind();
        }

        protected void btn_osil_Click(object sender, EventArgs e)
        {
            if (Session["satilanO_id"] == null)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden oyun seçiniz!!!')</script>");
                return;
            }
            var tx = _dc.tx_satis.FirstOrDefault(t => t.id.Equals(Session["satilanO_id"]));
            _dc.tx_satis.DeleteOnSubmit(tx);
            _dc.SubmitChanges();
            oyunlar.DataBind();
        }
    }
}