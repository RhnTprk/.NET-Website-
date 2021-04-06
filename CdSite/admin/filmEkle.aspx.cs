using Habanero.Faces.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace CdSite
{
    public partial class WebForm1 : System.Web.UI.Page
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



            var kontrol = _dc.dt_films.FirstOrDefault(k => k.barkod == txt_barkod.Text.Trim());
            if (kontrol == null)
            {
                try
                {
                    dt_film ekle = new dt_film();
                    ekle.ad = txt_adi.Text;
                    ekle.yapimYil = Convert.ToInt16(txt_yapimyili.Text);
                    ekle.yapimci = txt_yapimci.Text;
                    ekle.sure = TimeSpan.Parse(txt_sure.Text);
                    ekle.barkod = txt_barkod.Text;
                    ekle.fiyat = Double.Parse(txt_fiyat.Text);
                    ekle.filmTur_id = Convert.ToInt16(turListe.SelectedValue);
                    ekle.adet = Convert.ToInt16(txt_adet.Text);
                    _dc.dt_films.InsertOnSubmit(ekle);
                    _dc.SubmitChanges();
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Film Eklendi.')</script>");
                }
                catch
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Lütfen bilgileri kontrol edip tekrar deneyiniz...')</script>");
                }
            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Girilen film zaten var. Lütfen filmi güncelleyiniz...')</script>");
            }
        }
    }
}