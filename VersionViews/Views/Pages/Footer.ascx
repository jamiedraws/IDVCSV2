<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

    <% Html.RenderSnippet("FOOTER-FRONTEND"); %>

    <%-- // @JS-FOOTER --%>
    <% switch ( DtmContext.Page.IsStartPageType ) { %>

        <% case false: %>


            <% break; %>
        <% default: %>

            <% Html.RenderPartial("Scripts"); %>
            <% Html.RenderSnippet("ORDERFORMSCRIPT"); %>
                        <script>
                                function submitForm(name, email, company, description) {
                                        let url = "Become-A-Partner.dtm";
                                        $.post(url, {
                                            BillingFullName: name,
                                            Email: email,
                                            Company: company,
                                            Description: description,
                                            acceptOffer: 'acceptOffer',
                                            RemoteType: 'ProductLead',
                                            CardType: 'none'
                                        }, function (data) {
                                                $(".vse").empty();
                                                $("#successMessage").fadeIn().fadeOut(5000);
                                                $('#BillingFullName').val("");
                                                $('#Email').val("");
                                                $('#Company').val("");
                                                $('#Description').val("");
                                                $.post(url, { createOrder: 'createOrder', RemoteType: 'Lead' }, function (data) {
                                                        $.get('/ActivateVisitor?covid=<%=DtmContext.VersionId%>', function (data) {
                                                        });
                                                });
                                        });
                                    }
                        </script>

            <% break; %>

    <% } %>

    <% if (!Model.IsMobile) { %>
    <script type="text/javascript" src="/js/header.js?cb=3" defer async></script>
    <% } %>

    <% if (Model.IsMobile && DtmContext.PageCode == "Index") { %>
    <%--
    <script src="https://player.vimeo.com/api/player.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lazysizes/4.1.5/lazysizes-umd.min.js"></script> --%>
    <script>
        console.log('homepage / mobile');
        /*
        const iframe = document.querySelector("iframe");

        function handleLazyLoad() {
          if (iframe.classList.contains("lazyload")) {
            const storeSRC = iframe.dataset.src;

            iframe.addEventListener("lazybeforeunveil", () => {
              delete iframe.dataset.src;
              iframe.src = storeSRC;
              initPlayer();
            });
          }
        }
        */

        function callSlide(slideNo) {
            if (slideNo != 1) {
                document.getElementById('cp'+(slideNo-1)).classList.remove('caption--active');
            }
            if (slideNo == 6) {
                initiateSlides();
            } else {
            document.getElementById('cp'+slideNo).classList.add('caption--active');
            }
        }

        function initiateSlides() {
            callSlide(1);
            /*setTimeout(function() { callSlide(2); }, 5000);
            setTimeout(function() { callSlide(3); }, 11000);
            setTimeout(function() { callSlide(4); }, 17500);
            setTimeout(function() { callSlide(5); }, 23700);
            setTimeout(function() { callSlide(6); }, 30000);*/
            setTimeout(function() { callSlide(2); }, 7000);
            setTimeout(function() { callSlide(3); }, 14000);
            setTimeout(function() { callSlide(4); }, 21000);
            setTimeout(function() { callSlide(5); }, 28000);
            setTimeout(function() { callSlide(6); }, 35000);
        }

        /*
        function initPlayer() {
          const player = new Vimeo.Player(iframe);
          player.on("play", function() {
            //console.log("playing the video!");
            initiateSlides();
          });
        }
        */

        //handleLazyLoad();

        /* 2 different ways to handle the mobile "video" either caption--slides or caption--match, right now this is setup for slides rather than matching the video */
        initiateSlides();

    </script>
    <% } %>

    <%= Model.FrameworkVersion %>

    <div class="l-controls">
        <% Html.RenderSiteControls(SiteControlLocation.ContentTop); %>
        <% Html.RenderSiteControls(SiteControlLocation.ContentBottom); %>
        <% Html.RenderSiteControls(SiteControlLocation.PageBottom); %>
    </div>

