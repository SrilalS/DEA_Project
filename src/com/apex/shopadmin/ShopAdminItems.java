package com.apex.shopadmin;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import org.bson.Document;
import org.bson.conversions.Bson;
import static com.mongodb.client.model.Updates.set;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.UUID;

public class ShopAdminItems extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/ShopAdmin/ShopAdminItems.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String ItemName = request.getParameter("NewName");
        String ItemID = request.getParameter("Delete");
        String EDITID = request.getParameter("EDITID");

        Cookie[] Cookies = request.getCookies();
        String ShopEmail ="INVALID";
        //TODO Config Cookie Emails

        for (Cookie cookie : Cookies){
            String Name = cookie.getName();
            if (Name.equals("EMAIL")){
                ShopEmail = cookie.getValue();
            }
        }

        if (ItemName != null){
            Part filePart = request.getPart("Photo");
            InputStream inputStream = filePart.getInputStream();
            byte[] bytes = inputStream.readAllBytes();
            String base64Image = Base64.getEncoder().encodeToString(bytes);

            System.out.print(bytes.length);

            Document document = new Document("Name",request.getParameter("New"))
                    .append("ID", UUID.randomUUID().toString())
                    .append("Description",request.getParameter("Description"))
                    .append("Price",Double.parseDouble(request.getParameter("Price")))
                    .append("ShopEmail",ShopEmail)
                    .append("Amount",Integer.parseInt(request.getParameter("Amount")))
                    .append("Base64Photo",base64Image);
            new ItemReg().AddItem(document);
        } else if(ItemID != null){
            new ItemReg().DeleteItem(ItemID);
        } else if(EDITID != null){
            ItemReg itemReg = new ItemReg();
            Bson updateName = set("Name",request.getParameter("Name"));
            Bson updateDesc = set("Description",request.getParameter("Description"));
            Bson updateAmount = set("Amount",Integer.parseInt(request.getParameter("Amount")));
            Bson updatePrice = set("Price",Double.parseDouble(request.getParameter("Price")));

            itemReg.UpdateItem(EDITID,updateName);
            itemReg.UpdateItem(EDITID, updateDesc);
            itemReg.UpdateItem(EDITID,updateAmount);
            itemReg.UpdateItem(EDITID,updatePrice);
            Part filePart = request.getPart("Photo");
            InputStream inputStream = filePart.getInputStream();
            byte[] bytes = inputStream.readAllBytes();
            String base64Image = Base64.getEncoder().encodeToString(bytes);

            if (bytes.length > 0){
                Bson updatePhoto = set("Base64Photo", base64Image);
                itemReg.UpdateItem(EDITID,updatePhoto);
            }
        }

        request.getRequestDispatcher("/ShopAdmin/ShopAdminItems.jsp").forward(request, response);
    }


}
