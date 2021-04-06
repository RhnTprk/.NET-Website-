using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite
{
    public partial class muzikEkle : System.Web.UI.Page
    {
        veriDataContext _dc = new veriDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_dbekle_Click(object sender, EventArgs e)
        {
            TimeSpan _ts;
            if (!TimeSpan.TryParse(("00:" + txt_sure.Text), out _ts))
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Süre hatalı!')</script>");
                return;
            }

            var kontrol = _dc.dt_muziks.FirstOrDefault(k => k.barkod == txt_barkod.Text.Trim());
            if (kontrol == null)
            {
                try
                {
                    dt_muzik ekle = new dt_muzik();
                    ekle.ad = txt_adi.Text;
                    ekle.sanatci = txt_sanatci.Text;
                    ekle.sure = TimeSpan.Parse(txt_sure.Text);
                    ekle.yapimYil = Convert.ToInt16(txt_yapimyili.Text);
                    ekle.album = txt_albumAdi.Text;
                    ekle.adet = Convert.ToInt16(txt_adet.Text);
                    ekle.barkod = txt_barkod.Text;
                    ekle.fiyat = Convert.ToInt32(txt_fiyat.Text);
                    ekle.muzikTur_id = Convert.ToInt16(turListe.SelectedValue);
                    _dc.dt_muziks.InsertOnSubmit(ekle);
                    _dc.SubmitChanges();
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Müzik Eklendi.')</script>");
                }
                catch
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Lütfen bilgileri kontrol edip tekrar deneyiniz...')</script>");
                }
            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Girilen müzik zaten var. Lütfen müziği güncelleyiniz...')</script>");
            }
        }
    }
}