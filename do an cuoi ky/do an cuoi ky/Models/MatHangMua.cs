using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace do_an_cuoi_ky.Models
{
    public class MatHangMua
    {
        QLBANMOHINHEntities db = new QLBANMOHINHEntities();
        public int MaMH { get; set; }
        public string TenMH { get; set; }
        public string AnhMinhHoa { get; set; }
        public double DonGia { get; set; }
        public int SoLuong { get; set; }
        public int MaKH { get; set; }
        public string HoTenKH { get; set; }
        public string DiaChiKH { get; set; }
        public string DienThoaiKH { get; set; }
        //Tính thành tiền = DongGia * SoLuong
        public double ThanhTien()
        {
            return SoLuong * DonGia;
        }
        public MatHangMua(int MaMH)
        {
            this.MaMH = MaMH;

            //Tìm sách trong CSDL có mã id cần và gán cho mặt hàng được mua
            var mohinh = db.MOHINHs.Single(s => s.MaMH == this.MaMH);

            this.TenMH = mohinh.TenMH;
            this.AnhMinhHoa = mohinh.HinhMinhHoa;
            this.DonGia = double.Parse(mohinh.DonGia.ToString());
            this.SoLuong = 1; //Số lượng mua ban đầu của một mặt hàng là 1 (cho lần click đầu)
            //this.HoTenKH = customer.HoTenKH;
            //this.DiaChiKH = customer.DiaChiKH;
            //this.DienThoaiKH = customer.DienThoaiKH;
        }
    }
}