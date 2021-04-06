using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite
{
    public partial class kiralayan : System.Web.UI.Page
    {
        veriDataContext _dc = new veriDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            veriListe.SelectedValue = Convert.ToString(2);
        }

        protected void btn_listele_Click(object sender, EventArgs e)
        {
            int value = Convert.ToInt32(veriListe.SelectedValue);
            if (value == 1)
                Response.Redirect("kirala.aspx");
        }

        protected void btn_guncelle_Click(object sender, EventArgs e)
        {
            int index = liste.SelectedIndex;
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
            Session["kiralayan_id"] = liste.DataKeys[index].Values[2];
        }

        protected void btn_sil_Click(object sender, EventArgs e)
        {
            int index = liste.SelectedIndex;
            if (index == -1)
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden Film Seçiniz...')</script>");
            else
            {
                var sil = _dc.tx_filmKiras.FirstOrDefault(s => s.id.Equals(Session["kiralayan_id"]));
                _dc.tx_filmKiras.DeleteOnSubmit(sil);
                _dc.SubmitChanges();
                liste.DataBind();
            }
        }
    }
}