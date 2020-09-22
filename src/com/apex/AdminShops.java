package com.apex;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import org.bson.conversions.Bson;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

import static com.mongodb.client.model.Updates.set;

public class AdminShops extends HttpServlet {


    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/SuperAdmin/AdminShops.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ShopReg shopReg = new ShopReg();
        ServletEngine servletEngine = new ServletEngine();

        String ShopName = request.getParameter("ShopName");

        String ShopDel_email = request.getParameter("Delete");
        String ShopVerify_email = request.getParameter("Verify");
        String ShopDeVerify_email = request.getParameter("DeVerify");
        response.addCookie(new Cookie("DTX",ShopName));

        if (ShopName != null) {
            Part filePart = request.getPart("Photo");
            InputStream inputStream = filePart.getInputStream();
            byte[] bytes = inputStream.readAllBytes();

            String base64Image = Base64.getEncoder().encodeToString(bytes);
            shopReg.AddShop(servletEngine.RequestToShop(request,base64Image),base64Image);

            //response.addCookie(new Cookie("DTX",ShopName));
        } else if (ShopDel_email != null) {
            shopReg.DeleteShop(ShopDel_email);
        } else if (ShopVerify_email != null) {
            Bson updateOps = set("ISVerified", true);
            shopReg.UpdateShop(ShopVerify_email, updateOps);
        } else if (ShopDeVerify_email != null) {
            Bson updateOps = set("ISVerified", false);
            shopReg.UpdateShop(ShopDeVerify_email, updateOps);
        }

        request.getRequestDispatcher("/SuperAdmin/AdminShops.jsp").forward(request, response);
    }
}
