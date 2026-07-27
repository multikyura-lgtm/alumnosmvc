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

            case "/alumnos/nuevo":
                req.getRequestDispatcher("/nuevo.jsp")
                        .forward(req, resp);
                break;
case "/alumnos/editar":

    String idEditar = req.getParameter("id");

    if (idEditar != null) {

        int id = Integer.parseInt(idEditar);

        Alumno alumno = dao.buscarPorId(id);

        req.setAttribute("alumno", alumno);
    }

    req.getRequestDispatcher("/editar.jsp")
            .forward(req, resp);

    break;
    case "/alumnos/eliminar":

    String idEliminar = req.getParameter("id");

    if (idEliminar != null) {

        int id = Integer.parseInt(idEliminar);

        dao.eliminar(id);
    }

    resp.sendRedirect(req.getContextPath() + "/alumnos");

    break;
            case "/alumnos/notas":

                String idTexto = req.getParameter("id");

                if (idTexto != null) {
                    int id = Integer.parseInt(idTexto);

                    Alumno alumno = dao.buscarPorId(id);

                    req.setAttribute("alumno", alumno);
                }

                req.getRequestDispatcher("/notas.jsp")
                        .forward(req, resp);

                break;

            default:

                req.setAttribute("alumnos", dao.listar());

                req.getRequestDispatcher("/alumnos.jsp")
                        .forward(req, resp);

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

                dao.insertar(
                        new Alumno(
                                nombre,
                                apellidos,
                                curso,
                                null
                        )
                );

                resp.sendRedirect(req.getContextPath() + "/alumnos");

                break;
case "/alumnos/editar":

    int idEditar = Integer.parseInt(req.getParameter("id"));

    String nombreEditar = req.getParameter("nombre");
    String apellidosEditar = req.getParameter("apellidos");
    String cursoEditar = req.getParameter("curso");

    Alumno alumnoEditar = new Alumno(
            idEditar,
            nombreEditar,
            apellidosEditar,
            cursoEditar,
            null
    );

    dao.actualizar(alumnoEditar);

    resp.sendRedirect(req.getContextPath() + "/alumnos");

    break;
            case "/alumnos/notas":

                int id = Integer.parseInt(req.getParameter("id"));
                double nota = Double.parseDouble(req.getParameter("nota"));

                dao.actualizarNota(id, nota);

                resp.sendRedirect(req.getContextPath() + "/alumnos");

                break;
        }

    }

}