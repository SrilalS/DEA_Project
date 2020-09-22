package com.apex;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class Home extends HttpServlet {

    String Message;
    public void init() throws ServletException {
        Message = "Home Page";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ShopReg shopReg = new ShopReg();

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        out.println("<h1>" +"Hello There!"+ "</h1>");
    }

}
