<html>
  <head>
    <meta name="layout" content="public">
    <title>Cachirulo Hub</title>
    <g:javascript library="jquery"/>
	  <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <g:javascript src="home.js"/>
  </head>
  <body>
<div class="main-container table">
            <div class="main table-row clearfix">
        
                <aside class="main-left table-cell">
                    <header>
            <h1 class="title">CachiruloHub</h1>
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
                        <g:render template="tags"/>
                        
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
                        CachiruloHub 2012 - Cachirulistas power - #jodopetaca
                    </footer>
                </aside><!-- .main-left -->
                <div class="main-right table-cell">

                  <div class="map" id="map_canvas"></div>
                  <div id="menu">
                    <ul>
                    <g:if test="${!session.company}">
                      <li><g:link controller="register">Registrar una empresa</g:link></li>
                      <li><g:link controller="login">Entrar</g:link></li>
                    </g:if>
                    <g:else>
                      <li><g:link controller="company" action="edit">Editar perfil</g:link></li>
                      <li><g:link controller="login" action="logout">Salir</g:link></li>
                    </g:else>
        
                    </ul>
                  </div>
        </div><!-- .main-right -->
            </div> <!-- #main -->
        </div> <!-- #main-container -->

  	

  </body>
</html>
