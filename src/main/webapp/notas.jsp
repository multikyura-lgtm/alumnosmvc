<%@ page contentType="text/html; charset=UTF-8" %>
  <%@ page import="com.ejemplo.alumnos.model.Alumno" %>

    <% Alumno alumno=(Alumno) request.getAttribute("alumno"); %>

      <!DOCTYPE html>
      <html lang="es">

      <head>
        <meta charset="UTF-8">
        <title>Asignar Nota</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
      </head>

      <body class="bg-light">

        <div class="container mt-5">

          <div class="card shadow">

            <div class="card-header bg-warning">
              <h3 class="mb-0">⭐ Asignar Nota</h3>
            </div>

            <div class="card-body">

              <% if (alumno !=null) { %>

                <form action="<%=request.getContextPath()%>/alumnos/notas" method="post">

                  <input type="hidden" name="id" value="<%= alumno.getId() %>">

                  <div class="mb-3">
                    <label class="form-label">Alumno</label>
                    <input type="text" class="form-control"
                      value="<%= alumno.getNombre() %> <%= alumno.getApellidos() %>" readonly>
                  </div>

                  <div class="mb-3">
                    <label class="form-label">Curso</label>
                    <input type="text" class="form-control" value="<%= alumno.getCurso() %>" readonly>
                  </div>

                  <div class="mb-4">
                    <label class="form-label">Nota</label>

                    <input type="number" name="nota" min="0" max="10" step="0.1" class="form-control"
                      value="<%= alumno.getNota() == null ? "" : alumno.getNota() %>" required>
                  </div>

                  <button class="btn btn-warning" type="submit">
                    💾 Guardar Nota
                  </button>

                  <a class="btn btn-secondary" href="<%=request.getContextPath()%>/alumnos">
                    ↩ Volver
                  </a>

                </form>

                <% } else { %>

                  <div class="alert alert-danger">
                    No se encontró el alumno.
                  </div>

                  <a class="btn btn-secondary" href="<%=request.getContextPath()%>/alumnos">
                    Volver
                  </a>

                  <% } %>

            </div>

          </div>

        </div>

      </body>

      </html>