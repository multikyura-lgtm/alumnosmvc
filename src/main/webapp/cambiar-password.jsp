<%@ page contentType="text/html; charset=UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>

    <!DOCTYPE html>
    <html lang="es">

    <head>
      <meta charset="UTF-8">
      <title>Cambiar contraseña</title>

      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body class="bg-light">

      <div class="container mt-5">

        <div class="row justify-content-center">

          <div class="col-md-6">

            <div class="card shadow">

              <div class="card-header bg-warning">
                <h3 class="mb-0">🔑 Cambiar contraseña</h3>
              </div>

              <div class="card-body">

                <c:if test="${not empty error}">
                  <div class="alert alert-danger">
                    ${error}
                  </div>
                </c:if>

                <c:if test="${not empty mensaje}">
                  <div class="alert alert-success">
                    ${mensaje}
                  </div>
                </c:if>

                <form method="post" action="${pageContext.request.contextPath}/cambiar-password">

                  <div class="mb-3">

                    <label class="form-label">
                      Contraseña actual
                    </label>

                    <input type="password" id="actual" class="form-control" name="actual" required>
                  </div>

                  <div class="mb-3">

                    <label class="form-label">
                      Nueva contraseña
                    </label>

                    <input type="password" id="nueva" class="form-control" name="nueva" required>

                  </div>

                  <div class="mb-3">

                    <label class="form-label">
                      Repetir contraseña
                    </label>
                    <input type="password" id="repetir" class="form-control" name="repetir" required>

                  </div>

                  <div class="form-check mb-3">

                    <input class="form-check-input" type="checkbox" id="mostrar">

                    <label class="form-check-label" for="mostrar">

                      👁 Mostrar contraseñas

                    </label>

                  </div>

                  <a href="${pageContext.request.contextPath}/" class="btn btn-secondary w-100 mt-2">
                  
                    ← Volver
                  
                  </a>
                  
                  <button class="btn btn-warning w-100">

                    Cambiar contraseña

                  </button>

                </form>

              </div>

            </div>

          </div>

        </div>

      </div>
      <script>

        const mostrar = document.getElementById("mostrar");

        mostrar.addEventListener("change", function () {

          const tipo = this.checked ? "text" : "password";

          document.getElementById("actual").type = tipo;
          document.getElementById("nueva").type = tipo;
          document.getElementById("repetir").type = tipo;

        });

      </script>
    </body>

    </html>