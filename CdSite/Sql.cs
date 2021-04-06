using System;
using System.Collections.Generic;
using System.Web;
using System.Data.SqlClient;
using System.Windows;

namespace CdSite
{
    public class Sql
    {
        public SqlConnection baglanti()
        {
            SqlConnection baglan = new SqlConnection(@"Data Source=DESKTOP-9J26705;Initial Catalog=CdSite;Integrated Security=True");
            baglan.Open();
            return baglan;
        }

        public int sorgulama(string posta, string sifre, string sorgu)
        {
            SqlConnection baglan = this.baglanti();
            SqlCommand komut = new SqlCommand(sorgu, baglan);
            SqlDataReader oku = komut.ExecuteReader();
            int yetki;
            while(oku.Read())
            {
                yetki = Convert.ToInt32(oku["yetki"]);
                if ((posta.Equals(oku["eposta"])) && sifre.Equals(oku["sifre"]))
                {
                    oku.Close();
                    baglan.Close();
                    return yetki;
                }
            }
            return -1;

        }
        public void eklesil(string sorgu)
        {

        }

        public String isim(string sorgu)
        {
            SqlConnection baglan = this.baglanti();
            SqlCommand komut = new SqlCommand(sorgu, baglan);
            SqlDataReader oku = komut.ExecuteReader();
            oku.Read();
            String isim = Convert.ToString(oku["ad"]);
            return isim;
        }
    }
}