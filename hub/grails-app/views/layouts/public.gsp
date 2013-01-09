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
        <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
        <g:javascript src="markerclusterer.js" />
        <g:javascript src="home.js"/>
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
                            <li><g:link controller="home"><g:message code="hub.layout.public.map"/></g:link></li>
                            <g:if test="${!session.company}">
                              <li><g:remoteLink controller="register" update="panelContent" onComplete="showPanel(true);if(supports_history_api()){history.pushState(null, null, '${createLink(controller:'register')}');}"><g:message code="hub.layout.public.register"/></g:remoteLink></li>
                              <li><g:remoteLink controller="login" update="panelContent" onComplete="showPanel(true);if(supports_history_api()){history.pushState(null, null, '${createLink(controller:'login')}');}"><g:message code="hub.layout.public.login"/></g:remoteLink></li>
                            </g:if>
                            <g:else>
                              <li><g:remoteLink controller="company" action="edit" update="panelContent" onComplete="showPanel(true);if(supports_history_api()){history.pushState(null, null, '${createLink(controller:'company', action:'edit')}');}"><g:message code="hub.layout.public.profile"/></g:remoteLink></li>
                              <li><g:link controller="login" action="logout"><g:message code="hub.layout.public.logout"/></g:link></li>
                            </g:else>
                        </ul>

                        <div class="clearfix"></div>

                        <g:if test="${flash.message}">
                          <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <g:if test="${session.company && !session.company.enabled}">
                          <div class="message" role="status">Debes activar tu cuenta, te hemos mandado un email a ${session.company.email} con las instrucciones</div>
                        </g:if>
                        <g:if test="${company?.hasErrors()}">
                            <div class="message" role="status">
                                <g:eachError bean="${company}" var="err">
                                <g:message error="${err}" />
                                </g:eachError>
                            </div>
                        </g:if>
                        <g:if test="${companyInstance?.hasErrors()}">
                            <div class="message" role="status">
                                <g:eachError bean="${companyInstance}" var="err">
                                <g:message error="${err}" />
                                </g:eachError>
                            </div>
                        </g:if>

                    </header>
                    <section>
                        <div class="widget widget_empresas">
                          <h3><g:message code="hub.layout.public.companies"/></h3>
                          <div class="widget_content">
                            <ul id="tableBody">
                                <g:companies/>
                            </ul>
                          </div>
                        </div>
                        <form id="searchForm">
                            <g:textField name="text" class="text" id="searchText" placeholder="${message(code:'hub.layout.public.search')}" />
                            <input type="submit" class="submit" value="" >
                        </form>
                        <div class="widget widget_tags">
                            <h3><g:message code="hub.template.tags.tags"/></h3>
                            <div class="widget_content">
                                <g:tags/>
                            </div>
                        </div>
                    </section>
                </aside><!-- .main-left -->

                <div class="main-right table-cell">
                    <div id="map_container" class="map_container">
                        <g:layoutBody/>
                        
                    </div>
                    <div class="panel" id="panel">
                        <a href="javascript:void(null)" onClick="hidePanel();" id="closeButton"><g:message code="hub.layout.public.back" default="Back"/></a>
                        <div class="panelContent" id="panelContent"></div>
                    </div>
                </div><!-- .main-right -->

                <div class="clearfix"></div>
            </div> <!-- #main -->
        </div> <!-- #main-container -->
        <footer id="footer">
            ${companiesCounter()} empresas, y subiendo<br/><br/>
            <div class="footer_content">
                    <label for="title"><g:message code="hub.layout.public.language"/></label>
                    <select id="lang" name="lang">                      
                        <option value="en" <g:langCode code='en'>selected</g:langCode>><g:message code="hub.layout.public.English"/></option>
                        <option value="es" <g:langCode code='es'>selected</g:langCode>><g:message code="hub.layout.public.Spanish"/></option>
                    </select> 
                </div>
                <div class="footer_text">
                     <g:message code="hub.layout.public.footer" default="CachiruloHub 2012 is an idea transformed into reality thanks to "/><g:remoteLink controller="home" action="about" class="power" update="panelContent" onComplete="showPanel(true);if(supports_history_api()){history.pushState(null, null, '${createLink(controller:'home', action:'about')}');}">Cachirulistas power</g:remoteLink> | <a target="_blank" class="power" href="https://github.com/danilat/CachiruloHub">Código liberado</a> bajo licencia MIT | <a href="http://twitter.com/search?q=%23jodopetaca" target="_blank">#jodopetaca</a>

                </div>
                <a class="cachirulo_logo" href="http://www.cachirulovalley.com">
                    <img src="${resource(dir: 'images', file: 'cachirulo_valley.png')}" alt="Logotipo de Cachirulo Valley" />
                </a>
                <div class="clearfix"></div>
            </div>
           
        </footer>
        <div id="lightbox" class="lightbox"></div>
        <input type="hidden" id="baseUrl" value="<g:resource dir="/"/>"/>
        <script>
            var _gaq=[['_setAccount','UA-21207924-2'],['_trackPageview']];
            (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
            g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
            s.parentNode.insertBefore(g,s)}(document,'script'));
        </script>
        
        <g:javascript src="publicLayout.js"/>
        <g:javascript library="application"/>        
        <r:layoutResources />
    </body>
</html>
