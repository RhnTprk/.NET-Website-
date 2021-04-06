using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Xceed.Wpf.Toolkit;
using System.Configuration;
using System.Linq;

namespace CdSite
{
    public partial class KullaniciGiris : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (IsPostBack)
            //    return;
        }
        veriDataContext _dc = new veriDataContext();
        protected void btn_giris_Click(object sender, EventArgs e)
        {

            /*Sql sorgula = new Sql();
            string sorgu = "select eposta,sifre,yetki from dt_kullanici";
            yetki = sorgula.sorgulama(txt_posta.Text, txt_sifre.Text, sorgu);
            if (yetki == 1)
            {
                
            else if(yetki == 0)
            {
                Response.Redirect("UyePanel.aspx");
            }
            else
                lbl_mesaj.Text = "E-Posta veya şifre yanlış !!!";*/
            
            var _s = _dc.dt_kullanicis.Where(q => q.eposta == txt_posta.Text && q.sifre == txt_sifre.Text).ToList();



            if (!_s.Any())
            {
                lbl_mesaj.Text = "E-POSTA VEYA ŞİFRE YANLIŞ !!!";
            }
            else
            {
                if (_s.First().yetki == true)
                {
                    Session["ct_yonetici"] = _s.First().id;
                    Response.Redirect("admin/YoneticiPaneli.aspx");
                }
                else
                {
                    Session["ct_kullanici"] = _s.First().id;
                    Response.Redirect("uye/UyePaneli.aspx");
                }
            }
        }
    }
}


