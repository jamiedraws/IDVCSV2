<%@ Page Language="C#" MasterPageFile="~/VersionViews/2.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>

<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Main -->
    <main class="view section">
        <div id="main" class="view__anchor"></div>

        <div class="hero hero--title-bg">
            <h1 class="hero__title">IDV Ventures</h1>
        </div>

        <div class="view__in section__in">
            <div class="content content--icon-caption-text">
                <h1 class="content__title content-reveal content-reveal--from-bottom">We invest in or acquire emerging brands with a
                    compelling or differentiated story.
                </h1>
                <div class="content__group">
                    <figure class="content__icon-caption content-reveal content-reveal--from-bottom">
                        <picture
                            data-src-img="/images/2.0000/icons/health.jpg"
                            data-attr='{ "alt" : "An icon of hands with a water droplet" }'
                            class="contain contain--icon"></picture>
                        <figcaption>Health</figcaption>
                    </figure>

                    <figure class="content__icon-caption content-reveal content-reveal--from-bottom">
                        <picture
                            data-src-img="/images/2.0000/icons/wellness.jpg"
                            data-attr='{ "alt" : "An icon of stacked rocks and a lotus flower" }'
                            class="contain contain--icon"></picture>

                        <figcaption>Wellness</figcaption>
                    </figure>

                    <figure class="content__icon-caption content-reveal content-reveal--from-bottom">
                        <picture
                            data-src-img="/images/2.0000/icons/beauty.jpg"
                            data-attr='{ "alt" : "An icon of a woman&apos;s silhouette from shoulders up and a pump bottle" }'
                            class="contain contain--icon"></picture>
                        <figcaption>Beauty</figcaption>
                    </figure>

                    <figure class="content__icon-caption content-reveal content-reveal--from-bottom">
                        <picture
                            data-src-img="/images/2.0000/icons/apparel.jpg"
                            data-attr='{ "alt" : "An icon of a t-shirt and starbursts" }'
                            class="contain contain--icon"></picture>
                        <figcaption>Apparel</figcaption>
                    </figure>

                    <figure class="content__icon-caption content-reveal content-reveal--from-bottom">
                        <picture
                            data-src-img="/images/2.0000/icons/kitchen.jpg"
                            data-attr='{ "alt" : "An icon of an espresso maker" }'
                            class="contain contain--icon"></picture>
                        <figcaption>Kitchen</figcaption>
                    </figure>

                    <figure class="content__icon-caption content-reveal content-reveal--from-bottom">
                        <picture
                            data-src-img="/images/2.0000/icons/pet.jpg"
                            data-attr='{ "alt" : "An icon of a pet hair brush and food bag" }'
                            class="contain contain--icon"></picture>
                        <figcaption>Pet</figcaption>
                    </figure>
                </div>
                <p class="content__text content-reveal content-reveal--from-bottom">
                    We utilize our capital and leverage our marketing, sales
                and operations teams, retail relationships, and global
                supply chain to
               
                    <strong>effectively scale brands</strong> faster and
                more efficiently.
           
                </p>
            </div>
        </div>
    </main>

    <!--What We Look For-->
    <section
        aria-label="What we look for"
        class="
        view
        section
        emphasize-picture-text emphasize-picture-text--flawless-display
    ">
        <div id="what-we-look-for" class="view__anchor"></div>
        <picture
            class="emphasize-picture-text__bg"
            data-src-img="/images/icons/idv-alternate.svg"
            data-attr='{ "alt" : "" }'></picture>
        <div class="view__in section__in emphasize-picture-text__in">
            <figure class="emphasize-picture-text__group">
                <picture data-src-img="/images/2.0000/microtouch-titanium-display.png" data-attr='{ "alt" : "MicroTouch Titanium Display" }' class="contain contain--microtouch-titanium-display emphasize-picture-text__microtouch-titanium-display"></picture>
                <figcaption class="emphasize-picture-text__text">
                    <h2 class="emphasize-picture-text__title content-reveal content-reveal--from-left content-reveal--from-top-mobile">What we look for
                </h2>
                    <ul>
                        <li class="content-reveal content-reveal--from-left content-reveal--from-top-mobile">Unique, compelling and differentiated brands
                        that can capitalize on emerging trends
                    </li>
                        <li class="content-reveal content-reveal--from-left content-reveal--from-top-mobile">Brand founder stories that engage consumers</li>
                        <li class="content-reveal content-reveal--from-left content-reveal--from-top-mobile">Superior, efficacious products with proven
                        demand
                    </li>
                        <li class="content-reveal content-reveal--from-left content-reveal--from-top-mobile">Brands with omni-channel sales distribution
                        potential
                    </li>
                    </ul>
                </figcaption>
            </figure>
        </div>
    </section>

    <!-- Contact Us -->
    <form aria-label="Contact" class="view form message section form--product-lead" method="post">
        <div class="view__anchor" id="contact"></div>
        <div class="view__in section__in">
            <div class="content-reveal content-reveal--from-bottom">
                <div class="flip">
                    <div class="flip__in">
                        <fieldset class="flip__frontside form__fieldset">
                            <legend class="form__legend form__title">Contact Us</legend>
                            <div class="form__disclaimer">
                                <span class="form__error">*</span> Indicates required
                            field.
                
                            </div>
                            <div class="form__group">
                                <div class="form__field-label">
                                    <input
                                        type="text"
                                        name="BillingFullName"
                                        id="BillingFullName"
                                        placeholder=" "
                                        required
                                        title="First and last name"
                                        pattern="^([A-z.-]+\s[A-z.-]+)"
                                        class="form__field" />
                                    <label
                                        class="message__label message__group"
                                        for="BillingFullName">
                                        Name <span class="form__error">*</span>
                                    </label>
                                    <span class="message__group" role="alert">
                                        <span data-message-invalid="BillingFullName" class="message__invalid">Please enter a full name.</span>
                                        <span data-message-valid="BillingFullName" class="message__valid">Accepted.</span>
                                    </span>
                                </div>

                                <div class="form__field-label">
                                    <input
                                        type="email"
                                        name="Email"
                                        id="Email"
                                        placeholder=" "
                                        required
                                        pattern="^[^\s@]+@[^\s@]+\.[^\s@]+$"
                                        title="Primary contact email address"
                                        class="form__field" />
                                    <label
                                        class="message__label message__group"
                                        for="Email">
                                        Email <span class="form__error">*</span>
                                    </label>
                                    <span class="message__group" role="alert">
                                        <span data-message-invalid="Email" class="message__invalid">Please enter a valid email address.</span>
                                        <span data-message-valid="Email" class="message__valid">Accepted.</span>
                                    </span>
                                </div>

                                <div class="form__field-label">
                                    <input
                                        type="text"
                                        name="Company"
                                        id="Company"
                                        placeholder=" "
                                        required
                                        title="Business or organization name"
                                        class="form__field" />
                                    <label
                                        class="message__label message__group"
                                        for="Company">
                                        Company <span class="form__error">*</span>
                                    </label>
                                    <span class="message__group" role="alert">
                                        <span data-message-invalid="Company" class="message__invalid">Please enter a company name.</span>
                                        <span data-message-valid="Company" class="message__valid">Accepted.</span>
                                    </span>
                                </div>

                                <div class="form__field-label form__textarea-label">
                                    <textarea
                                        type="text"
                                        name="Description"
                                        id="Description"
                                        placeholder=" "
                                        required
                                        title="Write your message to us"
                                        class="form__field"></textarea>
                                    <label
                                        class="message__label message__group"
                                        for="Description">
                                        Description <span class="form__error">* </span>
                                    </label>
                                    <span class="message__group" role="alert">
                                        <span data-message-invalid="Description" class="message__invalid">Please enter a description.</span>
                                        <span data-message-valid="Description" class="message__valid">Accepted.</span>
                                    </span>
                                </div>

                                <div class="form__button">
                                    <button type="submit" id="acceptOfferBtn" name="acceptOfferBtn" class="button">
                                        <span>Submit</span>
                                    </button>
                                </div>
                            </div>
                        </fieldset>
                        <div class="flip__backside form__fieldset form__response response">
                            <div class="response__icon">
                                <div class="form__checkmark checkmark">
                                    <svg viewBox="0 0 52 52">
                                        <circle cx="26" cy="26" r="25"/>
                                        <path d="M14.1 27.2l7.1 7.2 16.7-16.8"/>
                                    </svg>
                                </div>
                            </div>
                            <div class="response__status">
                                <div class="response__progress">
                                    <div class="form__title">Submitting</div>
                                </div>
                                <div class="response__success">
                                    <div class="form__title">Success!</div>
                                    <div class="form__text">A team member from Ideavillage will reach out to you within the next day or two.</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
