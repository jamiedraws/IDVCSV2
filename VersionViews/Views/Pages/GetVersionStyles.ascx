<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>

<link rel="stylesheet" href="https://use.typekit.net/aei0wdm.css">
<% Html.RenderPartial("CSS.Module.ARP", Model); %>
<link rel="stylesheet" href="/css/style.css?cb=20">
<!-- style block head should just serve for overrides and quick fixes -->
<% Html.RenderSnippet("STYLE-BLOCK-HEAD"); %>

<style>
/* styling component for quad layout in bottom section */
.quad {
    display: block;
    width: 430px;
    height: 430px;
    background: #464646;
    margin: 0 auto;
}
.quad__item {
    width: 213px;
    height: 213px;
    border: 1px solid white;
    margin: 0 -1px -1px 0;
    padding: 0;
    display: inline-block;
    vertical-align: top;
    position: relative;
    overflow: hidden;
}
.quad__item iframe {
    position: absolute;
    width: 213px;
    height: 426px;
    top: 0; bottom: 0;
    margin: auto;
}

@media (max-width: 900px) {
    .catd__img {
        margin: 2rem auto;
    }

    .quad {
        width: 340px;
        height: 340px;
    }

    .quad__item {
        width: 168px;
        height: 168px;
    }

    .quad__item iframe {
        width: 168px;
        height: 320px;
    }
}
</style>

