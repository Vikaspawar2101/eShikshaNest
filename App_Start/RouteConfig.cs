using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;
using System;
using System.Web;

namespace eShikshaNest
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.EnableFriendlyUrls();

            // Add any additional route configurations here.
        }
    }
}

