using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;

namespace Routing_and_Filters.Filters
{
    public class AuthorizationFilterAttributeExample:AuthorizationFilterAttribute
    {
        public override void OnAuthorization(HttpActionContext actionContext)
        {
            base.OnAuthorization(actionContext);
            
        }
    }
}