using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Routing_and_Filters.Controllers
{
    [RoutePrefix("api/Values")]
    public class ValuesController : ApiController
    {
        // GET api/values
        [HttpGet]
        [Route("/Get")]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }
        [Route("/{id}")]
        // GET api/values/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        [Route("/Post")]
        public void Post([FromBody]string value)
        {
        }
        [Route("/Put/{id}")]
        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }
        [Route("/Delete/{id}")]
        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}
