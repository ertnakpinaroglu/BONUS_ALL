using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace _01_SitedenVeriCekme.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            WebRequest request = HttpWebRequest.Create("http://www.gencayyildiz.com");
            WebResponse response = request.GetResponse();
            StreamReader streamReader = new StreamReader(response.GetResponseStream());
            string oku = streamReader.ReadToEnd();
            Console.WriteLine(oku);
            return View();
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
    }
}