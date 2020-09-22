package com.apex.paymentsGateway;

import com.apex.DataEngine;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

import static com.mongodb.client.model.Filters.eq;

public class PaymentsReg extends DataEngine {

    MongoClient mongoClient = MongoClients.create();
    MongoDatabase database = mongoClient.getDatabase("FoodHut");
    MongoCollection<Document> collection = database.getCollection("Payments");


    public List<Payment> GetAll(String ShopEmail){
        //TODO Implement Shop Cookies.
        List<Payment> PaymentsList = new ArrayList<>();
        collection.find(eq("ToEmail",ShopEmail)).limit(50).forEach((Consumer<? super Document>) (Document document) -> {
            PaymentsList.add(DocToPayment(document));
        });
        return PaymentsList;
    }

    public List<Payment> GetAllAll(){
        //TODO Implement Shop Cookies.
        List<Payment> PaymentsList = new ArrayList<>();
        collection.find().limit(50).forEach((Consumer<? super Document>) (Document document) -> {
            PaymentsList.add(DocToPayment(document));
        });
        return PaymentsList;
    }
}
