using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite
{
    public partial class uyePaneller : System.Web.UI.MasterPage
    {
        public int _uye_id { get { return Session["ct_kullanici"] == null ? 0 : int.Parse(Session["ct_kullanici"].ToString()); } }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (_uye_id == 0)
                Response.Redirect("../KullaniciGiris.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("../KullaniciGiris.aspx");
        }
    }
}