<%@ page contentType="text/html; charset=UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>

    <!DOCTYPE html>
    <html lang="es">

    <head>
      <meta charset="UTF-8">
      <title>Registro</title>

      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body class="bg-light">

      <div class="container mt-5">

        <div class="row justify-content-center">

          <div class="col-md-5">

            <div class="card shadow">

              <div class="card-header bg-success text-white">
                <h3 class="mb-0">📝 Registro de usuario</h3>
              </div>

              <div class="card-body">

                <c:if test="${not empty error}">
                  <div class="alert alert-danger">
                    ${error}
                  </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/registro" method="post">

                  <div class="mb-3">

                    <label class="form-label">
                      Usuario
                    </label>

                    <input class="form-control" name="usuario" value="${usuario}" required>

                  </div>

                  <div class="mb-3">

                    <label class="form-label">
                      Contraseña
                    </label>

                    <input type="password" class="form-control" id="password" name="password" required>

                  </div>

                  <div class="mb-3">

                    <label class="form-label">
                      Repetir contraseña
                    </label>

                    <input type="password" class="form-control" id="password2" name="password2" required>

                  </div>

                  <div class="form-check mb-3">

                    <input class="form-check-input" type="checkbox" id="mostrarPassword">

                    <label class="form-check-label" for="mostrarPassword">
                      Mostrar contraseñas
                    </label>

                  </div>

                  <button class="btn btn-success w-100">
                    Registrarse
                  </button>

                </form>

                <div class="text-center mt-3">

                  <a href="${pageContext.request.contextPath}/login">
                    Ya tengo una cuenta
                  </a>

                </div>

              </div>

            </div>

          </div>

        </div>

      </div>
      <script>

        document.getElementById("mostrarPassword").addEventListener("change", function () {

          const tipo = this.checked ? "text" : "password";

          document.getElementById("password").type = tipo;
          document.getElementById("password2").type = tipo;

        });

      </script>
    </body>

    </html>