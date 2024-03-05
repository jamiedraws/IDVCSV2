<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<% if (Model.IsMobile) { %>
<%-- <div id="video-animation" style="padding:56.25% 0 0 0;position:relative;"><iframe class="lazyload" data-src="https://player.vimeo.com/video/397281722?&background=1" style="position:absolute;top:0;left:0;width:100%;height:100%;" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""></iframe></div> --%>
<% Html.RenderPartial("Captions", Model); %>
<!-- temp edit until slides for video are ready -->
<% } else { %>
<div id="video-animation" style="padding:56.25% 0 0 0;position:relative;"><iframe src="https://player.vimeo.com/video/508176835?&background=1" style="position:absolute;top:0;left:0;width:100%;height:100%;" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""></iframe></div>
<% } %>

