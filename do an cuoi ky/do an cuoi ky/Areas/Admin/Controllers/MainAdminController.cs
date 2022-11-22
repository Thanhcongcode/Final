using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using do_an_cuoi_ky.Models;
namespace do_an_cuoi_ky.Areas.Admin.Controllers
{
    public class MainAdminController : Controller
    {
        QLBANMOHINHEntities db = new QLBANMOHINHEntities();
        // GET: Admin/MainAdmin
        public ActionResult Index()
        {
            if (Session["EmailAdmin"] == null)
            {
                return RedirectToAction("LoginAdmin");
            }
            else
            {

                return View();
            }
        }
        public ActionResult LoginAdmin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoginAdmin(UserAdmin _user)
        {
            var checkac = db.UserAdmins.Where(s => s.TenDangNhap == _user.TenDangNhap && s.MatKhau == _user.MatKhau).FirstOrDefault();
            if (checkac.TenDangNhap == _user.TenDangNhap && checkac.MatKhau == _user.MatKhau)
            {
                Session["EmailAdmin"] = _user.TenDangNhap;
                return RedirectToAction("Index");
            }
            else
            {
                return View();
            }
        }
        // GET: Admin/MainAdmin/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Admin/MainAdmin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/MainAdmin/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/MainAdmin/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Admin/MainAdmin/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/MainAdmin/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Admin/MainAdmin/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
