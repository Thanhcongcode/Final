using do_an_cuoi_ky.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace do_an_cuoi_ky.Controllers
{
    public class GioHangController : Controller
    {
        // GET: GioHang
        public ActionResult Index()
        {
            return View();
        }
        public List<MatHangMua> LayGioHang()
        {
            List<MatHangMua> gioHang = Session["GioHang"] as List<MatHangMua>;
            //Nếu giỏ hàng chưa tồn tại thì tạo mới và đưa vào Session
            if (gioHang == null)
            {
                gioHang = new List<MatHangMua>();
                Session["GioHang"] = gioHang;
            }
            return gioHang;
        }
        public void ThemSanPhamVaoGio(int MaSP)
        {
            //Lấy giỏ hàng hiện tại
            List<MatHangMua> gioHang = LayGioHang();
            //Kiểm tra xem có tồn tại mặt hàng trong giỏ hay chưa
            //Nếu có thì tăng số lượng lên 1, ngược lại thêm vào giỏ
            MatHangMua sanPham = gioHang.FirstOrDefault(s => s.MaMH == MaSP);
            if (sanPham == null) //Sản phẩm chưa có trong giỏ
            {
                sanPham = new MatHangMua(MaSP);
                gioHang.Add(sanPham);
            }
            else
            {
                sanPham.SoLuong++; //Sản phẩm đã có trong giỏ thì tăng số lượng lên 1
               
            }
            RedirectToAction("Details", "Shop", new { id = MaSP });
        }
        private int TinhTongSL()
        {
            int tongSL = 0;
            List<MatHangMua> gioHang = LayGioHang();
            if (gioHang != null)
                tongSL = gioHang.Sum(sp => sp.SoLuong);
            return tongSL;
        }
        private double TinhTongTien()
        {
            double TongTien = 0;
            List<MatHangMua> gioHang = LayGioHang();
            if (gioHang != null)
                TongTien = gioHang.Sum(sp => sp.ThanhTien());
            return TongTien;
        }
        public ActionResult HienThiGioHang()
        {
            List<MatHangMua> gioHang = LayGioHang();
            //Nếu giỏ hàng trống thì trả về trang ban đầu
            if (gioHang == null || gioHang.Count == 0)
            {
                return RedirectToAction("Index", "Shop");
            }
            ViewBag.TongSL = TinhTongSL();
            ViewBag.TongTien = TinhTongTien();
            return View(gioHang); //Trả về View hiển thị thông tin giỏ hàng
        }
        public ActionResult GioHangPartial()
        {
            ViewBag.TongSL = TinhTongSL();
            ViewBag.TongTien = TinhTongTien();
            return PartialView();
        }
        public ActionResult XoaMatHang(int MaSP)
        {
            List<MatHangMua> gioHang = LayGioHang();
            //Lấy sản phẩm trong giỏ hàng
            var sanpham = gioHang.FirstOrDefault(s => s.MaMH == MaSP);
            if (sanpham != null)
            {
                gioHang.RemoveAll(s => s.MaMH == MaSP);
                return RedirectToAction("HienThiGioHang"); //Quay về trang giỏ hàng
            }
            if (gioHang.Count == 0) //Quay về trang chủ nếu giỏ hàng không có gì
                return RedirectToAction("Index", "Shop");
            return RedirectToAction("HienThiGioHang");
        }
        public ActionResult CapNhatMatHang(int MaSP, int SoLuong)
        {
            List<MatHangMua> gioHang = LayGioHang();
            //Lấy sản phẩm trong giỏ hàng
            var sanpham = gioHang.FirstOrDefault(s => s.MaMH == MaSP);
            if (sanpham != null)
            {
                //Cập nhật lại số lượng tương ứng
                //Lưu ý số lượng phải lớn hơn hoặc bằng 1
                sanpham.SoLuong = SoLuong;
            }
            return RedirectToAction("HienThiGioHang"); //Quay về trang giỏ hàng
        }
        public ActionResult DatHang()
        {

            if (Session["Taikhoan"] == null) //Chưa đăng nhập
                return RedirectToAction("Login", "Users");
            List<MatHangMua> gioHang = LayGioHang();
            if (gioHang == null || gioHang.Count == 0) //Chưa có giỏ hàng hoặc chưa có sp
                return RedirectToAction("Index", "Shop");
            ViewBag.TongSL = TinhTongSL();
            ViewBag.TongTien = TinhTongTien();
            return View(gioHang); //Trả về View hiển thị thông tin giỏ hàng
        }
        QLBANMOHINHEntities database = new QLBANMOHINHEntities();
        public ActionResult DongYDatHang()
        {
            KHACHHANG khach = Session["Taikhoan"] as KHACHHANG; //Khách
            List<MatHangMua> gioHang = LayGioHang(); //Giỏ hàng
            DONDATHANG DonHang = new DONDATHANG(); //Tạo mới đơn đặt hàng
            DonHang.MaKH = khach.MaKH;
            DonHang.NgayDatHang = DateTime.Now;
            DonHang.TriGia = (decimal)TinhTongTien();
            DonHang.DaGiao = false;
            DonHang.TenNguoiNhan = khach.HoTenKH;
            DonHang.DiaChiNhan = khach.DiaChiKH;
            DonHang.SDTNhan = khach.DienThoaiKH;
            DonHang.HTThanhToan = false;
            DonHang.HTGiaoHang = false;

            database.DONDATHANGs.Add(DonHang);
            database.SaveChanges();
            //Lần lượt thêm từng chi tiết cho đơn hàng trên
            foreach (var sanpham in gioHang)
            {
                CTDATHANG chitiet = new CTDATHANG();
                chitiet.MaDH = DonHang.MaDH;
                chitiet.MaMH = sanpham.MaMH;
                chitiet.SoLuong = sanpham.SoLuong;
                chitiet.DonGia = (decimal)sanpham.DonGia;
                database.CTDATHANGs.Add(chitiet);
            }
            database.SaveChanges();
            //Xóa giỏ hàng
            Session["GioHang"] = null;
            return RedirectToAction("HoanThanhDonHang");
        }
        public ActionResult HoanThanhDonHang()
        {
            return View();
        }
    }
}