using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite.admin
{
    public partial class satis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void veriListe_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel1.Visible = veriListe.SelectedValue == "1";
            Panel2.Visible = veriListe.SelectedValue == "2";
            Panel3.Visible = veriListe.SelectedValue == "3";          
        }

        protected void filmler_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = filmler.SelectedIndex;
            Session["satF_id"] = filmler.DataKeys[index].Value;
        }

        protected void muzikler_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = muzikler.SelectedIndex;
            Session["satM_id"] = muzikler.DataKeys[index].Value;
        }

        protected void oyunlar_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = oyunlar.SelectedIndex;
            Session["satO_id"] = oyunlar.DataKeys[index].Value;
        }

        protected void btn_osat_Click(object sender, EventArgs e)
        {
            if (Session["satO_id"] == null)
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden oyun seçiniz!!!')</script>");
            else
                Response.Redirect("satOyun.aspx");
        }

        protected void btn_msat_Click(object sender, EventArgs e)
        {
            if (Session["satM_id"] == null)
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden müzik seçiniz!!!')</script>");
            else
                Response.Redirect("satMuzik.aspx");
        }

        protected void btn_fsat_Click(object sender, EventArgs e)
        {
            if (Session["satF_id"] == null)
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden film seçiniz!!!')</script>");
            else
                Response.Redirect("satFilm.aspx");
        }
    }
}