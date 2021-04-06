using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite
{
    public partial class muzik : System.Web.UI.Page
    {
        veriDataContext _dc = new veriDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {   

        }

        protected void btn_mzkekle_Click(object sender, EventArgs e)
        {
            Response.Redirect("muzikEkle.aspx");
        }

        protected void btn_mzksil_Click(object sender, EventArgs e)
        {           
            var ts = _dc.tx_satis.FirstOrDefault(s => s.muzik_id.Equals(Session["muzik_id"]));
            int index = muzikler.SelectedIndex;
            if (index == -1)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden Film Seçiniz...')</script>");
            }        
            else if (ts != null)
                Response.Write("<script LANGUAGE='JavaScript' >alert('Bu ürünü silemezsiniz.Satılmış veya kiralanmış...')</script>");
            else
            {
                var sil = _dc.dt_muziks.First(q => q.id == Convert.ToInt32(Session["muzik_id"]));
                _dc.dt_muziks.DeleteOnSubmit(sil);
                _dc.SubmitChanges();
                Response.Write("<script LANGUAGE='JavaScript' >alert('Müzik Silindi.')</script>");
                muzikler.DataBind();
            }
        }

        protected void btn_mzkguncelle_Click(object sender, EventArgs e)
        {
            int index = muzikler.SelectedIndex;
            if (index == -1)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden müzik Seçiniz...')</script>");
            }
            else
                Response.Redirect("muzikGuncelle.aspx");
        }

        protected void muzikler_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = muzikler.SelectedIndex;
            Session["muzik_id"] = muzikler.DataKeys[index].Values[0];
        }
    }
}