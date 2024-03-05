using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web.Mvc;
using Dtm.Framework.ClientSites.Web;
using Dtm.Framework.Models;
using Dtm.Framework.Models.Ecommerce;
using System;


namespace IDVCSV2.PageHandlers
{
    public class GlobalPageHandler : PageHandler
    {

        #region " Overrides... "

        public override void PostProcessPageActions()
        {
            //Checking for the pages code based on the main order pages array on line ten.
            if (DtmContext.Page.IsStartPageType)
            {
                Trace.WriteLine("Processing post page actions...");


                //TODO: Update any post page actions here, use the templates from bellow

                //////***************************** WORKING WITH MVC Request Form ************************
                //////***************************************************************************************

                //string cbxChecked;
                //if (((object)(Form["cbxSelectProduct"])) == null)
                //    cbxChecked = "false";
                //else
                //    cbxChecked = "true";

                //if (cbxChecked == "true")
                //{
                //        OrderManager.UpgradeProduct("SKU1", "SKU3");              
                //}

                ////**************** SHIPPING RULES FOR NON CONTIGUOUS STATES AND CANADA ******************
                ////***************************************************************************************

                ////Creating a list of Non Contiguous States. 
                //IList<string> ExtraShippingStates = StateCodes.NonContiguousStates;

                //if (Order.ShippingCountry == "CAN" || ExtraShippingStates.Any(s => s == Order.ShippingState))
                //{
                //    OrderManager.SetProductQuantity("ADDSHIP", 1);
                //}

                ////***************************** SETTING PRODUCT QUANTITY ********************************
                ////***************************************************************************************

                //OrderManager.SetProductQuantity("SKURUSH", 1);
                //OrderManager.SetProductQuantity("SKU", Order.Items["SKUITEM"].Quantity);

                ////*********************************** UPGRADING SKU ************************************
                ////***************************************************************************************

                //OrderManager.UpgradeProduct("SKU1", "SKU2");
                //OrderManager.UpgradeProduct("SKU3", "SKU4");
                //OrderManager.UpgradeProduct("SKU5", "SKU6");

                ////******************************* UPGRADING MULTIPLE SKUS *******************************
                ////***************************************************************************************

                //OrderManager.UpgradeProducts(new string[] { "SKU1", "SKU2" }, "NEWSKU3");
                //OrderManager.UpgradeProducts(new string[] { "SKU4", "SKU5" }, "NEWSKU6");

                ////*********************************** REPLACING SKUS ************************************
                ////***************************************************************************************

                //OrderManager.ReplaceProducts(new string[] { "SKU1", "SKU2" }, "SKU3", 2);
                //OrderManager.ReplaceProducts(new string[] { "SKU4", "SKU5" }, "SKU6", Order.Items["SKUITEM"].Quantity);

                ////********************************** WORKING WITH TEXTBOXES ****************************
                ////***************************************************************************************

                //System.Web.Mvc.FormCollection form = new System.Web.Mvc.FormCollection();

                ////Use the formcollection to get the  value for a checkbox or radio button.            
                //if (form["ActionCode3"].Trim().ToUpper() == "FREEGIFT")
                //    OrderManager.SetProductQuantity("SKUPROMO", 1);

                ////***************************************************************************************

            }
        }


        public override void PostSetOrderStatus()
        {
            var remoteType = Order.OrderCodes.FirstOrDefault(oc => string.Equals(oc.Label, "RemoteType", StringComparison.InvariantCultureIgnoreCase));

            if (remoteType != null && remoteType.Code == "ProductLead")
            {
                Order.OrderStatusId = 3;
            }
            else
            {
                Order.OrderStatusId = 0;
            }
        }
        #endregion
    }
}
