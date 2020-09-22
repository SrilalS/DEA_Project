package com.apex;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;


public class AdminCustomers extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/SuperAdmin/AdminCustomers.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserReg userReg = new UserReg();
        ServletEngine servletEngine = new ServletEngine();

        String FName = request.getParameter("FName");

        String UserDel_email = request.getParameter("Delete");

        if (FName != null) {
            Part filePart = request.getPart("Photo");
            InputStream inputStream = filePart.getInputStream();
            byte[] bytes = inputStream.readAllBytes();

            String base64Image = Base64.getEncoder().encodeToString(bytes);
            userReg.AddUser(servletEngine.RequestToUser(request,base64Image),base64Image);

            //response.addCookie(new Cookie("DTX",ShopName));
        } else if (UserDel_email != null) {
            userReg.DeleteUser(UserDel_email);
        }

        request.getRequestDispatcher("/SuperAdmin/AdminCustomers.jsp").forward(request, response);
    }

}
