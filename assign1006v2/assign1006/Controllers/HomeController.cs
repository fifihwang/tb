using assign1006.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace assign1006.Controllers
{
    public class HomeController : Controller
    {
        private assignv1Container db = new assignv1Container();
        public ActionResult Index()
        {
            return View();
        }
        
      
        public ActionResult ToEat()
        {
            ViewBag.Message = "Foods";

            return View(db.FOODSet.ToList());
        }

        public ActionResult ToVisit()
        {
            ViewBag.Message = "Spots";

            return View();
        }

        public ActionResult MyPlan()
        {
            ViewBag.Message = "There is your plan";

            return View();
        }
    }
}