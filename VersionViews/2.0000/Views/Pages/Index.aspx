<%@ Page Language="C#" MasterPageFile="~/VersionViews/2.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Hero --> 
    <div class="view hero hero--background-video section defer-vimeo">
        <div class="hero__video defer-vimeo__vimeo">
            <div id="hero-vimeo" data-defer-vimeo="569538969&dnt=1&background=1" class="contain contain--hero"></div>
        </div>
        <picture class="contain contain--hero hero__picture defer-vimeo__picture">
            <img src="/images/2.0000/video-placeholder.jpg" srcset="/images/2.0000/video-placeholder_mobile.jpg 375w, /images/2.0000/video-placeholder.jpg 1980w" sizes="(max-width: 800px) 50px" alt="" />
        </picture>
    </div>

    <!-- Brand Portfolio -->
    <main class="view section">
        <div class="view__anchor " id="main"></div>
        <div class="view__in section__in">
            <div class="content content--title-text content-reveal content-reveal--from-bottom">
                <h1 class="content__title">
                    We transform <b>visionary ideas</b> into <b>brands</b>
                </h1>
                <p>
                    Ideavillage creates and partners with high-potential
                    brands that are poised to change the world and
                    positively impact consumers&rsquo; lives.
                </p>
            </div>
            <div class="content content--title-images">
                <h2 class="content__title content-reveal content-reveal--from-bottom">Brand Portfolio</h2>
                <div class="content__images">
                    <div class="content__group">
                        <div class="slide slide--brand-portfolio slide--fade">
                            <div id="slide-microtouch" class="slide__into" data-slide-config='{ "setDelay" : "3000" }'>
                                <picture
                                    class="
                                        slide__item
                                        slide__item--current
                                        contain contain--brand-portfolio
                                    "
                                    data-slide-fade-src="/images/carousel/microtouch/slide1.jpg"  
                                    data-attr='{ "alt" : "Man using MicroTouch trimmer to shave chest" }'
                                ></picture>
                                <picture
                                    class="
                                        slide__item
                                        contain contain--brand-portfolio
                                    "
                                    data-slide-fade-src="/images/carousel/microtouch/slide2.jpg"
                                    data-attr='{ "alt" : "The three products in the MicroTouch brand family: MicroTouch Solo, MicroTouch Titanium Trim, and MicroTouch Max." }'
                                ></picture>
                                <picture
                                    class="
                                        slide__item
                                        contain contain--brand-portfolio
                                    "
                                    data-slide-fade-src="/images/carousel/microtouch/slide3.jpg"
                                    data-attr='{ "alt" : "A shirtless man uses MicroTouch Titanium Trim to groom his close-cut beard." }'
                                ></picture>
                            </div>
                        </div>
                        <div class="slide slide--brand-portfolio slide--fade">
                            <div id="slide-copper-fit" class="slide__into" data-slide-config='{ "setDelay" : "5000" }'>
                                <picture
                                    class="
                                        slide__item
                                        slide__item--current
                                        contain contain--brand-portfolio
                                    "
                                    data-slide-fade-src="/images/carousel/copperfit/slide1.jpg"
                                    data-attr='{ "alt" : "A shirtless man wears a Copper Fit Advanced Back Pro back brace over his lower back." }'
                                ></picture>
                                <picture
                                    class="
                                        slide__item
                                        contain contain--brand-portfolio
                                    "
                                    data-slide-fade-src="/images/carousel/copperfit/slide2.jpg"
                                    data-attr='{ "alt" : "A construction worker puts on black Copper Fit Compression Gloves." }'
                                ></picture>
                                <picture
                                    class="
                                        slide__item
                                        contain contain--brand-portfolio
                                    "
                                    data-slide-fade-src="/images/carousel/copperfit/slide3.jpg"
                                    data-attr='{ "alt" : "A man in athletic shorts and a shirt pulls a black Copper Fit Compression Sleeve over his knee." }'
                                ></picture>
                            </div>
                        </div>
                        <div class="slide slide--brand-portfolio slide--fade">
                            <div id="slide-flawless" class="slide__into" data-slide-config='{ "setDelay" : "4000" }'>
                                <picture
                                    class="
                                        slide__item
                                        slide__item--current
                                        contain contain--brand-portfolio
                                    "
                                    data-slide-fade-src="/images/carousel/flawless/slide1.jpg"
                                    data-attr='{ "alt" : "All the products in the Finishing Touch Flawless hair removal brand, including Face, Cleanse, Nu Razor, DermaPlane, Salon Nails, Ice Roller, Pedi, Brows, Legs, and Contour." }'
                                ></picture>
                                <picture
                                    class="
                                        slide__item
                                        contain contain--brand-portfolio
                                    "
                                    data-slide-fade-src="/images/carousel/flawless/slide2.jpg"
                                    data-attr='{ "alt" : "A woman removes fine hairs from her cheek using the Finishing Touch Flawless hair removal product. " }'
                                ></picture>
                                <picture
                                    class="
                                        slide__item
                                        contain contain--brand-portfolio
                                    "
                                    data-slide-fade-src="/images/carousel/flawless/slide3.jpg"
                                    data-attr='{ "alt" : "A woman&apos;s hand holds a pink Finishing Touch Flawless Cleanse facial cleanser and massager under a stream of water." }'
                                ></picture>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Building Brands -->
    <section class="view section">
        <div class="content content--text-image">
            <picture
                class="content__image-bg"
                data-src-img="/images/icons/idv.svg"
                data-attr='{ "alt" : "" }'
            ></picture>
            <div class="content__group">
                <div class="content__text">
                    <div class="content__contain-text content-reveal content-reveal--from-right content-reveal--from-bottom-mobile">
                        <h2 class="content__title">
                            Building well-positioned brands in enduring
                            categories
                        </h2>
                        <p>
                            Ideavillage brings decades of brand-building
                            experience to our relationships with
                            collaborative partners, elevating brand
                            recognition and establishing market leadership.
                        </p>
                        <p>
                            We leverage our operational expertise and vast
                            capital resources to drive growth and
                            profitability.
                        </p>
                    </div>
                </div>
                <div class="content__image slide slide--building-brand slide--fade ">
                    <div id="slide-building-brands" class="slide__into" data-slide-config='{ "setDelay" : "5000" }'>
                        <picture
                            class="
                                slide__item
                                slide__item--current
                                contain contain--building-brand
                            "
                            data-slide-fade-src="/images/carousel/building-brands/slide5.jpg"
                            data-attr='{ "alt" : "Jerry Rice lunges to catch a pass while wearing Copper Fit Compression Gloves, Copper Fit Compression Elbow Sleeves, and Copper Fit Advanced Back Pro." }'
                        ></picture>
                       <!-- <picture
                            class="
                                slide__item
                                contain contain--building-brand
                            "
                            data-slide-fade-src="/images/carousel/building-brands/slide6.jpg"
                            data-attr='{ "alt" : "Brett Farve smiles and sits casually in an aqua t-shirt and black shorts while wearing a Copper Fit Compression Elbow Sleeve and Knee Sleeve." }'
                        ></picture>
                        <picture
                            class="
                                slide__item
                                slide__item--current
                                contain contain--building-brand
                            "
                            data-slide-fade-src="/images/carousel/building-brands/slide1.jpg"
                            data-attr='{ "alt" : "Halle Berry smiles while holding the Finishing Touch Flawless Nu Razor in her hands." }'
                        ></picture>
                        <picture
                            class="
                                slide__item
                                contain contain--building-brand
                            "
                            data-slide-fade-src="/images/carousel/building-brands/slide2.jpg"
                            data-attr='{ "alt" : "Ashley Graham smiles and holds Finishing Touch Flawless Cleanse to her cheek as she does her beauty routine at her bathroom mirror in her robe." }'
                        ></picture>
                        <picture
                            class="
                                slide__item
                                contain contain--building-brand
                            "
                            data-slide-fade-src="/images/carousel/building-brands/slide3.jpg"
                            data-attr='{ "alt" : "Amelia Gray Hamlin looks in the mirror and uses Finishing Touch Flawless Face to remove fine hair from her jawline." }'
                        ></picture>
                        <picture
                            class="
                                slide__item
                                contain contain--building-brand
                            "
                            data-slide-fade-src="/images/carousel/building-brands/slide4.jpg"
                            data-attr='{ "alt" : "Dove Cameron sits on the side of the bathtub in white loungewear and heels using Finishing Touch Flawless Nu Razor to remove hair from her legs." }'
                        ></picture>-->
                    </div>
                </div>
            </div>
        </div>
    </section>
    </asp:Content>
