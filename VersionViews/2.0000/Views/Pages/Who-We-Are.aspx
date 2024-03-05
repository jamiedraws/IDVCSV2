<%@ Page Language="C#"
MasterPageFile="~/VersionViews/2.0000/Views/Layouts/InternalLayout.master"
Inherits="System.Web.Mvc.ViewPage<OrderPageViewData
    >" %> <%@ Import Namespace="Dtm.Framework.ClientSites" %>

    <asp:Content
        ID="Content1"
        ContentPlaceHolderID="head"
        runat="server"
    ></asp:Content>
    <asp:Content
        ID="Content2"
        ContentPlaceHolderID="MainContent"
        runat="server"
    >
        <!-- Main -->
        <main class="view section">
            <div id="main" class="view__anchor"></div>

            <div class="hero hero--title-bg hero--WWA_banner">
                <h1 class="hero__title">Who We Are</h1>
               
            </div>

            <div class="view__in section__in">
                <div class="content content--title-text content-reveal content-reveal--from-bottom">
                    <h1 class="content__title">
                        We are <b>omni channel marketers</b> who believe
                    </h1>
                </div>
                <div class="content content--icon-text">
                    <div class="content__group">
                        <figure class="content__text content-reveal content-reveal--from-bottom">
                            <picture
                                data-src-img="/images/2.0000/icons/gear-lightbulb.jpg"
                                data-attr='{ "alt" : "An icon of a lit light bulb with two gears" }'
                                class="contain contain--icon"
                            ></picture>
                            <figcaption>
                                Every brand starts with an unforgettable
                                product.
                            </figcaption>
                        </figure>

                        <figure class="content__text content-reveal content-reveal--from-bottom">
                            <picture
                                data-src-img="/images/2.0000/icons/megaphone.jpg"
                                data-attr='{ "alt" : "An icon of a megaphone" }'
                                class="contain contain--icon"
                            ></picture>

                            <figcaption>
                                Every category can be disrupted to meet consumer
                                needs and desires.
                            </figcaption>
                        </figure>

                        <figure class="content__text content-reveal content-reveal--from-bottom">
                            <picture
                                data-src-img="/images/2.0000/icons/medal.jpg"
                                data-attr='{ "alt" : "An icon of a round ruffled prize ribbon with two streamers" }'
                                class="contain contain--icon"
                            ></picture>
                            <figcaption>
                                Robust marketing creates enduring brands.
                            </figcaption>
                        </figure>

                        <figure class="content__text content-reveal content-reveal--from-bottom">
                            <picture
                                data-src-img="/images/2.0000/icons/working.jpg"
                                data-attr='{ "alt" : "An icon of a round ruffled prize ribbon with two streamers" }'
                                class="contain contain--icon"
                            ></picture>
                            <figcaption>
                                Disciplined operations are paramount to success
                            </figcaption>
                        </figure>

                        <figure class="content__text content-reveal content-reveal--from-bottom">
                            <picture
                                data-src-img="/images/2.0000/icons/community.jpg"
                                data-attr='{ "alt" : "An icon of a gridded globe with human figures in front of it" }'
                                class="contain contain--icon"
                            ></picture>
                            <figcaption>
                                Every company should evolve with changing market
                                dynamics and consumer demands
                            </figcaption>
                        </figure>

                        <figure class="content__text content-reveal content-reveal--from-bottom">
                            <picture
                                data-src-img="/images/2.0000/icons/partners.jpg"
                                data-attr='{ "alt" : "An icon of two people sitting across from each other at a table" }'
                                class="contain contain--icon"
                            ></picture>
                            <figcaption>
                                Strong partnerships are critical to success.
                            </figcaption>
                        </figure>
                    </div>
                </div>
            </div>
        </main>

        <!-- Photo Strip -->
        <section aria-label="Photo Gallery" class="view photo-strip photo-strip--remove-toggle slide section">
            <div class="photo-strip__in">
                <div class="photo-strip__button-slide">
                    <label class="photo-strip__toggle shape-icon-button">
                        <input type="checkbox" data-slide-toggle aria-label="Play or pause photo gallery">
                        <span class="shape-icon-button__status">
                            <svg class="icon shape-icon-button__icon-play">
                                <use xlink:href="#icon-play" href="#icon-play"></use>
                            </svg>
                            <svg class="icon shape-icon-button__icon-pause">
                                <use xlink:href="#icon-pause" href="#icon-pause"></use>
                            </svg>
                        </span>
                    </label>
                    <div class="photo-strip__group">
                    <div
                        class="
                            slide
                            slide--photo-strip-lg
                            slide--will-auto-scroll
                        "
                    >
                        <div class="slide__observer"></div>
                        <div class="slide__into">
                            <div id="slide-photo-strp-lg" class="slide__scroll">
                            <!--<a
                                href="/images/2.0000/photostrip/hq/lg/slide1_hq.jpg"
                                data-src-img="/images/2.0000/photostrip/lg/slide1.jpg"
                                data-fancybox
                                data-attr='{ "alt" : "Halle Berry looks over her bare shoulder while holding a Finishing Touch Flawless Face in her hand against her upper arm." }'
                                class="
                                    slide__item
                                    contain
                                    contain--photo-strip-lg
                                    contain--photo-strip-lg-1
                                "
                            ></a
                            >--><a
                                href="/images/2.0000/photostrip/hq/lg/slide2_hq.jpg"
                                data-src-img="/images/2.0000/photostrip/lg/slide2.jpg"
                                data-fancybox
                                data-attr='{ "alt" : "A sweaty man in athletic shirt and shorts runs up empty aluminum stadium bleachers wearing Copper Fit Compression Sleeves on both knees." }'
                                class="
                                    slide__item
                                    contain
                                    contain--photo-strip-lg
                                    contain--photo-strip-lg-2
                                "
                            ></a
                            ><a
                                href="/images/2.0000/photostrip/hq/lg/slide3_hq.jpg"
                                data-src-img="/images/2.0000/photostrip/lg/slide3.jpg"
                                data-fancybox
                                data-attr='{ "alt" : "A shirtless man with his back turned uses MicroTouch Titanium Trim to shave the back of his shoulder near the neck." }'
                                class="
                                    slide__item
                                    contain
                                    contain--photo-strip-lg
                                    contain--photo-strip-lg-3
                                "
                            ></a
                            ><a
                                href="/images/2.0000/photostrip/hq/lg/slide4_hq.jpg"
                                data-src-img="/images/2.0000/photostrip/lg/slide4.jpg"
                                data-fancybox
                                data-attr='{ "alt" : "A hand presses down on a Copper Fit Angel Sleeper memory foam posture pillow, indenting it." }'
                                class="
                                    slide__item
                                    contain
                                    contain--photo-strip-lg
                                    contain--photo-strip-lg-4
                                "
                            ></a
                            ><a
                                href="/images/2.0000/photostrip/hq/lg/slide5_hq.jpg"
                                data-src-img="/images/2.0000/photostrip/lg/slide5.jpg"
                                data-fancybox
                                data-attr='{ "alt" : "A healthcare provider with a stethoscope coiled in hand wears a black Copper Fit Advanced Back Pro back brace printed with \"Live Limitless.\"" }'
                                class="
                                    slide__item
                                    contain
                                    contain--photo-strip-lg
                                    contain--photo-strip-lg-5
                                "
                            ></a
                            ><!--<a
                                href="/images/2.0000/photostrip/hq/lg/slide6_hq.jpg"
                                data-src-img="/images/2.0000/photostrip/lg/slide6.jpg"
                                data-fancybox
                                data-attr='{ "alt" : "Dove Cameron uses Finishing Touch Flawless Brows to remove hair below her eyebrow." }'
                                class="
                                    slide__item
                                    contain
                                    contain--photo-strip-lg
                                    contain--photo-strip-lg-6
                                "
                            ></a>-->
                            </div>
                        </div>
                    </div>
                    <div
                        class="
                            slide
                            slide--photo-strip-sm
                            slide--will-auto-scroll
                        "
                    >
                        <div class="slide__into">
                        <div id="slide-photo-strip-sm" class="slide__scroll">
                            <a
                                href="/images/2.0000/photostrip/hq/sm/slide1_hq.jpg"
                                data-src-img="/images/2.0000/photostrip/sm/slide1.jpg"
                                data-fancybox
                                data-attr='{ "alt" : "A shirtless man uses MicroTouch Solo to shave his lower torso." }'
                                class="
                                    slide__item
                                    contain
                                    contain--photo-strip-sm
                                    contain--photo-strip-sm-1
                                "
                            ></a
                            ><a
                                href="/images/2.0000/photostrip/hq/sm/slide2_hq.jpg"
                                data-src-img="/images/2.0000/photostrip/sm/slide2.jpg"
                                data-fancybox
                                data-attr='{ "alt" : "A pair of hands wearing black Copper Fit Compression Gloves." }'
                                class="
                                    slide__item
                                    contain
                                    contain--photo-strip-sm
                                    contain--photo-strip-sm-2
                                "
                            ></a
                            ><!--<a
                                href="/images/2.0000/photostrip/hq/sm/slide3_hq.jpg"
                                data-src-img="/images/2.0000/photostrip/sm/slide3.jpg"
                                data-fancybox
                                data-attr='{ "alt" : "Ashley Graham in a black and white patterned robe holds Finishing Touch Flawless Cleanse to her chin." }'
                                class="
                                    slide__item
                                    contain
                                    contain--photo-strip-sm
                                    contain--photo-strip-sm-3
                                "
                            ></a
                            >--><a
                                href="/images/2.0000/photostrip/hq/sm/slide4_hq.jpg"
                                data-src-img="/images/2.0000/photostrip/sm/slide4.jpg"
                                data-fancybox
                                data-attr='{ "alt" : "The legs of a runner on a track wearing a black Copper Fit Compression Knee Sleeve." }'
                                class="
                                    slide__item
                                    contain
                                    contain--photo-strip-sm
                                    contain--photo-strip-sm-4
                                "
                            ></a
                            ><!--<a
                                href="/images/2.0000/photostrip/hq/sm/slide5_hq.jpg"
                                data-src-img="/images/2.0000/photostrip/sm/slide5.jpg"
                                data-fancybox
                                data-attr='{ "alt" : "Amelia Hamlin uses Finishing Touch Flawless Nu Razor to remove hair from her lower leg." }'
                                class="
                                    slide__item
                                    contain
                                    contain--photo-strip-sm
                                    contain--photo-strip-sm-5
                                "
                            ></a
                            >--><!--<a
                                href="/images/2.0000/photostrip/hq/sm/slide6_hq.jpg"
                                data-src-img="/images/2.0000/photostrip/sm/slide6.jpg"
                                data-fancybox
                                data-attr='{ "alt" : "Finishing Touch Flawless Nu Razor sits on a white couch next to Amelia Hamlin, who reclines in a long cardigan, athletic bra, and biker shorts." }'
                                class="
                                    slide__item
                                    contain
                                    contain--photo-strip-sm
                                    contain--photo-strip-sm-6
                                "
                            ></a>-->
                            <a
                                href="/images/2.0000/photostrip/hq/sm/slide7_hq.jpg"
                                data-src-img="/images/2.0000/photostrip/sm/slide7.jpg"
                                data-fancybox
                                data-attr='{ "alt" : "A male construction worker looking toward the sunlight wears HD Vision glasses on the job." }'
                                class="
                                    slide__item
                                    contain
                                    contain--photo-strip-sm
                                    contain--photo-strip-sm-7
                                "
                            ></a>
                            <a
                                href="/images/2.0000/photostrip/hq/sm/slide8_hq.jpg"
                                data-src-img="/images/2.0000/photostrip/sm/slide8.jpg"
                                data-fancybox
                                data-attr='{ "alt" : "Close up of the rose gold-colored circular head of Finishing Touch Flawless Face." }'
                                class="
                                    slide__item
                                    contain
                                    contain--photo-strip-sm
                                    contain--photo-strip-sm-8
                                "
                            ></a>
                            <a
                                href="/images/2.0000/photostrip/hq/sm/slide9_hq.jpg"
                                data-src-img="/images/2.0000/photostrip/sm/slide9.jpg"
                                data-fancybox
                                data-attr='{ "alt" : "A woman in blue scrubs with a stethoscope around her neck pulls a black Copper Fit Compression Sock up over her calf." }'
                                class="
                                    slide__item
                                    contain
                                    contain--photo-strip-sm
                                    contain--photo-strip-sm-9
                                "
                            ></a>
                            <a
                                href="/images/2.0000/photostrip/hq/sm/slide10_hq.jpg"
                                data-src-img="/images/2.0000/photostrip/sm/slide10.jpg"
                                data-fancybox
                                data-attr='{ "alt" : "A Yoshi Blue Diamondwear Skillet standing on its edge in a white kitchen." }'
                                class="
                                    slide__item
                                    contain
                                    contain--photo-strip-sm
                                    contain--photo-strip-sm-10
                                "
                            ></a>
                            <a
                                href="/images/2.0000/photostrip/hq/sm/slide11_hq.jpg"
                                data-src-img="/images/2.0000/photostrip/sm/slide11.jpg"
                                data-fancybox
                                data-attr='{ "alt" : "A bearded man uses MicroTouch Titanium Trim to cut his short curly hair on top with a fade on the sides." }'
                                class="
                                    slide__item
                                    contain
                                    contain--photo-strip-sm
                                    contain--photo-strip-sm-11
                                "
                            ></a>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="photo-strip__description content-reveal content-reveal--from-top">
                    We elevate brand recognition with collaborative partners.
                </div>
            </div>
        </section>
    </asp:Content>
