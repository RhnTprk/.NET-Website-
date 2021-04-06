using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite
{
    public partial class oyun : System.Web.UI.Page
    {
        veriDataContext _dc = new veriDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_oyunekle_Click(object sender, EventArgs e)
        {
            Response.Redirect("oyunEkle.aspx");
        }

        protected void btn_oyunsil_Click(object sender, EventArgs e)
        {         
            var ts = _dc.tx_satis.FirstOrDefault(s => s.oyun_id.Equals(Session["oyun_id"]));
            int index = oyunlar.SelectedIndex;
            if (index == -1)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden oyun Seçiniz...')</script>");
            }
            else if (ts != null)
                Response.Write("<script LANGUAGE='JavaScript' >alert('Bu ürünü silemezsiniz.Satılmış veya kiralanmış...')</script>");
            else
            {
                var sil = _dc.dt_oyuns.First(q => q.id == Convert.ToInt32(Session["oyun_id"]));
                _dc.dt_oyuns.DeleteOnSubmit(sil);
                _dc.SubmitChanges();
                Response.Write("<script LANGUAGE='JavaScript' >alert('Oyun Silindi.')</script>");
                oyunlar.DataBind();
            }
        }

        protected void btn_oyunguncelle_Click(object sender, EventArgs e)
        {
            int index = oyunlar.SelectedIndex;
            if (index == -1)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden oyun Seçiniz...')</script>");
            }
            else
                Response.Redirect("oyunGuncelle.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = oyunlar.SelectedIndex;
            Session["oyun_id"] = oyunlar.DataKeys[index].Values[0];
        }
    }
}