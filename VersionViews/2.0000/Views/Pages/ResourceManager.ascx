<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<%
    var v = 12;
    var url = "{0}?v={1}";
    
    var preload = ViewData["preload"] as bool? ?? false;
    var defer = ViewData["defer"] as bool? ?? false;
    var all = ViewData["all"] as bool? ?? true;

    var isIndex = DtmContext.PageCode == "Index";
    var isVentures = DtmContext.PageCode == "Become-A-Partner";
    var isWhoWeAre = DtmContext.PageCode == "Who-We-Are";

    var pagesThatRequirejQuery = new string[] { "Who-We-Are", "Become-A-Partner" };
    var requirejQuery = pagesThatRequirejQuery.Contains(DtmContext.PageCode);

    var pagesThatRequireVimeo = new string[] { "Index" };
    var requireVimeo = pagesThatRequireVimeo.Contains(DtmContext.PageCode);

    // inform browser to preload all critical resources ahead of schedule
    if (preload || all)
    {
        var images = new List<string> {
            "/images/2.0000/logo.jpg"
        };

        foreach (var image in images) {
            var resource = String.Format(url, image, v);
            %>
            <link rel="preload" href="<%= image %>" as="image">
            <%
        }

        // preload critical images
        if (isIndex)
        {
            %>
            <link rel="preload" href="/images/2.0000/video-placeholder.jpg" as="image" imagesrcset="/images/2.0000/video-placeholder_mobile.jpg 375w, /images/2.0000/video-placeholder.jpg 1920w" imagesizes="(max-width: 800px) 50px">
            <%
        }

        // preload critical stylesheets
        var styles = new List<string>
        {
            "/css/2.0000/dist/shell.rev-1.css"
        };

        if (isIndex)
        {
            styles.Add("/css/2.0000/dist/index.css");
        }

        if (isVentures) {
            styles.Add("/css/2.0000/dist/idv-ventures.css");
        }

        if (isWhoWeAre) {
            styles.Add("/css/2.0000/dist/who-we-are.css");
        }

        foreach (var style in styles)
        {
            var resource = String.Format(url, style, v);
            %>
            <link rel="preload" href="<%= resource %>" as="style">
            <%
        }

        // preload critical fonts
        var fonts = new List<string>
        {
            // museo-sans: 300
            "/fonts/museo-sans-300.woff2",
            // museo-sans: 500
            "/fonts/museo-sans-500.woff2",
            // museo-sans: 900
            "/fonts/museo-sans-900.woff2",
            // museo-sans: 100
            "/fonts/museo-sans-100.woff2"
        };

        foreach (var font in fonts)
        {
            %>
            <link rel="preload" href="<%= font %>" as="font" type="font/woff2" crossorigin="">
            <%
        }

        // preload critical scripts
        var scripts = new List<string>
        {

        };

        foreach (var script in scripts)
        {
            var resource = String.Format(url, script, v);
            %>
            <link rel="preload" href="<%= resource %>" as="script">
            <%
        }
    }

    // inform browser to request resources on document parse. dispatch as critical resources
    if (!preload && !defer || all)
    {
        // request critical stylesheets
        var styles = new List<string>
        {
            "/css/2.0000/dist/shell.rev-1.css"
        };

        if (isIndex)
        {
            styles.Add("/css/2.0000/dist/index.css");
        }

        if (isVentures) {
            styles.Add("/css/2.0000/dist/idv-ventures.css");
        }

        if (isWhoWeAre) {
            styles.Add("/css/2.0000/dist/who-we-are.css");
            styles.Add("/Shared/js/fancybox/3.5.7/jquery.fancybox.min.css");
        }

        foreach (var style in styles)
        {
            var resource = String.Format(url, style, v);
            %>
            <link rel="stylesheet" href="<%= resource %>">
            <%
        }


        // request critical scripts. inform browser to defer script execution to document parse completion
        var scripts = new List<string>
        {
            
        };

        foreach (var script in scripts)
        {
            var resource = String.Format(url, script, v);
            %>
            <script src="<%= resource %>"></script>
            <%
        }
    }

    // inform browser to request resources on document parse. dispatch as deferred resources
    if (!preload && defer || all)
    {
        // request deferred stylesheets
        var styles = new List<string> {

        };

        foreach (var style in styles)
        {
            var resource = String.Format(url, style, v);
            %>
            <link rel="stylesheet" href="<%= resource %>" media="print" onload="this.media='all'; this.onload=null;">
            <noscript>
                <link rel="stylesheet" href="<%= resource %>">
            </noscript>
            <%
        }


        // request deferred scripts. inform browser to defer script execution to document parse completion
        var scripts = new List<string>
        {
            "/js/2.0000/app.js",
            "/js/2.0000/observer.js",
            "/js/2.0000/lazy.js",
            "/js/2.0000/page.js",
            "/js/slide/slide.js",
            "/js/2.0000/carousel.js",
            "/Shared/js/ModalMaster/modal.js"
        };

        if (requireVimeo)
        {
            scripts.Add("/js/2.0000/vimeo.js");
        }

        if (isWhoWeAre) {
            scripts.Add("/Shared/js/fancybox/3.5.7/jquery.fancybox.min.js");
        }

        foreach (var script in scripts)
        {
            var resource = String.Format(url, script, v);
            %>
            <script defer src="<%= resource %>"></script>
            <%
        }

        if (isVentures)
        {
            %>
            <script id="formJs" defer src="/js/2.0000/form.js" data-context='{ "page" : "<%= DtmContext.PageCode %><%= DtmContext.ApplicationExtension %>", "covid" : "<%= DtmContext.VersionId %>" }'></script>
            <%
        }
    }
%>
