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
        
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'public.css')}" type="text/css">
        <g:layoutHead/>
        <r:layoutResources />
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an outdated browser. <a href="http://browsehappy.com/">Upgrade your browser today</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to better experience this site.</p>
        <![endif]-->
        <div class="main-container table">
            <div class="main table-row clearfix">
                <aside class="main-left table-cell">
                        <header>
                <h1 class="title">CachiruloHub</h1>
                <ul id="menu">
                <g:if test="${!session.company}">
                  <li><g:link controller="register">Registrar una empresa</g:link></li>
                  <li><g:link controller="login">Entrar</g:link></li>
                </g:if>
                <g:else>
                  <li><g:link controller="company" action="edit">Editar perfil</g:link></li>
                  <li><g:link controller="login" action="logout">Salir</g:link></li>
                </g:else>
                </ul>
                <g:if test="${flash.message}">
                  <div class="message" role="status">${flash.message}</div>
                </g:if>
                <h2 class="description">Tecnología de Aragón</h2>
                        </header>
                        <section>
                          <form id="searchForm" >
                            <g:textField name="text" id="searchText"/>
                            <input type="submit" value="Buscar!" >
                          </form>
                          <div class="widget">
                            <g:render template="/home/tags"/>
                            
                          </div>
                <div class="widget">
                  <h3>Empresas</h3>
                  <ul id="tableBody">
                  </ul>
                </div>
                        </section>
                        <!--div class="ocultar">
                            <a href="">Ocultar mapa y ver listado completo</a>
                        </div-->
                        <footer>
                            CachiruloHub 2012 - <g:link controller="home" action="about">Cachirulistas power</g:link> - #jodopetaca
                        </footer>
                </aside><!-- .main-left -->

                <div class="main-right table-cell">
                    <g:layoutBody/>
                </div><!-- .main-right -->

            </div> <!-- #main -->
        </div> <!-- #main-container -->


        <script>
            var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
            (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
            g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
            s.parentNode.insertBefore(g,s)}(document,'script'));
        </script>
        <g:javascript library="application"/>
        <r:layoutResources />
    </body>
</html>