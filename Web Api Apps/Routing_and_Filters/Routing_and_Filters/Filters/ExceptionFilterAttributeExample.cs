using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Filters;

namespace Routing_and_Filters.Filters
{
    public class ExceptionFilterAttributeExample:ExceptionFilterAttribute
    {
        public override void OnException(HttpActionExecutedContext actionExecutedContext)
        {
            base.OnException(actionExecutedContext);
            // Hata olunca calisacak yer 
            //actionExecutedContext.Exception.HResult
            //actionExecutedContext.Exception.Message
            //actionExecutedContext.Exception.StackTrace
        }
    }
}