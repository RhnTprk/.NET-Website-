using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite
{
    public partial class oyunEkle : System.Web.UI.Page
    {
        veriDataContext _dc = new veriDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_dbekle_Click(object sender, EventArgs e)
        {
            var kontrol = _dc.dt_oyuns.FirstOrDefault(k => k.barkod == txt_barkod.Text.Trim());
            if (kontrol == null)
            {
                try
                {
                    dt_oyun ekle = new dt_oyun();
                    ekle.ad = txt_adi.Text;
                    ekle.yapimYil = Convert.ToInt16(txt_yapimyili.Text);
                    ekle.yapimci = txt_yapimci.Text;
                    ekle.platform = txt_platform.Text;
                    ekle.fiyat = Convert.ToInt32(txt_fiyat.Text);
                    ekle.adet = Convert.ToInt16(txt_adet.Text);
                    ekle.barkod = txt_barkod.Text;
                    ekle.oyunTur_id = Convert.ToInt16(turListe.SelectedValue);
                    _dc.dt_oyuns.InsertOnSubmit(ekle);
                    _dc.SubmitChanges();
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Oyun Eklendi.')</script>");
                }
                catch
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Lütfen bilgileri kontrol edip tekrar deneyiniz...')</script>");
                }
            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Girilen Oyun zaten var. Lütfen oyunu güncelleyiniz...')</script>");
            }
        }
    }
}