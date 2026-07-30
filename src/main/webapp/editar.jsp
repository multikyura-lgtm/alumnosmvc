<%@ page contentType="text/html; charset=UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>

    <!DOCTYPE html>
    <html lang="es">

    <head>
      <meta charset="UTF-8">
      <title>Editar Alumno</title>

      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body class="bg-light">

      <div class="container mt-5">

        <div class="card shadow">

          <div class="card-header bg-info text-white">
            <h3 class="mb-0">✏️ Editar Alumno</h3>
          </div>

          <div class="card-body">

            <c:if test="${not empty alumno}">

              <form action="${pageContext.request.contextPath}/alumnos/editar" method="post">

                <input type="hidden" name="id" value="${alumno.id}">

                <div class="mb-3">
                  <label class="form-label">Nombre</label>
                  <input type="text" class="form-control" name="nombre" value="${alumno.nombre}" required>
                </div>

                <div class="mb-3">
                  <label class="form-label">Apellidos</label>
                  <input type="text" class="form-control" name="apellidos" value="${alumno.apellidos}" required>
                </div>

                <div class="mb-4">
                  <label class="form-label">Curso</label>
                  <input type="text" class="form-control" name="curso" value="${alumno.curso}" required>
                </div>

                <button type="submit" class="btn btn-primary">
                  💾 Guardar cambios
                </button>

                <a href="${pageContext.request.contextPath}/alumnos" class="btn btn-secondary">
                  ↩ Volver
                </a>

              </form>

            </c:if>

            <c:if test="${empty alumno}">

              <div class="alert alert-danger">
                No se encontró el alumno.
              </div>

            </c:if>

          </div>

        </div>

      </div>

    </body>

    </html>