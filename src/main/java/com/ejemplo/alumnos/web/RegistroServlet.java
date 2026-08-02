package com.ejemplo.alumnos.web;

import com.ejemplo.alumnos.model.Usuario;
import com.ejemplo.alumnos.dao.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.ejemplo.alumnos.util.PasswordUtil;

import java.io.IOException;

@WebServlet("/registro")
public class RegistroServlet extends HttpServlet {

    private final UsuarioDAO dao = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("/registro.jsp")
                .forward(req, resp);
    }

@Override
protected void doPost(HttpServletRequest req,
                      HttpServletResponse resp)
        throws ServletException, IOException {

    req.setCharacterEncoding("UTF-8");

    String usuario = req.getParameter("usuario");
    String password = req.getParameter("password");
    String password2 = req.getParameter("password2");

    usuario = (usuario == null) ? "" : usuario.trim();
    password = (password == null) ? "" : password.trim();

    if (usuario.isBlank() || password.isBlank()) {

      req.setAttribute("error",
          "Todos los campos son obligatorios.");

      req.getRequestDispatcher("/registro.jsp")
          .forward(req, resp);

      return;
    }
    
    if (!password.equals(password2)) {

      req.setAttribute("error",
          "Las contraseñas no coinciden.");

      req.setAttribute("usuario", usuario);

      req.getRequestDispatcher("/registro.jsp")
          .forward(req, resp);

      return;
    }

if (dao.buscarPorUsuario(usuario) != null) {

    req.setAttribute("error",
            "El usuario ya existe.");

    req.setAttribute("usuario", usuario);

    req.getRequestDispatcher("/registro.jsp")
            .forward(req, resp);

    return;
}
    String passwordHash = PasswordUtil.hashPassword(password);

dao.insertar(new Usuario(usuario, passwordHash, "USER"));

    resp.sendRedirect(req.getContextPath() + "/login?registro=ok");
}
}