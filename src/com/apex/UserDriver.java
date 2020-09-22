package com.apex;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.bson.Document;
import org.bson.types.Binary;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Base64;


public class UserDriver extends HttpServlet {
    ShopReg shopReg = new ShopReg();

    public void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        shopReg.DeleteShop(request.getParameter("Email"));

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("Deleted");
    }

    public void doUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        Part filePart = request.getPart("Photo");
        InputStream inputStream = filePart.getInputStream();
        byte[] bytes = inputStream.readAllBytes();

        String base64Image = Base64.getEncoder().encodeToString(bytes);

        MongoClient mongoClient = MongoClients.create();
        MongoDatabase database = mongoClient.getDatabase("FoodHut");
        MongoCollection<Document> collection = database.getCollection("Files");

        ShopReg shopReg = new ShopReg();
        ServletEngine servletEngine = new ServletEngine();
        shopReg.AddShop(servletEngine.RequestToShop(request,base64Image),base64Image);

       // Document dc = collection.find().first();
        //String bys = dc.getString("B64Image");


        //Document document = new Document("B64Image",base64Image);
        //collection.insertOne(document);

        //Binary brt = (Binary) bys;
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println(shopReg);
        //out.println("<img src=\"data:image/png;base64,"+base64Image +"\">");

        //ReviewReg reviewReg = new ReviewReg();
        //Review review = new Review(
        //        "TestMail:",
        ///        "TestComment",
       //         System.currentTimeMillis(),
        //        "TESTID"
       // );
      //  String id = reviewReg.AddReview(review);

      //  out.println(id);


    }
}
