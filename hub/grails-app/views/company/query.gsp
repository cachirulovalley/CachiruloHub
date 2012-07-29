<html>
	<head>
		<meta name="layout" content="main">
		<title>Search</title>
	</head>
	<body>
    <table>
      <thead>
        <tr>
          <td>Nombre</td>
          <td>Descripción</td>
        </tr>
      </thead>
      <tbody>
        <g:each in="${companyInstanceList}" var="companyInstance">
          <tr>
            <td><g:link action="show" id="${companyInstance.id}">${companyInstance.name}</g:link></td>
            <td>${companyInstance.description}</td
          </tr>
        </g:each>
      </tbody>
    </table>
	</body>
</html>
