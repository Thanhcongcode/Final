using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using do_an_cuoi_ky.Models;

namespace do_an_cuoi_ky.Controllers
{
    
    public class UsersController : Controller
    {
        private QLBANMOHINHEntities database = new QLBANMOHINHEntities();
        // GET: Users
        [HttpGet]
        public ActionResult Dangky()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(KHACHHANG cust)
        {
            if (ModelState.IsValid)
            {
                if (string.IsNullOrEmpty(cust.HoTenKH))
                    ModelState.AddModelError(string.Empty, "Tên đăng nhập không được để trống");

                if (string.IsNullOrEmpty(cust.MatKhau))
                    ModelState.AddModelError(string.Empty, "Mật khẩu không được để trống");
                if (string.IsNullOrEmpty(cust.Email))
                    ModelState.AddModelError(string.Empty, "Email không được để trống");
                if (string.IsNullOrEmpty(cust.DienThoaiKH))
                    ModelState.AddModelError(string.Empty, "Điện thoại không được để trống");

                var khachhang = database.KHACHHANGs.FirstOrDefault(k => k.HoTenKH == cust.HoTenKH);
                if (khachhang != null)
                    ModelState.AddModelError(string.Empty, "Đã có người đăng kí tên này");
                if (ModelState.IsValid)
                {
                    database.KHACHHANGs.Add(cust);
                    database.SaveChanges();
                }
                else
                {
                    return View();
                }
            }
            return RedirectToAction("Login");
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(KHACHHANG cust)
        {
            if (ModelState.IsValid)
            {
                if (string.IsNullOrEmpty(cust.Email))
                    ModelState.AddModelError(string.Empty, "Tên đăng nhập không được để trống");
                if (string.IsNullOrEmpty(cust.MatKhau))
                    ModelState.AddModelError(string.Empty, "Mật khẩu không được để trống");
                if (ModelState.IsValid)
                {
                    //Tìm khách hàng có tên đnawg nhập và password hợp lệ trong CSDL
                    var khachhang = database.KHACHHANGs.FirstOrDefault(k => k.Email == cust.Email && k.MatKhau == cust.MatKhau);
                    if (khachhang != null)
                    {
                        ViewBag.ThongBao = "Chúc mừng đăng nhập thành công";
                        //Lưu vào session
                        Session["Taikhoan"] = khachhang;
                    }
                    else
                        ViewBag.ThongBao = "Têm đăng nhập hoặc mật khẩu không đúng";
                }
            }
            return View();
        }
        public ActionResult Logout()
        {
                Session.Clear();
            return RedirectToAction("Index", "Home");
        }
    }
}