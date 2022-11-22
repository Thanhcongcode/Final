using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace do_an_cuoi_ky.Areas.Admin.Controllers
{
    public class LoaiSanPhamtController : Controller
    {
        // GET: Admin/LoaiSanPhamt
        public ActionResult Index()
        {
            return View();
        }

        // GET: Admin/LoaiSanPhamt/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Admin/LoaiSanPhamt/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/LoaiSanPhamt/Create
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

        // GET: Admin/LoaiSanPhamt/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Admin/LoaiSanPhamt/Edit/5
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

        // GET: Admin/LoaiSanPhamt/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Admin/LoaiSanPhamt/Delete/5
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
