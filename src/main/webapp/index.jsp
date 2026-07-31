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

      <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">

        <div class="container">

          <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/">

            🎓 Gestión de Alumnos

          </a>

          <div class="d-flex align-items-center">

            <span class="text-white me-3 fw-semibold">
              👤 ${sessionScope.usuario}
            </span>

            <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/logout">

              🚪 Salir

            </a>

          </div>

        </div>

      </nav>

      <div class="container mt-4">

        <div class="card shadow">



          <div class="card-body">

            <h3 class="mb-3">
              ¡Bienvenido, ${sessionScope.usuario}! 👋
            </h3>

            <p class="text-muted">
              Aplicación web desarrollada con Java, Jakarta Servlet, JSP, JSTL,
              SQLite, Maven y Bootstrap 5.
            </p>

            <div class="row mt-4">

              <div class="col-md-6 mb-3">

                <div class="card border-success h-100 shadow-sm">

                  <div class="card-body text-center">

                    <h1>📋</h1>

                    <h4>Listado de alumnos</h4>

                    <p class="text-muted">
                      Ver, editar, eliminar y asignar notas.
                    </p>

                    <a class="btn btn-success w-100" href="${pageContext.request.contextPath}/alumnos">

                      Abrir

                    </a>

                  </div>

                </div>

              </div>

              <div class="col-md-6 mb-3">

                <div class="card border-primary h-100 shadow-sm">

                  <div class="card-body text-center">

                    <h1>➕</h1>

                    <h4>Nuevo alumno</h4>

                    <p class="text-muted">
                      Registrar un nuevo alumno en la base de datos.
                    </p>

                    <a class="btn btn-primary w-100" href="${pageContext.request.contextPath}/alumnos/nuevo">

                      Crear

                    </a>

                  </div>

                </div>

              </div>

            </div>

          </div>
        </div>

      </div>

    </body>

    </html>