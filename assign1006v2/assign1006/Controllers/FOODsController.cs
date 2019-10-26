using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using assign1006.Models;

namespace assign1006.Controllers
{
    public class FOODsController : Controller
    {
        private assignv1Container db = new assignv1Container();

        // GET: FOODs
        public ActionResult Index()
        {
            return View(db.FOODSet.ToList());
        }

        // GET: FOODs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FOOD fOOD = db.FOODSet.Find(id);
            if (fOOD == null)
            {
                return HttpNotFound();
            }
            return View(fOOD);
        }

        // GET: FOODs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: FOODs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,foodname,foodcalorie,foodaddress")] FOOD fOOD)
        {
            if (ModelState.IsValid)
            {
                db.FOODSet.Add(fOOD);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(fOOD);
        }

        // GET: FOODs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FOOD fOOD = db.FOODSet.Find(id);
            if (fOOD == null)
            {
                return HttpNotFound();
            }
            return View(fOOD);
        }

        // POST: FOODs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,foodname,foodcalorie,foodaddress")] FOOD fOOD)
        {
            if (ModelState.IsValid)
            {
                db.Entry(fOOD).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(fOOD);
        }

        // GET: FOODs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FOOD fOOD = db.FOODSet.Find(id);
            if (fOOD == null)
            {
                return HttpNotFound();
            }
            return View(fOOD);
        }

        // POST: FOODs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            FOOD fOOD = db.FOODSet.Find(id);
            db.FOODSet.Remove(fOOD);
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
