using do_an_cuoi_ky.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace do_an_cuoi_ky.Controllers
{
    public class ShopController : Controller
    {
        private QLBANMOHINHEntities db = new QLBANMOHINHEntities();
        // GET: Shop
        public ActionResult Index()
        {
            return View(db.MOHINHs.ToList());
        }
        public ActionResult SPTheoChuDe(int id)
        {
            //Lấy các sách theo mã chủ đề được chọn
            var dsSachTheoChuDe = db.MOHINHs.Where(mohinh => mohinh.MaCD ==id).ToList();
            //Trả về View để render các sách trên (tái sử dụng View Index ở trên, truyền vao danh sách)
            return View("Index", dsSachTheoChuDe);
        }
        public ActionResult LayChuDe()
        {
            var dsChuDe = db.CHUDEs.ToList();
            return PartialView(dsChuDe);
        }

        // GET: Shop/Details/5
        public ActionResult Details(int id)
        {
            //Lấy sách có mã tương ứng
            var mohinh = db.MOHINHs.FirstOrDefault(mh => mh.MaMH == id);
                return View(mohinh);
            
        }

        // GET: Shop/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Shop/Create
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

        // GET: Shop/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Shop/Edit/5
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

        // GET: Shop/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Shop/Delete/5
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
        public ActionResult OnePiecePage()
        {
            return View();
        }
    }
}
