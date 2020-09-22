package com.apex.checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


public class Checkout extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Cookie TestCookie = new Cookie("Cart", "[81aac382-a035-4ba9-9645-c79cde910bc9]");
        response.addCookie(TestCookie);
        request.getRequestDispatcher("/CheckOut/Checkout.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.print(request.getParameter("status_message"));
    }
}
