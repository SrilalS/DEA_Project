package com.apex.home;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.IOException;

public class SideBar extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/Home/SideBar.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String Email = null;
        Email = request.getParameter("Email");

        response.addHeader("Email",Email);
        request.getRequestDispatcher("/Home/SideBar.jsp").forward(request, response);
    }
}
