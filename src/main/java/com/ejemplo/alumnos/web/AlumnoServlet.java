package com.ejemplo.alumnos.web;

import com.ejemplo.alumnos.dao.AlumnoDAO;
import com.ejemplo.alumnos.model.Alumno;
import com.ejemplo.alumnos.util.DB;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class AlumnoServlet extends HttpServlet {

    private AlumnoDAO dao;

    @Override
    public void init() throws ServletException {
        dao = new AlumnoDAO();
        DB.initSchema();
    }

    @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

    String path = req.getServletPath();

    switch (path) {
        // Четко обрабатываем главный путь списка и поиска
   case "/alumnos":

    String buscar = req.getParameter("buscar");
    String ordenar = req.getParameter("ordenar");
    String direccion = req.getParameter("direccion");

    if (ordenar == null || ordenar.isBlank()) {
        ordenar = "id";
    }

    if (direccion == null || direccion.isBlank()) {
        direccion = "DESC";
    }

    req.setAttribute(
        "alumnos",
        dao.listar(buscar, ordenar, direccion)
);

    req.setAttribute("ordenar", ordenar);
    req.setAttribute("direccion", direccion);

    req.setAttribute("totalAlumnos", dao.contarAlumnos());
    req.setAttribute("notaMedia", dao.notaMedia());
    String mensaje = req.getParameter("mensaje");

if ("creado".equals(mensaje)) {
    req.setAttribute("textoMensaje", "✅ Alumno añadido correctamente.");
} else if ("editado".equals(mensaje)) {
    req.setAttribute("textoMensaje", "✏️ Alumno actualizado correctamente.");
} else if ("eliminado".equals(mensaje)) {
    req.setAttribute("textoMensaje", "🗑️ Alumno eliminado correctamente.");
} else if ("nota".equals(mensaje)) {
    req.setAttribute("textoMensaje", "⭐ Nota actualizada correctamente.");
}

    req.getRequestDispatcher("/alumnos.jsp").forward(req, resp);
    break;

        case "/alumnos/nuevo":
            req.getRequestDispatcher("/nuevo.jsp").forward(req, resp);
            break;

        case "/alumnos/editar":
            String idEditar = req.getParameter("id");
            if (idEditar != null) {
                int id = Integer.parseInt(idEditar);
                Alumno alumno = dao.buscarPorId(id);
                req.setAttribute("alumno", alumno);
            }
            req.getRequestDispatcher("/editar.jsp").forward(req, resp);
            break;

  

        case "/alumnos/notas":
            String idTexto = req.getParameter("id");
            if (idTexto != null) {
                int id = Integer.parseInt(idTexto);
                Alumno alumno = dao.buscarPorId(id);
                req.setAttribute("alumno", alumno);
            }
            req.getRequestDispatcher("/notas.jsp").forward(req, resp);
            break;

        default:
            // Если пришли на непонятный адрес, просто уводим на главную
            resp.sendRedirect(req.getContextPath() + "/alumnos");
            break;
    }
}
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String path = req.getServletPath();

        switch (path) {
            case "/alumnos":
    String nombre = req.getParameter("nombre");
    String apellidos = req.getParameter("apellidos");
    String curso = req.getParameter("curso");

    nombre = (nombre == null) ? "" : nombre.trim();
    apellidos = (apellidos == null) ? "" : apellidos.trim();
    curso = (curso == null) ? "" : curso.trim();

    if (nombre.isBlank()
            || apellidos.isBlank()
            || curso.isBlank()) {

        req.setAttribute("error", "Todos los campos son obligatorios.");

        req.setAttribute("nombre", nombre);
        req.setAttribute("apellidos", apellidos);
        req.setAttribute("curso", curso);

        req.getRequestDispatcher("/nuevo.jsp").forward(req, resp);
        return;
    }

    dao.insertar(new Alumno(nombre, apellidos, curso, null));
    resp.sendRedirect(req.getContextPath() + "/alumnos?mensaje=creado");
    break;
            case "/alumnos/editar":
                int idEditar = Integer.parseInt(req.getParameter("id"));
                String nombreEditar = req.getParameter("nombre");
                String apellidosEditar = req.getParameter("apellidos");
                String cursoEditar = req.getParameter("curso");

                nombreEditar = (nombreEditar == null) ? "" : nombreEditar.trim();
apellidosEditar = (apellidosEditar == null) ? "" : apellidosEditar.trim();
cursoEditar = (cursoEditar == null) ? "" : cursoEditar.trim();

if (nombreEditar.isBlank()
        || apellidosEditar.isBlank()
        || cursoEditar.isBlank()) {

    req.setAttribute("error", "Todos los campos son obligatorios.");
    req.setAttribute("alumno",
            new Alumno(idEditar, nombreEditar, apellidosEditar, cursoEditar, null));

    req.getRequestDispatcher("/editar.jsp").forward(req, resp);
    return;
}

                Alumno alumnoEditar = new Alumno(
                        idEditar,
                        nombreEditar,
                        apellidosEditar,
                        cursoEditar,
                        null
                );

                dao.actualizar(alumnoEditar);
                resp.sendRedirect(req.getContextPath() + "/alumnos?mensaje=editado");
                break;

            case "/alumnos/notas":
                int id = Integer.parseInt(req.getParameter("id"));
                String notaParam = req.getParameter("nota");

                Double nota = (notaParam == null || notaParam.isBlank()) 
                        ? null 
                        : Double.parseDouble(notaParam);

                dao.actualizarNota(id, nota);
                resp.sendRedirect(req.getContextPath() + "/alumnos?mensaje=nota");
                break;

                case "/alumnos/eliminar":

    int idEliminar = Integer.parseInt(req.getParameter("id"));

    dao.eliminar(idEliminar);

    resp.sendRedirect(req.getContextPath() + "/alumnos?mensaje=eliminado");
    break;
        }
    }
}
