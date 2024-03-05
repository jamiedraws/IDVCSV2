using Dtm.Framework.ClientSites.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace IDVCSV2
{
    public class MvcApplication : ClientSiteApplication
    {
        protected override void ConfigureAdditionalRoutes(RouteCollection routes)
        {
            routes.MapRoute(
                "Offline",
                "ViewOffline",
                new
                {
                    controller = "PWA",
                    action = "RenderOffline",
                    pageCode = "none"
                }
            );

            base.ConfigureAdditionalRoutes(routes);
        }
    }
}