package com.apex;

import com.apex.paymentsGateway.Payment;
import com.apex.shopadmin.Item;
import com.apex.shopadmin.Order;
import org.bson.Document;

public class DataEngine {

    public Document UserToDoc(User User, String Base64Image){
        return new Document("FName", User.FName)
                .append("LName", User.LName)
                .append("Address", User.Address)
                .append("Telephone", User.Telephone)
                .append("BDay", User.BDay)
                .append("HashedPW", User.HashedPW)
                .append("Email", User.Email)
                .append("Photo", Base64Image);
    }


    public User DocToUser(Document Document){
        return new User(
                Document.getString("FName"),
                Document.getString("LName"),
                Document.getString("Address"),
                Document.getString("Telephone"),
                Document.getString("BDay"),
                Document.getString("HashedPW"),
                Document.getString("Email"),
                Document.getString("Photo")
        );
    }

    public Shop DocToShop(Document Document){
        return new Shop(
                Document.getString("FName"),
                Document.getString("LName"),
                Document.getString("ShopName"),
                Document.getString("ShopAddress"),
                Document.getString("Address"),
                Document.getString("Telephone"),
                Document.getString("BDay"),
                Document.getString("HashedPW"),
                Document.getString("Email"),
                Document.getString("Photo"),
                Document.getString("NIC"),
                Document.getBoolean("ISVerified"),
                Document.getDouble("ShopLat"),
                Document.getDouble("ShopLang")
        );
    }

    public Document ShopToDoc(Shop Shop, String Base64Image){
        return new Document("FName", Shop.FName)
                .append("LName", Shop.LName)
                .append("ShopName",Shop.ShopName)
                .append("Address", Shop.Address)
                .append("ShopAddress", Shop.ShopAddress)
                .append("Telephone", Shop.Telephone)
                .append("BDay", Shop.BDay)
                .append("HashedPW", Shop.HashedPW)
                .append("Email", Shop.Email)
                .append("Photo", Base64Image)
                .append("NIC",Shop.NIC)
                .append("ISVerified",Shop.ISVerified)
                .append("ShopLat",Shop.ShopLat)
                .append("ShopLang",Shop.ShopLang);
    }

    public Review DocToReview(Document Document){
        return new Review(
                Document.getString("Email"),
                Document.getString("Comment"),
                Document.getLong("TimeStamp"),
                Document.getString("ProductID")
        );
    }


    public Item DocToItem(Document Document){
        return new Item(
                Document.getString("ID"),
                Document.getString("Name"),
                Document.getString("Description"),
                Document.getDouble("Price"),
                Document.getString("ShopEmail"),
                Document.getInteger("Amount"),
                Document.getString("Base64Photo")
        );
    }

    public Order DocToOrder(Document Document){
        return new Order(
                Document.getString("OrderID"),
                Document.getString("ProductID"),
                Document.getString("ProductName"),
                Document.getString("UserEmail"),
                Document.getString("ShopEmail"),
                Document.getInteger("Amount"),
                Document.getString("DeliveryMode"),
                Document.getInteger("OrderTime"),
                Document.getDouble("Total"),
                Document.getBoolean("Completed")
        );
    }

    public Payment DocToPayment(Document Document){
        return new Payment(
                Document.getString("ID"),
                Document.getDouble("Time"),
                Document.getString("FromEmail"),
                Document.getString("ToEmail"),
                Document.getDouble("Amount"),
                Document.getString("OrderID")
        );
    }
}
