using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite
{
    public partial class oyunGuncelle : System.Web.UI.Page
    {
        public int _oyun_id { get { return Session["oyun_id"] == null ? 0 : int.Parse(Session["oyun_id"].ToString()); } }
        veriDataContext _dc = new veriDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (_oyun_id == 0)
            {
                Response.Redirect("muzik.aspx");
                return;
            }

            if (IsPostBack)
                return;

            var guncel = _dc.dt_oyuns.FirstOrDefault(g => g.id == _oyun_id);
            txt_adi.Text = guncel.ad;
            txt_yapimyili.Text = Convert.ToString(guncel.yapimYil);
            txt_yapimci.Text = guncel.yapimci;
            txt_platform.Text = guncel.platform;
            txt_barkod.Text = guncel.barkod;
            txt_fiyat.Text = Convert.ToString(guncel.fiyat);
            txt_adet.Text = Convert.ToString(guncel.adet);
            turListe.SelectedValue = guncel.oyunTur_id.ToString();
        }

        protected void btn_dbekle_Click(object sender, EventArgs e)
        {
            try
            {
                var ekle = _dc.dt_oyuns.FirstOrDefault(g => g.id == _oyun_id);
                ekle.ad = txt_adi.Text;
                ekle.yapimYil = Convert.ToInt16(txt_yapimyili.Text);
                ekle.yapimci = txt_yapimci.Text;
                ekle.platform = txt_platform.Text;
                ekle.fiyat = Convert.ToInt32(txt_fiyat.Text);
                ekle.adet = Convert.ToInt16(txt_adet.Text);
                ekle.barkod = txt_barkod.Text;
                ekle.oyunTur_id = Convert.ToInt16(turListe.SelectedValue);
                _dc.SubmitChanges();
                Response.Write("<script LANGUAGE='JavaScript' >alert('Oyun Güncellendi.')</script>");
            }
            catch
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Lütfen bilgileri kontrol edip tekrar deneyiniz...')</script>");
            }
        }
    }
}