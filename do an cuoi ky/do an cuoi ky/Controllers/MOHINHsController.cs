using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using do_an_cuoi_ky.Models;

namespace do_an_cuoi_ky.Controllers
{
    public class MOHINHsController : Controller
    {
        private QLBANMOHINHEntities db = new QLBANMOHINHEntities();

        // GET: MOHINHs
        public ActionResult Index()
        {
            var mOHINHs = db.MOHINHs.Include(m => m.CHUDE).Include(m => m.NHASANXUAT);
            return View(mOHINHs.ToList());
        }

        // GET: MOHINHs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MOHINH mOHINH = db.MOHINHs.Find(id);
            if (mOHINH == null)
            {
                return HttpNotFound();
            }
            return View(mOHINH);
        }

        // GET: MOHINHs/Create
        public ActionResult Create()
        {
            ViewBag.MaCD = new SelectList(db.CHUDEs, "MaCD", "TenChuDe");
            ViewBag.MaNSX = new SelectList(db.NHASANXUATs, "MaNSX", "TenNSX");
            return View();
        }

        // POST: MOHINHs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaMH,TenMH,Donvitinh,DonGia,MoTa,HinhMinhHoa,MaCD,MaNSX,NgayCapNhat,SoLuongBan,SoLuotXem")] MOHINH mOHINH)
        {
            if (ModelState.IsValid)
            {
                db.MOHINHs.Add(mOHINH);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaCD = new SelectList(db.CHUDEs, "MaCD", "TenChuDe", mOHINH.MaCD);
            ViewBag.MaNSX = new SelectList(db.NHASANXUATs, "MaNSX", "TenNSX", mOHINH.MaNSX);
            return View(mOHINH);
        }

        // GET: MOHINHs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MOHINH mOHINH = db.MOHINHs.Find(id);
            if (mOHINH == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaCD = new SelectList(db.CHUDEs, "MaCD", "TenChuDe", mOHINH.MaCD);
            ViewBag.MaNSX = new SelectList(db.NHASANXUATs, "MaNSX", "TenNSX", mOHINH.MaNSX);
            return View(mOHINH);
        }

        // POST: MOHINHs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaMH,TenMH,Donvitinh,DonGia,MoTa,HinhMinhHoa,MaCD,MaNSX,NgayCapNhat,SoLuongBan,SoLuotXem")] MOHINH mOHINH)
        {
            if (ModelState.IsValid)
            {
                db.Entry(mOHINH).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaCD = new SelectList(db.CHUDEs, "MaCD", "TenChuDe", mOHINH.MaCD);
            ViewBag.MaNSX = new SelectList(db.NHASANXUATs, "MaNSX", "TenNSX", mOHINH.MaNSX);
            return View(mOHINH);
        }

        // GET: MOHINHs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MOHINH mOHINH = db.MOHINHs.Find(id);
            if (mOHINH == null)
            {
                return HttpNotFound();
            }
            return View(mOHINH);
        }

        // POST: MOHINHs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            MOHINH mOHINH = db.MOHINHs.Find(id);
            db.MOHINHs.Remove(mOHINH);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
