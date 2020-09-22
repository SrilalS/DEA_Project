package com.apex.shopadmin;

import com.apex.DataEngine;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import org.bson.conversions.Bson;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import static com.mongodb.client.model.Filters.eq;
import static com.mongodb.client.model.Updates.set;


public class OrderReg extends DataEngine {

    MongoClient mongoClient = MongoClients.create();
    MongoDatabase database = mongoClient.getDatabase("FoodHut");
    MongoCollection<org.bson.Document> collection = database.getCollection("Orders");

    public void AddOrder(Document Document){
        collection.insertOne(Document);
    }

    public List<Order> GetAllOrders(String EMAIL){
        List<Order> OrderList = new ArrayList<Order>();
        collection.find(eq("ShopEmail",EMAIL)).forEach((Consumer<? super Document>) (Document document) -> {
            OrderList.add(DocToOrder(document));
        });
        return OrderList;
    }

    public List<Order> GetAllOrdersAll(){
        List<Order> OrderList = new ArrayList<Order>();
        collection.find().forEach((Consumer<? super Document>) (Document document) -> {
            OrderList.add(DocToOrder(document));
        });
        return OrderList;

    }

    public void MarkAsCompleted(String ID){
        Bson updateOps = set("Completed", true);
        collection.updateOne(eq("OrderID",ID),updateOps);
    }
}
