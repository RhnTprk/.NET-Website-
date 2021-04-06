using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdSite
{
    public partial class Paneller : System.Web.UI.MasterPage
    {
        public int _admin_id { get { return Session["ct_yonetici"] == null ? 0 : int.Parse(Session["ct_yonetici"].ToString()); } }
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (_admin_id == 0)
            //    Response.Redirect("../KullaniciGiris.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("../KullaniciGiris.aspx");
        }
    }
}