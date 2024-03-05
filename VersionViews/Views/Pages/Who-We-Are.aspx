<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<h2 id="categoryDisrupters" class="catd__title catd__title--alt">
		<div class="line"></div>
		We Are Category Disrupters
		<div class="line"></div>
	</h2>
	<!--<div class="info info--full">
		<h3 class="info__title">Our Heritage</h3>
		<p>In 1999, Ideavillage pioneered the TV-to-retail model & built an organization that leads the field in marketing and product innovation. The result is a combined <strong>5 billion dollars in direct-to-consumer and retail sales revenue.</strong></p>
		<p>Our brands and products are among the most <strong class="info__accent">| memorable and popular |</strong> in the marketplace.</p>
	</div>
	<div class="products">
		<div class="products__item product__item--main"><img src="/images/products/snackeez.png" alt="Snackeez"></div>
		<div class="products__item products__item--main"><img src="/images/products/hd-vision.png" alt="HD Vision Glasses"></div>
		<div class="products__item products__item--main"><img src="/images/products/egglettes.png" alt="Egglettes"></div>
		<div class="products__item products__item--main"><img src="/images/products/rocket-copters.png" alt="Rocket Copters"></div>
		<div class="products__item products__item--main"><img src="/images/products/magic-pens.png" alt="Magic Pens"></div>
		<div class="products__item products__item--main"><img src="/images/products/hamper-hoops.png" alt="Hamper Hoops"></div>
		<div class="products__item products__item--main"><img src="/images/products/pedi-spin.png" alt="Pedi Spin"></div>
		<div class="products__item products__item--main"><img src="/images/products/yoshi-blue.png" alt="Yoshi Blue"></div>
		<div class="products__item hidden"><img src="/images/products/ahh-bra.png" alt="Ahh Bra"></div>
		<div class="products__item hidden"><img src="/images/products/boom-cube.png" alt="Boom Cube"></div>
		<div class="products__item hidden"><img src="/images/products/brightlight-pillow.png" alt="Bright Light Pillow"></div>
		<div class="products__item hidden"><img src="/images/products/coin-trap.png" alt="Chris Angel Coin Trap"></div>
		<div class="products__item hidden"><img src="/images/products/comfort-click.png" alt="Comfort Click Belt"></div>
		<div class="products__item hidden"><img src="/images/products/easy-feet.png" alt="Easy Feet"></div>
		<div class="products__item hidden"><img src="/images/products/flips-audio.png" alt="Flips Audio"></div>
		<div class="products__item hidden"><img src="/images/products/fushigi.png" alt="Fushigi"></div>
		<div class="products__item hidden"><img src="/images/products/hover-ball.png" alt="Hover Ball"></div>
		<div class="products__item hidden"><img src="/images/products/jewelry-clasp.png" alt="Jewelry Clasp"></div>
		<div class="products__item hidden"><img src="/images/products/loud-n-clear.png" alt="Loud N Clear"></div>
		<div class="products__item hidden"><img src="/images/products/microtouch-max.png" alt="MicroTouch Max"></div>
		<div class="products__item hidden"><img src="/images/products/microtouch-one.png" alt="MicroTouch One"></div>
		<div class="products__item hidden"><img src="/images/products/microtouch-solo.png" alt="MicroTouch Solo"></div>
		<div class="products__item hidden"><img src="/images/products/miss-belt.png" alt="Miss Blet"></div>
		<div class="products__item hidden"><img src="/images/products/music-bullet.png" alt="Music Bullet"></div>
		<div class="products__item hidden"><img src="/images/products/naked-nails.png" alt="Naked Nails"></div>
		<div class="products__item hidden"><img src="/images/products/purse-brite.png" alt="Purse Belt"></div>
		<div class="products__item hidden"><img src="/images/products/salon-bronze.png" alt="Salon Bronze"></div>
		<div class="products__item hidden"><img src="/images/products/shimmer-tattoo.png" alt="Shimmer Glitter Tattoo"></div>
		<div class="products__item hidden"><img src="/images/products/slim-shots.png" alt="Slim Shots"></div>
		<div class="products__item hidden"><img src="/images/products/smooth-away.png" alt="Smooth Away"></div>
		<div class="products__item hidden"><img src="/images/products/spin-spa.png" alt="Spin Spa"></div>
		<div class="products__item hidden"><img src="/images/products/stompeez.png" alt="Stompeez"></div>
		<div class="products__item hidden"><img src="/images/products/stufz.png" alt="Stufz"></div>
		<div class="products__item hidden"><img src="/images/products/swerve-ball.png" alt="Swerve Ball"></div>
		<div class="products__item hidden"><img src="/images/products/wallet-pix.png" alt="Wallet Pix"></div>
		<div class="products__item hidden"><img src="/images/products/yoshi-copper.png" alt="Yoshi Copper"></div>
	</div>
	<div class="btn-wrapper">
		<a id="viewMoreBtn" href="javascript:showAllProducts();" class="btn products__btn">View More</a>
		<a id="viewLessBtn" href="javascript:showLessProducts();" class="btn products__btn">View Less</a>
	</div>
-->
	<div class="tile">
		<div class="info tile__info">
			<h3 class="info__title">Modern Marketers</h3>
			<p>We leverage the efficiencies of direct-to-
				consumer marketing through multi-channel
				platforms including television, digital, print
				and retail. </p>
		</div>
		<div class="tile__line"></div>
		<div class="tile__image tile__image--left">
			<img src="/images/marketers-1.png" alt="Our incredible brands">
		</div>
		<div class="tile__image tile__image--right">
			<img src="/images/marketers-2.png" alt="Our incredible brands">
		</div>
	</div>
	<div class="tile tile--retailers">
		<div class="info tile__info">
			<h3 class="info__title">Retail Distribution</h3>
			<p>Our retailer relationships and international distribution network allow us to easily expand our portfolio of brands globally.</p>
		</div>
		<div class="tile__line"></div>
		<div class="tile__image tile__image--left tile__image--retailers retailers--desktop">
			<img src="/images/retailers.jpg" alt="We have products with all these retailers">
		</div>
		<div class="tile__image tile__image--left tile__image--retailers retailers--mobile">
			<img src="/images/retailers--mobile.jpg" alt="We have products with all these retailers">
		</div>
		<div class="tile__image tile__image--right">
			<img src="/images/retail.png" alt="Our product brand displays">
		</div>
	</div>

</asp:Content>

