using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Linq;

namespace SitedenVeriCekme_xml
{
    public class Program
    {
        static void Main(string[] args)
        {

            XDocument document = XDocument.Load("http://tcmb.gov.tr/kurlar/today.xml");
            XElement element = (from elm in document.Descendants("Currency")
                                where elm.Attribute("Kod").Value == "USD"
                                select elm
                                ).FirstOrDefault().Element("ForexBuying");
            Console.WriteLine(element.Value);
            Console.ReadLine();

        }
    }
}
