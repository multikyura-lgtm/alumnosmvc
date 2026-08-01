<%@ page contentType="text/html; charset=UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>

    <!DOCTYPE html>
    <html lang="es">

    <head>
      <meta charset="UTF-8">
      <title>Iniciar sesión</title>

      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body class="bg-light">

      <div class="container mt-5">

        <div class="row justify-content-center">

          <div class="col-md-5">

            <div class="card shadow">

              <div class="card-header bg-primary text-white">
                <h3 class="mb-0 text-center">
                  🔐 Iniciar sesión
                </h3>
              </div>

              <div class="card-body">

                <c:if test="${not empty mensaje}">
                  <div class="alert alert-success">
                    ${mensaje}
                  </div>
                </c:if>
                
                <c:if test="${not empty error}">
                  <div class="alert alert-danger">
                    ${error}
                  </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/login" method="post">

                  <div class="mb-3">
                    <label class="form-label">Usuario</label>

                    <input type="text" class="form-control" name="usuario" required>
                  </div>

                  <div class="mb-4">
                    <label class="form-label">Contraseña</label>

                    <input type="password" class="form-control" name="password" required>
                  </div>

                  <button type="submit" class="btn btn-primary w-100">

                    Entrar

                  </button>

                </form>

              </div>

            </div>

          </div>

        </div>

      </div>

    </body>

    </html>