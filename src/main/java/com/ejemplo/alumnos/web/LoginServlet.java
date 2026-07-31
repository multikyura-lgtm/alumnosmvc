package com.ejemplo.alumnos.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("/login.jsp")
                .forward(req, resp);
    }

   @Override
protected void doPost(HttpServletRequest req,
                      HttpServletResponse resp)
    throws ServletException, IOException {

  String usuario = req.getParameter("usuario");
  String password = req.getParameter("password");

  if ("admin".equals(usuario) && "1234".equals(password)) {

    HttpSession session = req.getSession();
    session.setAttribute("usuario", usuario);

    resp.sendRedirect(req.getContextPath() +  "/");

  } else {

    req.setAttribute("error", "Usuario o contraseña incorrectos.");

    req.getRequestDispatcher("/login.jsp")
        .forward(req, resp);
  }
}

}