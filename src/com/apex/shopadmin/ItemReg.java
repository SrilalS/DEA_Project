package com.apex.shopadmin;

import com.apex.DataEngine;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import org.bson.conversions.Bson;

import static com.mongodb.client.model.Filters.eq;


import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

public class ItemReg extends DataEngine {
    MongoClient mongoClient = MongoClients.create();
    MongoDatabase database = mongoClient.getDatabase("FoodHut");
    MongoCollection<Document> collection = database.getCollection("Items");

    public void AddItem(Document Document){
        collection.insertOne(Document);
    }

    public Item getItem(String ItemID){
        return DocToItem(Objects.requireNonNull(collection.find(eq("ID", ItemID)).first()));
    }

    public List<Item> GetAllItems(){
        List<Item> ItemsList = new ArrayList<Item>();
        collection.find().forEach((Consumer<? super Document>) (Document document) -> {
            ItemsList.add(DocToItem(document));
        });
        return ItemsList;
    }

    public void DeleteItem(String ID){
        collection.deleteOne(eq("ID", ID));
    }

    public void UpdateItem(String ID, Bson updateops){
        collection.updateOne(eq("ID", ID), updateops);
    }
}
