using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite
{
    public partial class muzikGuncelle : System.Web.UI.Page
    {
        public int _muzik_id { get { return Session["muzik_id"] == null ? 0 : int.Parse(Session["muzik_id"].ToString()); } }
        veriDataContext _dc = new veriDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (_muzik_id == 0)
            {
                Response.Redirect("muzik.aspx");
                return;
            } 

            if (IsPostBack)
                return;

            var guncel = _dc.dt_muziks.FirstOrDefault(g => g.id == _muzik_id);

            if (guncel != null)
            {
                txt_adi.Text = guncel.ad;
                txt_sanatci.Text = guncel.sanatci;
                txt_albumAdi.Text = guncel.album;
                txt_sure.Text = Convert.ToString(guncel.sure);
                txt_yapimyili.Text = Convert.ToString(guncel.yapimYil);
                txt_barkod.Text = guncel.barkod;
                txt_adet.Text = Convert.ToString(guncel.adet);
                txt_fiyat.Text = Convert.ToString(guncel.fiyat);
                turListe.SelectedValue = guncel.muzikTur_id.ToString();
            }
        }

        protected void btn_dbekle_Click(object sender, EventArgs e)
        {
            try
            {
                var guncel = _dc.dt_muziks.FirstOrDefault(g => g.id == _muzik_id);
                guncel.ad = txt_adi.Text;
                guncel.sanatci = txt_sanatci.Text;
                guncel.album = txt_albumAdi.Text;
                guncel.sure = TimeSpan.Parse(txt_sure.Text);
                guncel.yapimYil = Convert.ToInt16(txt_yapimyili.Text);
                guncel.barkod = txt_barkod.Text;
                guncel.adet = Convert.ToInt16(txt_adet.Text);
                guncel.fiyat = Convert.ToInt32(txt_fiyat.Text);
                _dc.SubmitChanges();
                Response.Write("<script LANGUAGE='JavaScript' >alert('Müzik Güncellendi.')</script>");
            }
            catch (Exception _ex)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('" + _ex.Message + "')</script>");
            }
        }
    }
}