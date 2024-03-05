<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<h2 class="catd__title catd__title--alt">
		<div class="line"></div>
		Become A Partner
		<div class="line"></div>
	</h2>
	<div class="wrapper">
		<p>At Ideavillage, we use a precise and focused approach to quickly bring meaningful innovation to market using our proven model of marketing success.</p>
		<p>Whether you have an innovative product or are looking to build or accelerate a brand, we can be the partner for you.</p>
        <p>We Acquire Established Brands and Invest in High Potential Brands at Any Stage of Growth</p>
        <p>We utilize our capital; leverage our experienced team, retail relationships; and global supply chain to help scale brands faster and more efficiently.</p>
		<div class="partner-callout">
			<h3 class="partner-callout__title">
				WHAT WE ARE LOOKING FOR IN OUR BRAND PARTNERS
			</h3>
			<ul class="partner-callout__list">
				<li class="bullet--lightbulb"><strong>Innovation</strong> &ndash; products or brands that have a dynamic solution to common problems</li>
				<li class="bullet--meeting"><strong>Dedication</strong> &ndash; individuals that are passionate and dedicated to working with our team
					every step of the way to ensure a successful marketing campaign</li>
				<li class="bullet--world"><strong>Expertise</strong> &ndash; knowledge of the market segment</li>
			</ul>
		</div>
		<p>Whether you're an inventor, existing company, retailer, please fill out the form below and we'll get right back to you.</p>
		<% Html.RenderPartial("ContactForm", Model); %>
	</div>


</asp:Content>

