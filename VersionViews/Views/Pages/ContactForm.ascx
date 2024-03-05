<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>


	<div class="cform c-brand--form c-brand--form--will-slide width-at-100">
			<form id="productForm" method="post" onsubmit="return false;">
					<h3 class="cform__title">Contact Us</h3>
					<div class="vse"><%= Html.ValidationSummary("The following errors have occurred:") %></div>
					<%= Html.Hidden("OrderType", "None") %>
					<div class="cform__item">
						<label>NAME</label>
						<input type="text" class="width-at-100 block" id="BillingFullName" name="BillingFullName" >
					</div>
					<div class="cform__item">
						<label>EMAIL</label>
						<input type="text" class="width-at-100 block" id="Email" name="Email" >
					</div>
					<div class="cform__item">
						<label>COMPANY</label>
						<input type="tel" class="width-at-100 block" id="Company" name="Company" >
					</div>
					<div class="cform__item cform--description">
						<label>DESCRIPTION</label>
						<textarea id="Description" name="Description" ></textarea>
					</div>
                   <div id="successMessage" style="display: none;" class="cform__item state--success">
                    <label>Form Submitted!</label>
                  </div>
					<div class="cform__item contact__submit">
						<label class="empty">&nbsp;</label>
						<button type="submit" id="AcceptOfferButton" class="submit__no-swipe btn cform__btn" name="acceptOffer">Submit</button>
					</div>                
			</form>
	</div>
