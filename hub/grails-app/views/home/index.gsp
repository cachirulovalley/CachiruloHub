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
  </body>
</html>
