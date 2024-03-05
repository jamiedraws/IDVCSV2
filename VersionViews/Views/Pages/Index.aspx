<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%-- Html.RenderSnippet("RESPONSIVE-INDEX"); --%>

<div id="hero" class="hero">
    <% Html.RenderPartial("Video"); %>
</div><!-- end .hero -->

<div class="brands">
    <h2 class="brands__title brands__title--border">
        We transform <strong>visionary ideas</strong> into <strong>brands</strong>
    </h2>
    <div class="brands__group">
        <div><img src="/images/product--copper-fit.png" alt="Copper Fit"></div>
        <div><img src="/images/product--flawless.png" alt="Finishing Touch Flawless"></div>
        <div><img src="/images/product--microtouch.png" alt="MicroTouch"></div>
    </div>
    <a href="/Who-We-Are" class="btn brands__btn">
        VIEW MORE PRODUCTS
    </a>
</div>


<div class="catd">
    <h2 class="catd__title catd__title--border">
        <div class="line"></div>
        We Are Category Disrupters
        <div class="line"></div>
    </h2>
    <div class="catd__group">
        <div class="catd__text">
            <p>We change previously well-established consumer behaviors with game-changing concepts. We <strong>| incubate and accelerate |</strong> high-potential products and brands. We optimize the vision of the brand, leveraging our broad capabilities and vast capital to help scale faster and more efficiently.</p>
            <img src="/images/logo--white.png" alt="IdeaVillage">
            <div class="clearfix"></div>
        </div>
        <div class="catd__img">
            <div class="quad">
                <div class="quad__item"><iframe src="https://player.vimeo.com/video/495483901?background=1&autopause=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div><!--
                --><div class="quad__item"><iframe src="https://player.vimeo.com/video/495483281?background=1&autopause=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div><!--
                --><div class="quad__item"><iframe src="https://player.vimeo.com/video/495483780?background=1&autopause=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div><!--
                --><div class="quad__item"><iframe src="https://player.vimeo.com/video/495483480?background=1&autopause=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div>

            </div>
        </div>
    </div>
</div>

</asp:Content>

