<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title><g:layoutTitle default="CachiruloHub"/></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">
        
        <!--<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>-->
        <link href='http://fonts.googleapis.com/css?family=Scada:400,700' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" href="${resource(dir: 'css', file: 'public.css')}" type="text/css">
        <g:javascript library="jquery"/>
        <r:layoutResources />
        <g:layoutHead/>
        
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an outdated browser. <a href="http://browsehappy.com/">Upgrade your browser today</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to better experience this site.</p>
        <![endif]-->
        <div class="main-container table">
            <div class="main table-row clearfix">
                <aside class="main-left table-cell">
                    <header>
                        <h1 class="title">
                            <g:link controller="home"><img src="${resource(dir: 'images', file: 'logo.png')}" alt="CachiruloHub"></g:link>
                        </h1>

                        <ul id="menu">
                            <li>
                                <label for="title"><g:message code="hub.layout.public.language"/></label>
                                <select id="lang" name="lang">                      
                                    <option value="en" <g:langCode code='en'>selected</g:langCode>><g:message code="hub.layout.public.English"/></option>
                                    <option value="es" <g:langCode code='es'>selected</g:langCode>><g:message code="hub.layout.public.Spanish"/></option>                           
                                </select>           
                            </li>
                            <g:if test="${!session.company}">
                              <li><g:remoteLink controller="register" update="content" onComplete="\$('#panel').show();"><g:message code="hub.layout.public.register"/></g:remoteLink></li>
                              <li><g:remoteLink controller="login" update="content" onComplete="\$('#panel').show();"><g:message code="hub.layout.public.login"/></g:remoteLink></li>
                            </g:if>
                            <g:else>
                              <li><g:remoteLink controller="company" action="edit" update="content" onComplete="\$('#panel').show();"><g:message code="hub.layout.public.profile"/></g:remoteLink></li>
                              <li><g:link controller="login" action="logout"><g:message code="hub.layout.public.logout"/></g:link></li>
                            </g:else>
                        </ul>

                        <div class="clearfix"></div>

                        <g:if test="${flash.message}">
                          <div class="message" role="status">${flash.message}</div>
                        </g:if>
                    </header>
                    <section>
                        <form id="searchForm">
                            <g:textField name="text" class="text" id="searchText" placeholder="${message(code:'hub.layout.public.search')}" />
                            <input type="submit" class="submit" value="" >
                        </form>
                        <div class="widget widget_tags">
                            <h3><g:message code="hub.template.tags.tags"/></h3>
                            <div class="widget_content">
                                <g:render template="/home/tags"/>
                            </div>
                        </div>
                        <div class="widget widget_empresas">
                          <h3><g:message code="hub.layout.public.companies"/></h3>
                          <div class="widget_content">
                            <ul id="tableBody">
                            </ul>
                          </div>
                        </div>
                    </section>
                    <!--div class="ocultar">
                        <a href="">Ocultar mapa y ver listado completo</a>
                    </div-->
                    <footer id="footer">
                        CachiruloHub 2012 | <g:remoteLink controller="home" action="about" update="content_containter" onComplete="\$('#panel').show();">Cachirulistas power</g:remoteLink> | <a href="http://twitter.com/search?q=%23jodopetaca" target="_blank">#jodopetaca</a>
                    </footer>
                </aside><!-- .main-left -->

                <div class="main-right table-cell">
                    <div class="map_container" id="content_containter">
                        <g:layoutBody/>
                    </div>
                </div><!-- .main-right -->

            </div> <!-- #main -->
        </div> <!-- #main-container -->
        <input type="hidden" id="baseUrl" value="<g:resource dir="/"/>"/>
        <script>
            var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
            (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
            g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
            s.parentNode.insertBefore(g,s)}(document,'script'));
        </script>
        
        <g:javascript src="publicLayout.js"/>
        <g:javascript library="application"/>        
        <r:layoutResources />
    </body>
</html>
