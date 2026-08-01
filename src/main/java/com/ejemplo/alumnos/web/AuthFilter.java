package com.ejemplo.alumnos.web;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/*")
public class AuthFilter extends HttpFilter {

    @Override
    protected void doFilter(HttpServletRequest req,
                            HttpServletResponse resp,
                            FilterChain chain)
            throws IOException, ServletException {

        String path = req.getServletPath();

       if (path.equals("/login")
        || path.equals("/registro")
        || path.startsWith("/css")
        || path.startsWith("/js")) {

    chain.doFilter(req, resp);
    return;
        }

        HttpSession session = req.getSession(false);

        if (session != null && session.getAttribute("usuario") != null) {

            chain.doFilter(req, resp);

        } else {

            resp.sendRedirect(req.getContextPath() + "/login");

        }
    }
}