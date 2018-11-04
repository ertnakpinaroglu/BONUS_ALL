using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;

namespace Routing_and_Filters.Filters
{
    public class ActionFilterAttributeExample : ActionFilterAttribute
    {
        public override void OnActionExecuting(HttpActionContext actionContext)
        {
            // Hataları al validation hataları
            var errors = (from item in actionContext.ModelState.Values
                          from items in item.Errors
                          select items.ErrorMessage).ToList();
            if (actionContext.ModelState.IsValid)
            {

            }
            base.OnActionExecuting(actionContext);
        }

        public override void OnActionExecuted(HttpActionExecutedContext actionExecutedContext)
        {
            base.OnActionExecuted(actionExecutedContext);
            // Log hazırla 
            //actionExecutedContext.Request.RequestUri.Scheme
        }
    }
}