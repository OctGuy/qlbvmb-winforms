﻿using QLBVBM.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBVBM.BUS
{
    public class BUS_HangVeTuyenBay
    {
        public DAL_HangVeTuyenBay DAL_HangVeTuyenBay = new DAL_HangVeTuyenBay();

        public int LayDonGiaQuyDinh(string maSanBayDi, string maSanBayDen, string maHangGhe)
        {
            return DAL_HangVeTuyenBay.LayDonGiaQuyDinh(maSanBayDi, maSanBayDen, maHangGhe);
        }
    }
}
