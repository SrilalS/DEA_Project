package com.apex.shopadmin;

import org.bson.Document;

public class Item {
    public String id;
    public String Name;
    public String Description;
    public Double Price;
    public String ShopEmail;
    public int Amount;
    public String Base64Photo;

    public Item(String ID, String name, String description, Double price, String shopEmail, int amount, String base64Photo) {
        this.id  = ID;
        this.Name = name;
        this.Description = description;
        this.Price = price;
        this.ShopEmail = shopEmail;
        this.Amount = amount;
        this.Base64Photo = base64Photo;
    }

    public Document toDocument(Item Item){
        return new Document
                ("ID",this.id)
                .append("Name",this.Name)
                .append("Description",this.Description)
                .append("Price",this.Price)
                .append("ShopEmail",this.ShopEmail)
                .append("Amount",this.Amount)
                .append("Base64PhotoList",this.Base64Photo);
    }
}
