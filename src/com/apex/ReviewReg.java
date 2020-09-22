package com.apex;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import org.bson.types.ObjectId;

import static com.mongodb.client.model.Filters.eq;

public class ReviewReg extends DataEngine{
    MongoClient mongoClient = MongoClients.create();
    MongoDatabase database = mongoClient.getDatabase("FoodHut");
    MongoCollection<Document> collection = database.getCollection("Reviews");

    public String AddReview(Review Review){
        Document document = Review.ToDocument();
        collection.insertOne(document);
        return document.getObjectId("_id").toString();
    }

    public void UpdateReview(Review Review){
        Document document = Review.ToDocument();
        collection.updateOne(eq("Email",Review.Email),document);
    }

    public void DeleteReview(String Email){
        collection.deleteOne(eq("Email",Email));
    }
}
