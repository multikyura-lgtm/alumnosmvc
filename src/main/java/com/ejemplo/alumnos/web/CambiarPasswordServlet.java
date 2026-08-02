package com.ejemplo.alumnos.web;

import com.ejemplo.alumnos.dao.UsuarioDAO;
import com.ejemplo.alumnos.model.Usuario;
import com.ejemplo.alumnos.util.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/cambiar-password")
public class CambiarPasswordServlet extends HttpServlet {

    private final UsuarioDAO dao = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("/cambiar-password.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);

        Integer usuarioId =
                (Integer) session.getAttribute("usuarioId");

        String usuario =
                (String) session.getAttribute("usuario");

        String actual = req.getParameter("actual");
        String nueva = req.getParameter("nueva");
        String repetir = req.getParameter("repetir");

        Usuario u = dao.buscarPorUsuario(usuario);

        if (u == null) {

    resp.sendRedirect(req.getContextPath() + "/login");
    return;
}

if (!PasswordUtil.checkPassword(actual, u.getPassword())) {

    req.setAttribute("error", "La contraseña actual es incorrecta.");

    req.getRequestDispatcher("/cambiar-password.jsp")
            .forward(req, resp);

    return;
}

if (!nueva.equals(repetir)) {

    req.setAttribute("error", "Las nuevas contraseñas no coinciden.");

    req.getRequestDispatcher("/cambiar-password.jsp")
            .forward(req, resp);

    return;
}

String passwordHash = PasswordUtil.hashPassword(nueva);

dao.cambiarPassword(u.getId(), passwordHash);

req.getSession().invalidate();

resp.sendRedirect(req.getContextPath() + "/login?password=ok");
    }
}