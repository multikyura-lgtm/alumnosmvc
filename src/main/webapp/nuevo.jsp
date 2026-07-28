<%@ page contentType="text/html; charset=UTF-8" %>

  <!DOCTYPE html>
  <html lang="es">

  <head>
    <meta charset="UTF-8">
    <title>Nuevo Alumno</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  </head>

  <body class="bg-light">

    <div class="container mt-5">

      <div class="card shadow">

        <div class="card-header bg-success text-white">
          <h3 class="mb-0">➕ Nuevo Alumno</h3>
        </div>

        <div class="card-body">
          <% if (request.getAttribute("error") !=null) { %>

            <div class="alert alert-danger">
              <%= request.getAttribute("error") %>
            </div>

            <% } %>
              <form action="<%=request.getContextPath()%>/alumnos" method="post">

                <div class="mb-3">
                  <label class="form-label">Nombre</label>
                  <input type="text" name="nombre" class="form-control" placeholder="Introduzca el nombre"
                    value="<%= request.getAttribute(" nombre") !=null ? request.getAttribute("nombre") : "" %>"
                  required>
                </div>

                <div class="mb-3">
                  <label class="form-label">Apellidos</label>
                  <input type="text" name="apellidos" class="form-control" placeholder="Introduzca los apellidos"
                    value="<%= request.getAttribute(" apellidos") !=null ? request.getAttribute("apellidos") : "" %>"
                  required>
                </div>

                <div class="mb-4">
                  <label class="form-label">Curso</label>
                  <input type="text" name="curso" class="form-control" placeholder="Ejemplo: Java"
                    value="<%= request.getAttribute(" curso") !=null ? request.getAttribute("curso") : "" %>"
                  required>
                </div>

                <button class="btn btn-success" type="submit">
                  💾 Guardar
                </button>

                <a class="btn btn-secondary" href="<%=request.getContextPath()%>/alumnos">
                  ↩ Volver
                </a>

              </form>

        </div>

      </div>

    </div>

  </body>

  </html>