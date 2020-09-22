package com.apex;

import org.bson.Document;

public class Review {
    protected String Email;
    protected String Comment;
    protected long TimeStamp;
    protected String ProductID;

    public Review(String email, String comment, long timeStamp, String productID) {
        Email = email;
        Comment = comment;
        TimeStamp = timeStamp;
        ProductID = productID;
    }

    public Document ToDocument() {
        return new Document("Email", this.Email)
                .append("Comment", this.Comment)
                .append("TimeStamp", this.TimeStamp)
                .append("ProductID", this.ProductID);
    }
}
