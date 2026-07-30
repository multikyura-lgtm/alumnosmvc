<%@ page contentType="text/html; charset=UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <!DOCTYPE html>
    <html lang="es">

    <head>
      <meta charset="UTF-8">
      <title>Gestión de Alumnos</title>

      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>

      <div class="container mt-5">

        <div class="card shadow">

          <div class="card-header bg-primary text-white">
            <h2 class="mb-0">🎓 Gestión de Alumnos</h2>
          </div>

          <div class="card-body">

            <p class="lead">
              Aplicación desarrollada con Java, Jakarta Servlet, JSP, Maven, SQLite y Bootstrap 5.
            </p>

            <div class="d-grid gap-3">

              <a class="btn btn-success btn-lg" href="${pageContext.request.contextPath}/alumnos">
                📋 Listado de alumnos
              </a>

              <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/alumnos/nuevo">
                ➕ Nuevo alumno
              </a>

            </div>

          </div>

        </div>

      </div>

    </body>

    </html>