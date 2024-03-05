using Dtm.Framework.Base.Controllers;
using Dtm.Framework.Base.Models;
using Dtm.Framework.ClientSites.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace IDVCSV2.Controllers
{
    public class PWAController : BaseController<BaseClientViewData>
    {
        public ActionResult RenderOffline (string display, string page) 
        {
            return GetView("Offline", display, page);
        }

        public ActionResult GetView (string viewName, string display, string page) 
        {
            SetOfferVersion();
            return PartialView(viewName, Model);
        }

        private void SetOfferVersion ()
        {
            Guid covid = Guid.TryParse(Request["covid"], out covid) ? covid : Guid.Empty;
            if ( covid != Guid.Empty && DtmContext.CampaignOfferVersions.Any(cov => cov.OfferVersionId == covid))
            {
                var offerVersion = DtmContext.CampaignOfferVersions.First(cov => cov.OfferVersionId == covid);
                DtmContext.OfferCode = offerVersion.OfferCode;
                DtmContext.Version = offerVersion.VersionNumber;
                DtmContext.VersionId = offerVersion.OfferVersionId;
            }
        }
    }
}