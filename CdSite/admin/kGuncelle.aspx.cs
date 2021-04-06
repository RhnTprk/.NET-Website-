using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite.admin
{
    public partial class kGuncelle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_kGuncelle_Click(object sender, EventArgs e)
        {
            int index = kullanicilarListe.SelectedIndex;
            if (index == -1)
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden kullanıcı seçiniz...')</script>");
            else
                Response.Redirect("btnKguncelle.aspx");
        }

        protected void kullanicilarListe_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = kullanicilarListe.SelectedIndex;
            Session["k_id"] = kullanicilarListe.DataKeys[index].Value;
        }
    }
}