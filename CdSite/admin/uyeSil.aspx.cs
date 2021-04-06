using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite
{
    public partial class uyeSil : System.Web.UI.Page
    {
        veriDataContext _dc = new veriDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = kullanicilar.SelectedIndex;
            Session["kullanici_id"] = kullanicilar.DataKeys[index].Value;
        }

        protected void btn_sil_Click(object sender, EventArgs e)
        {
            var tk = _dc.tx_filmKiras.FirstOrDefault(k => k.kullanici_id.Equals(Session["kullanici_id"]));
            var ts = _dc.tx_satis.FirstOrDefault(s => s.kullanici_id.Equals(Session["kullanici_id"]));
            var sil = _dc.dt_kullanicis.First(q => q.id == Convert.ToInt32(Session["kullanici_id"]));
            int index = kullanicilar.SelectedIndex;
            if (index == -1)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Listeden kullanıcı seçiniz...')</script>");
            }
            else if(sil.yetki == true)
                Response.Write("<script LANGUAGE='JavaScript' >alert('Admini silemezsiniz...')</script>");
            else if (tk != null || ts != null)
                Response.Write("<script LANGUAGE='JavaScript' >alert('Bu kullanıcı kiralama veya satış listesinde. Silinemez...')</script>");
            else
            {
                _dc.dt_kullanicis.DeleteOnSubmit(sil);
                _dc.SubmitChanges();
                Response.Write("<script LANGUAGE='JavaScript' >alert('Üye Silindi.')</script>");
                kullanicilar.DataBind();
            }
        }
    }
}