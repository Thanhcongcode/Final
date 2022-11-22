using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using do_an_cuoi_ky.Models;

namespace do_an_cuoi_ky.Controllers
{
    public class HomeController : Controller

    {
        QLBANMOHINHEntities db = new QLBANMOHINHEntities();
        public ActionResult Index()
        {
            var mohinhMoi = LayMoHinhMoi(6);
            return View(mohinhMoi);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult Khung()
        {
            return View();
        }
        public ActionResult ShopPage()
        {
            return View();
        }
        public ActionResult Introduction()
        {
            return View();
        }
        
        private List<MOHINH> LayMoHinhMoi(int soluong)
        {
            // Sắp xếp sách theo ngày cập nhật giảm dần, lấy đúng số lượng sách cần
            // Chuyển qua dạng danh sách kết quả đạt được
            return db.MOHINHs.OrderByDescending(mohinh => mohinh.NgayCapNhat).Take(soluong).ToList();
        }
    }
}