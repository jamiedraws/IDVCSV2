<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<style>
    .caption {
        color: white;
        margin: 0;
        position: absolute;
        width: 100%; height: 100%;
        left: 0; right: 0; top: 0;
    }
    .caption strong {
        font-weight: 900;
    }
    .caption__item {
        opacity: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        position: absolute;
    }
    .caption--match .caption__item {
        width: 100%;
        height: 100%;
    }
    .caption-slide--right {
        flex-direction: row-reverse;
    }
    .caption-slide__image {
        margin: 0 0.75em 0 0;
        max-width: 30%;
    }
    .caption-slide__text {
        padding: 0 0 0 0.75em;
        border-left: 0.3rem solid white;
    }
    .caption-slide--right .caption-slide__image {
        margin: 0 0 0 0.75em;
    }
    .caption-slide--right .caption-slide__text {
        border-left: none;
        border-right: 0.3rem solid white;
        text-align: right;
        padding: 0 0.75em 0 0;
    }
    .caption-slide__text span,
    .caption-slide__text strong {
        display: block;
    }
    .caption-slide__text strong {
        font-size: 2em;
    }
    .dtm__in--mv .caption {
        font-size: 1.4rem;
    }
    @media all and (min-width: 481px) {
        .dtm__in--mv .caption {
            font-size: 2.5rem;
        }
    }
    .dtm__in--mv .caption-slide__text strong {
        font-size: 1.3em;
    }
    .dtm__in--mv .caption__item {
        padding: 0.25rem;
    }
    .caption--match .caption-slide__image {
        max-width: none;
        position: absolute;
    }
    .caption--match .caption-slide__text  {
        position: absolute;
    }
    .caption--match .caption__item.caption--active {
        opacity: 1;
        transition: opacity 1s;
    }
    .caption--match .caption--active .caption-slide__image {
        transform: translateX(2%);
        transition: transform 1s;
    }
    .caption--match .caption--active .caption-slide__text {
        transform: translateX(4%);
        transition: transform 1s;
    }
    .caption--match #cp1 .caption-slide__image {
        width: 40%;
        left: 2%;
        bottom: 46%;
    }
    .caption--match #cp1 .caption-slide__text {
        left: 1%;
        bottom: 15%;
    }
    .caption--match #cp2 .caption-slide__image {
        width: 30%;
        bottom: 6%;
        right: 5%;
    }
    .caption--match #cp2 .caption-slide__text {
        top: 10%;
        right: 8%;
    }
    .caption--match #cp3 .caption-slide__image {
        width: 34%;
        right: 3%;
        bottom: 5%;
    }
    .caption--match #cp3 .caption-slide__text {
        left: 1%;
        top: 20%;
        /* font is slightly more than others */
        font-size: 0.9em;
    }
    .caption--match #cp4 .caption-slide__image {
        left: 1%;
        width: 31%;
        top: 5%;
    }
    .caption--match #cp4 .caption-slide__text {
        bottom: 15%;
        right: 6%;
    }
    .caption--match #cp5 .caption-slide__image {
        width: 43%;
        bottom: 4%;
        right: 4%;
    }
    .caption--match #cp5 .caption-slide__text {
        top: 8%;
        right: 8%;
    }
    .caption--slides .caption__item {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 0 auto;
        justify-content: flex-end;
        height: 100%;
        width: 100%;
        padding: 0 1rem 2rem;
    }

    .caption--slides .caption--active {
        opacity: 1;
        transition: opacity 1s;
    }

    .caption--slides .caption-slide__text {
        text-align: center;
        border: none;
        padding: 0;
    }

    .caption--slides .caption-slide__image {
        max-width: 40%;
        margin:  0 auto 1rem;
    }

    .caption--slides .caption__item {
        background-color: black;
        background-position: center center;
        background-size: auto 120%;
    }

    .caption--slides #cp1 {
        background-image: url(/images/frame--ft.jpg);
    }
    .caption--slides #cp2 {
        background-image: url(/images/frame--fthead.jpg);
    }
    .caption--slides #cp3 {
        background-image: url(/images/frame--cf.jpg);
    }
    .caption--slides #cp4 {
        background-image: url(/images/frame--mt.jpg);
    }
    .caption--slides #cp5 {
        background-image: url(/images/frame--joel.jpg);
    }
</style>

<div class="caption caption--slides">
    <div id="cp1" class="caption__item caption-slide caption-slide--ft">
        <div class="caption-slide__image">
            <img src="/images/logo--ft.png" alt="Finishing Touch Flawless&reg;">
        </div>
        <div class="caption-slide__text">
            <span>Our team is driven by</span>
            <strong>passion and excellence</strong>
            <span>to develop brands that become true category leaders</span>
        </div>
    </div>
    <div id="cp2" class="caption__item caption-slide caption-slide--ft">
        <div class="caption-slide__image">
            <img src="/images/logo--ft.png" alt="Finishing Touch Flawless&reg;">
        </div>
        <div class="caption-slide__text">
            <span>We are passionate about</span>
            <span>developing, launching, and</span>
            <strong>amplifying consumer brands</strong>
        </div>
    </div>
    <div id="cp3" class="caption__item caption-slide caption-slide--right caption-slide--cf">
        <div class="caption-slide__image">
            <img src="/images/logo--cf.png" alt="CopperFit&reg;">
        </div>
        <div class="caption-slide__text">
            <span>We fuse innovative market ideas with remarkable</span>
            <strong>new products that deliver</strong>
            <span>on their promise to the consumer</span>
        </div>
    </div>
    <div id="cp4" class="caption__item caption-slide caption-slide--right caption-slide--mt">
        <div class="caption-slide__image">
            <img src="/images/logo--mt.png" alt="Micro Touch">
        </div>
        <div class="caption-slide__text">
            <span>As a partner for emerging brands or</span>
            <span>inventors with category disrupting ideas</span>
            <strong>we can accelerate your success</strong>
        </div>
    </div>
    <div id="cp5" class="caption__item caption-slide caption-slide--right caption-slide--joel">
        <div class="caption-slide__image">
            <img src="/images/logo--jo.png" alt="Joel Osteen">
        </div>
        <div class="caption-slide__text">
            <span>With a proven approach to positively impact</span>
            <span>the consumer, we drive growth and</span>
            <strong>catapult brands to success</strong>
        </div>
    </div>
</div>
