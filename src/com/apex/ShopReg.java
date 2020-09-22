package com.apex;


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


public class ShopReg extends DataEngine{
    MongoClient mongoClient = MongoClients.create();
    MongoDatabase database = mongoClient.getDatabase("FoodHut");
    MongoCollection<Document> collection = database.getCollection("Shops");


    public Shop GetShop(String Email) {
        Document ShopDoc = collection.find(eq("Email", Email)).first();
        if (ShopDoc == null) {
            ShopDoc = new Document();
        }

        return DocToShop(ShopDoc);
    }

    public List<Shop> GetAllShops(){
        List<Shop> ShopList = new ArrayList<Shop>();
        collection.find().forEach((Consumer<? super Document>) (Document document) -> {
            ShopList.add(DocToShop(document));
        });
        return ShopList;
    }

    public void AddShop(Shop Shop, String Base64Image) {
        long emailcheck = collection.countDocuments(eq("Email", Shop.Email));

        if (emailcheck > 0) {
            return;
        }
        Document shop = ShopToDoc(Shop,Base64Image);

        collection.insertOne(shop);
    }

    public boolean UpdateShop(String Email, Bson updateOps) {

        collection.updateOne(eq("Email", Email), updateOps);

        return true;
    }

    public void DeleteShop(String Email) {
        collection.deleteOne(eq("Email", Email));
    }
}
