package com.apex;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

import static com.mongodb.client.model.Filters.eq;

public class UserReg extends DataEngine{
    MongoClient mongoClient = MongoClients.create();
    MongoDatabase database = mongoClient.getDatabase("FoodHut");
    MongoCollection<Document> collection = database.getCollection("Users");


    public User GetUser(String Email) {
        Document UserDoc = collection.find(eq("Email", Email)).first();
        if (UserDoc == null) {
            UserDoc = new Document();
        }

        return DocToUser(UserDoc);
    }

    public List<User> GetAllUsers(){
        List<User> UserList = new ArrayList<User>(); ;
        collection.find().forEach((Consumer<? super Document>) (Document document) -> {
            UserList.add(DocToUser(document));
        });
        return UserList;
    }

    public boolean AddUser(User User, String Base64Image) {
        long emailcheck = collection.countDocuments(eq("Email", User.Email));

        if (emailcheck > 0) {
            return false;
        }
        Document user = UserToDoc(User,Base64Image);

        collection.insertOne(user);
        return true;
    }

    public boolean UpdateUser(User User) {
        //Document user = UserToDoc(User);
        //collection.updateOne(eq("Email", User.Email), user);

        return true;
    }

    public boolean DeleteUser(String Email) {
        collection.deleteOne(eq("Email", Email));
        return true;
    }
}
