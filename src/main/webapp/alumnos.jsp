<%@ page contentType="text/html; charset=UTF-8" %>
  <%@ page import="java.util.List" %>
    <%@ page import="com.ejemplo.alumnos.model.Alumno" %>

      <% List<Alumno> alumnos = (List<Alumno>) request.getAttribute("alumnos");
          String buscarQuery = request.getParameter("buscar");
          if (buscarQuery == null) {
          buscarQuery = "";
          }
          int numero = 1;
          %>
          <% String mensaje=request.getParameter("mensaje"); String textoMensaje=null; if ("creado".equals(mensaje)) {
            textoMensaje="✅ Alumno añadido correctamente." ; } else if ("editado".equals(mensaje)) {
            textoMensaje="✏️ Alumno actualizado correctamente." ; } else if ("eliminado".equals(mensaje)) {
            textoMensaje="🗑️ Alumno eliminado correctamente." ; } else if ("nota".equals(mensaje)) {
            textoMensaje="⭐ Nota actualizada correctamente." ; } %>

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
                    <div>
                      <a class="btn btn-success btn-sm" href="<%=request.getContextPath()%>/alumnos/nuevo">➕ Nuevo</a>
                      <a class="btn btn-light btn-sm" href="<%=request.getContextPath()%>/">
                        🏠 Inicio
                      </a>
                    </div>
                  </div>

                  <div class="card-body">
                    <% if (textoMensaje !=null) { %>
                      <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <%= textoMensaje %>
                          <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                      </div>
                      <% } %>


                        <div class="row mb-4">

                          <div class="col-md-6">
                            <div class="card border-primary">
                              <div class="card-body text-center">
                                <h5>👨‍🎓 Total de alumnos</h5>
                                <h2>
                                  <%= request.getAttribute("totalAlumnos") %>
                                </h2>
                              </div>
                            </div>
                          </div>

                          <div class="col-md-6">
                            <div class="card border-success">
                              <div class="card-body text-center">
                                <h5>📈 Nota media</h5>
                                <h2>
                                  <% Double media=(Double) request.getAttribute("notaMedia"); if (media==null) {
                                    out.print("-"); } else { out.print(String.format("%.2f", media)); } %>
                                </h2>
                              </div>
                            </div>
                          </div>

                        </div>
                        <form class="row g-3 mb-3" method="get" action="<%=request.getContextPath()%>/alumnos">

                          <div class="col-md-5">
                            <input type="text" class="form-control" name="buscar" value="<%= buscarQuery %>"
                              placeholder="Buscar por nombre o apellidos">
                          </div>

                          <div class="col-md-3">
                            <select class="form-select" name="ordenar">

                              <option value="id" <%="id" .equals(String.valueOf(request.getAttribute("ordenar")))
                                ? "selected" : "" %>>
                                ID
                              </option>

                              <option value="nombre" <%="nombre"
                                .equals(String.valueOf(request.getAttribute("ordenar"))) ? "selected" : "" %>>
                                Nombre
                              </option>

                              <option value="apellidos" <%="apellidos"
                                .equals(String.valueOf(request.getAttribute("ordenar"))) ? "selected" : "" %>>
                                Apellidos
                              </option>

                              <option value="curso" <%="curso" .equals(String.valueOf(request.getAttribute("ordenar")))
                                ? "selected" : "" %>>
                                Curso
                              </option>

                              <option value="nota" <%="nota" .equals(String.valueOf(request.getAttribute("ordenar")))
                                ? "selected" : "" %>>
                                Nota
                              </option>

                            </select>
                          </div>

                          <div class="col-md-2">
                            <select class="form-select" name="direccion">

                              <option value="ASC" <%="ASC" .equals(String.valueOf(request.getAttribute("direccion")))
                                ? "selected" : "" %>>
                                ↑ Asc
                              </option>

                              <option value="DESC" <%="DESC" .equals(String.valueOf(request.getAttribute("direccion")))
                                ? "selected" : "" %>>
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
                            <% if (alumnos !=null && !alumnos.isEmpty()) { for (Alumno a : alumnos) { %>
                              <tr>
                                <td>
                                  <%= numero++ %>
                                </td>
                                <td>
                                  <%= a.getNombre() %>
                                </td>
                                <td>
                                  <%= a.getApellidos() %>
                                </td>
                                <td>
                                  <%= a.getCurso() %>
                                </td>
                                <td>
                                  <% if (a.getNota()==null) { %>
                                    <span class="badge bg-secondary">Sin nota</span>
                                    <% } else if (a.getNota()>= 5) { %>
                                      <span class="badge bg-success">
                                        <%= a.getNota() %>
                                      </span>
                                      <% } else { %>
                                        <span class="badge bg-danger">
                                          <%= a.getNota() %>
                                        </span>
                                        <% } %>
                                </td>
                                <td>
                                  <div class="d-flex gap-1">
                                    <a class="btn btn-primary btn-sm"
                                      href="<%=request.getContextPath()%>/alumnos/editar?id=<%=a.getId()%>">✏
                                      Editar</a>
                                    <a class="btn btn-warning btn-sm"
                                      href="<%=request.getContextPath()%>/alumnos/notas?id=<%=a.getId()%>">⭐ Nota</a>

                                    <form action="<%=request.getContextPath()%>/alumnos/eliminar" method="POST"
                                      class="d-inline"
                                      onsubmit="return confirm('¿Está seguro de eliminar este alumno?');">
                                      <input type="hidden" name="id" value="<%=a.getId()%>">
                                      <button type="submit" class="btn btn-danger btn-sm">🗑 Eliminar</button>
                                    </form>
                                  </div>
                                </td>
                              </tr>
                              <% } } else { %>
                                <tr>
                                  <td colspan="6" class="text-center">
                                    <div class="alert alert-info mb-0">No hay alumnos registrados.</div>
                                  </td>
                                </tr>
                                <% } %>
                          </tbody>
                        </table>
                  </div>

                </div>
              </div>
              <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>