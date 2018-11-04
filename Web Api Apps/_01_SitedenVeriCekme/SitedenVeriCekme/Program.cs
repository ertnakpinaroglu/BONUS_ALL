using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace SitedenVeriCekme
{
    public class Program
    {
        static void Main(string[] args)
        {
            WebRequest request = HttpWebRequest.Create("http://www.gencayyildiz.com");
            WebResponse response = request.GetResponse();
            StreamReader streamReader = new StreamReader(response.GetResponseStream());
            string oku = streamReader.ReadToEnd();
            Console.WriteLine(oku);
            Console.ReadLine();
        }
    }
}
