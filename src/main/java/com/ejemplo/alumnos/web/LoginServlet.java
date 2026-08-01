package com.ejemplo.alumnos.web;

import com.ejemplo.alumnos.dao.UsuarioDAO;
import com.ejemplo.alumnos.model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
private final UsuarioDAO dao = new UsuarioDAO();
    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
        throws ServletException, IOException {

      if ("ok".equals(req.getParameter("registro"))) {

        req.setAttribute(
            "mensaje",
            "✅ Usuario registrado correctamente. Ya puedes iniciar sesión.");
      }

        req.getRequestDispatcher("/login.jsp")
                .forward(req, resp);
    }

   @Override
protected void doPost(HttpServletRequest req,
                      HttpServletResponse resp)
        throws ServletException, IOException {

    req.setCharacterEncoding("UTF-8");

    String usuario = req.getParameter("usuario");
    String password = req.getParameter("password");

    Usuario u = dao.buscarPorUsuario(usuario);

    if (u != null && u.getPassword().equals(password)) {

        HttpSession session = req.getSession();

        session.setAttribute("usuario", u.getUsuario());
        session.setAttribute("rol", u.getRol());

        resp.sendRedirect(req.getContextPath() + "/");

    } else {

        req.setAttribute("error", "Usuario o contraseña incorrectos.");

        req.getRequestDispatcher("/login.jsp")
                .forward(req, resp);
    }
}

}