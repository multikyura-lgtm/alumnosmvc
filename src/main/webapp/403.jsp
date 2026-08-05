<%@ page contentType="text/html; charset=UTF-8" %>
  <!DOCTYPE html>
  <html lang="es">

  <head>
    <meta charset="UTF-8">
    <title>403 - Acceso denegado</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  </head>

  <body class="bg-light">

    <div class="container mt-5">

      <div class="card shadow text-center">

        <div class="card-header bg-danger text-white">
          <h2>⛔ Acceso denegado</h2>
        </div>

        <div class="card-body">

          <h1 class="display-1">403</h1>

          <h4>No tiene permisos para acceder a esta página.</h4>

          <p class="text-muted">
            Si cree que se trata de un error, contacte con el administrador.
          </p>

          <a class="btn btn-primary" href="${pageContext.request.contextPath}/">
            🏠 Volver al inicio
          </a>

        </div>

      </div>

    </div>

  </body>

  </html>