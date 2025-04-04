﻿using MySql.Data.MySqlClient;
using QLBVBM.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBVBM.DAL
{
    public class DAL_ChuyenBay
    {
        private DataHelper dataHelper = new DataHelper();

        public bool ThemChuyenBay(DTO_ChuyenBay chuyenBay)
        {
            string query = "INSERT INTO CHUYENBAY (MaChuyenBay, MaSanBayDi, MaSanBayDen, NgayGioBay, ThoiGianBay) " +
               "VALUES (@MaChuyenBay, @MaSanBayDi, @MaSanBayDen, @NgayGioBay, @ThoiGianBay)";

            List<MySqlParameter> parameters = new List<MySqlParameter>
                    {
                        new MySqlParameter("@MaChuyenBay", chuyenBay.MaChuyenBay),
                        new MySqlParameter("@MaSanBayDi", chuyenBay.MaSanBayDi),
                        new MySqlParameter("@MaSanBayDen", chuyenBay.MaSanBayDen),
                        new MySqlParameter("@NgayGioBay", chuyenBay.NgayGioBay),
                        new MySqlParameter("@ThoiGianBay", chuyenBay.ThoiGianBay),
                    };

            int result = dataHelper.ExecuteNonQuery(query, parameters);
            return result > 0;
        }

        public DTO_ChuyenBay? LayChuyenBayCuoi()
        {
            string query = "SELECT * FROM CHUYENBAY ORDER BY MaChuyenBay DESC LIMIT 1";
            DataTable dt = dataHelper.ExecuteQuery(query);

            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                return new DTO_ChuyenBay
                {
                    MaChuyenBay = dr["MaChuyenBay"].ToString(),
                };
            }

            return null;
        }
    }
}
