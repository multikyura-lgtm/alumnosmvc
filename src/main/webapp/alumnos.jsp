<%@ page contentType="text/html; charset=UTF-8" %>
  <%@ page import="java.util.List" %>
    <%@ page import="com.ejemplo.alumnos.model.Alumno" %>

      <% List<Alumno> alumnos = (List<Alumno>) request.getAttribute("alumnos");
          %>

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
                    <a class="btn btn-success btn-sm" href="<%=request.getContextPath()%>/alumnos/nuevo">
                      ➕ Nuevo
                    </a>

                    <a class="btn btn-light btn-sm" href="<%=request.getContextPath()%>/">
                      🏠 Inicio
                    </a>
                  </div>
                </div>

                <div class="card-body">

                  <table class="table table-striped table-hover align-middle">

                    <thead class="table-dark">
                      <tr>
                        <th>ID</th>
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
                            <%= a.getId() %>
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
                              <% } else if (a.getNota()>= 5) {
                                %>
                                <span class="badge bg-success">
                                  <%= a.getNota() %>
                                </span>
                                <% } else { %>
                                  <span class="badge bg-danger">
                                    <%= a.getNota() %>
                                  </span>
                                  <% } %>
                          <td>

                            <a class="btn btn-primary btn-sm"
                              href="<%=request.getContextPath()%>/alumnos/editar?id=<%=a.getId()%>">
                              ✏ Editar
                            </a>

                            <a class="btn btn-warning btn-sm"
                              href="<%=request.getContextPath()%>/alumnos/notas?id=<%=a.getId()%>">
                              ⭐ Nota
                            </a>

                            <a class="btn btn-danger btn-sm"
                              href="<%=request.getContextPath()%>/alumnos/eliminar?id=<%=a.getId()%>"
                              onclick="return confirm('¿Está seguro de eliminar este alumno?');">
                              🗑 Eliminar
                            </a>

                          </td>
                        </tr>

                        <% } } else { %>

                          <tr>
                            <td colspan="6" class="text-center">
                              <div class="alert alert-info mb-0">
                                No hay alumnos registrados.
                              </div>
                            </td>
                          </tr>

                          <% } %>

                    </tbody>

                  </table>

                </div>

              </div>

            </div>

          </body>

          </html>