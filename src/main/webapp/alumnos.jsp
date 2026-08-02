<%@ page contentType="text/html; charset=UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
    <c:set var="buscarQuery" value="${param.buscar}" />

    <c:if test="${empty buscarQuery}">
      <c:set var="buscarQuery" value="" />
    </c:if>


    <!DOCTYPE html>
    <html lang="es">

    <head>
      <meta charset="UTF-8">
      <title>Listado de Alumnos</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body class="bg-light">

      <div class="container mt-5">
        <div class="card shadow">

          <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
            <h3 class="mb-0">🎓 Listado de Alumnos</h3>
            <div class="d-flex align-items-center gap-2">
            
              <span class="badge bg-light text-dark">
                👤 ${sessionScope.usuario}
              </span>
            
              <a class="btn btn-warning btn-sm" href="${pageContext.request.contextPath}/cambiar-password">
                🔑 Cambiar contraseña
              </a>
            
              <a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/alumnos/nuevo">
                ➕ Nuevo
              </a>
            
              <a class="btn btn-light btn-sm" href="${pageContext.request.contextPath}/">
                🏠 Inicio
              </a>
            
              <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/logout">
                🚪 Cerrar sesión
              </a>
            
            </div>
          </div>

          <div class="card-body">
            <c:if test="${not empty textoMensaje}">
              <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${textoMensaje}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
              </div>
            </c:if>


            <div class="row mb-4">

              <div class="col-md-6">
                <div class="card border-primary">
                  <div class="card-body text-center">
                    <h5>👨‍🎓 Total de alumnos</h5>
                    <h2>
                      ${totalAlumnos}
                    </h2>
                  </div>
                </div>
              </div>

              <div class="col-md-6">
                <div class="card border-success">
                  <div class="card-body text-center">
                    <h5>📈 Nota media</h5>
                    <h2>
                      <c:choose>
                        <c:when test="${empty notaMedia}">
                          -
                        </c:when>
                        <c:otherwise>
                        <fmt:formatNumber value="${notaMedia}" minFractionDigits="2" maxFractionDigits="2" />
                        </c:otherwise>
                      </c:choose>
                    </h2>
                  </div>
                </div>
              </div>

            </div>
            <form class="row g-3 mb-3" method="get" action="${pageContext.request.contextPath}/alumnos">
              <div class="col-md-5">
                <input type="text" class="form-control" name="buscar" value="${buscarQuery}"
                  placeholder="Buscar por nombre o apellidos">
              </div>
              <div class="col-md-3">
                <select class="form-select" name="ordenar">

                  <option value="id" ${ordenar=='id' ? 'selected="selected"' : '' }>
                    ID
                  </option>

                  <option value="nombre" ${ordenar=='nombre' ? 'selected="selected"' : '' }>
                    Nombre
                  </option>

                  <option value="apellidos" ${ordenar=='apellidos' ? 'selected="selected"' : '' }>
                    Apellidos
                  </option>

                  <option value="curso" ${ordenar=='curso' ? 'selected="selected"' : '' }>
                    Curso
                  </option>

                  <option value="nota" ${ordenar=='nota' ? 'selected="selected"' : '' }>
                    Nota
                  </option>

                </select>
              </div>

              <div class="col-md-2">
                <select class="form-select" name="direccion">

                  <option value="ASC" ${direccion=='ASC' ? 'selected="selected"' : '' }>
                    ↑ Asc
                  </option>

                  <option value="DESC" ${direccion=='DESC' ? 'selected="selected"' : '' }>
                    ↓ Desc
                  </option>

                </select>
              </div>

              <div class="col-md-2">
                <button class="btn btn-primary w-100" type="submit">
                  🔍 Buscar
                </button>
              </div>

            </form>

            <table class="table table-striped table-hover align-middle">
              <thead class="table-dark">
                <tr>
                  <th>№</th>
                  <th>Nombre</th>
                  <th>Apellidos</th>
                  <th>Curso</th>
                  <th>Nota</th>
                  <th>Acción</th>
                </tr>
              </thead>
              <tbody>
                <c:if test="${not empty alumnos}">
                  <c:forEach var="a" items="${alumnos}" varStatus="loop">
                    <tr>
                      <td>${loop.count}</td>
                      <td>${a.nombre}</td>
                      <td>${a.apellidos}</td>
                      <td>${a.curso}</td>

                      <td>
                        <c:choose>
                          <c:when test="${empty a.nota}">
                            <span class="badge bg-secondary">Sin nota</span>
                          </c:when>

                          <c:when test="${a.nota >= 5}">
                            <span class="badge bg-success">
                              ${a.nota}
                            </span>
                          </c:when>

                          <c:otherwise>
                            <span class="badge bg-danger">
                              ${a.nota}
                            </span>
                          </c:otherwise>
                        </c:choose>
                      </td>
                      <td>
                        <div class="d-flex gap-1">
                          <a class="btn btn-primary btn-sm"
                            href="${pageContext.request.contextPath}/alumnos/editar?id=${a.id}">
                            ✏ Editar
                          </a>

                          <a class="btn btn-warning btn-sm"
                            href="${pageContext.request.contextPath}/alumnos/notas?id=${a.id}">
                            ⭐ Nota
                          </a>

                          <form action="${pageContext.request.contextPath}/alumnos/eliminar" method="POST"
                            class="d-inline">

                            <input type="hidden" name="id" value="${a.id}">

                            <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal"
                              data-bs-target="#modalEliminar" data-id="${a.id}">
                              🗑 Eliminar
                            </button>

                          </form>
                        </div>
                      </td>
                    </tr>
                  </c:forEach>
                </c:if>

                <c:if test="${empty alumnos}">
                  <tr>
                    <td colspan="6" class="text-center">
                      <div class="alert alert-info mb-0">No hay alumnos registrados.</div>
                    </td>
                  </tr>
                </c:if>
              </tbody>
            </table>
          </div>

        </div>
      </div>
      <!-- Modal de confirmación -->
      <div class="modal fade" id="modalEliminar" tabindex="-1" aria-labelledby="modalEliminarLabel" aria-hidden="true">

        <div class="modal-dialog">

          <div class="modal-content">

            <div class="modal-header bg-danger text-white">
              <h5 class="modal-title" id="modalEliminarLabel">
                🗑 Eliminar alumno
              </h5>

              <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal">
              </button>
            </div>

            <div class="modal-body">
              ¿Está seguro de que desea eliminar este alumno?
            </div>


            <div class="modal-footer">

              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                Cancelar
              </button>

              <form id="formEliminar" action="${pageContext.request.contextPath}/alumnos/eliminar" method="post">

                <input type="hidden" id="idEliminar" name="id">

                <button type="submit" class="btn btn-danger">
                  🗑 Eliminar
                </button>

              </form>

            </div>

          </div>

        </div>

      </div>

      </div>

      <script>

        const modalEliminar = document.getElementById("modalEliminar");

        modalEliminar.addEventListener("show.bs.modal", function (event) {

          const boton = event.relatedTarget;

          const id = boton.getAttribute("data-id");

          document.getElementById("idEliminar").value = id;

        });

      </script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>