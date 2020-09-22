package com.apex.shopadmin;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class ShopAdminOrders extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/ShopAdmin/ShopAdminOrders.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Cookie[] ShopCookies = request.getCookies();
        Cookie Shop_ID_Cookie;
        for (Cookie Cookie : ShopCookies){
            if (Cookie.getName().equals("SHOP_ID")){
                Shop_ID_Cookie = Cookie;
            }
        }

        request.setAttribute("TEST","TEST");
        response.setHeader("T","T");


        OrderReg orderReg = new OrderReg();
        String OrderID = request.getParameter("OrderID");

        System.out.print(OrderID);
        if (OrderID != null){
            orderReg.MarkAsCompleted(OrderID);
        }

        request.getRequestDispatcher("/ShopAdmin/ShopAdminOrders.jsp").forward(request, response);
    }
}
