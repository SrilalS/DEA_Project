package com.apex.shopadmin;

import org.bson.Document;

public class Order {
    public String OrderID;
    public String ProductID;
    public String ProductName;
    public String UserEmail;
    public String ShopEmail;
    public int Amount;
    public String DeliveryMode;
    public int OrderTime;
    public double Total;
    public boolean Completed;

    public Order(String OrderID, String productId, String productName, String userEmail,String shopEmail , int amount, String deliveryMode, int orderTime, double Total, boolean Completed) {
        this.OrderID = OrderID;
        this.ProductID = productId;
        this.ProductName = productName;
        this.UserEmail = userEmail;
        this.ShopEmail = shopEmail;
        this.Amount = amount;
        this.DeliveryMode = deliveryMode;
        this.OrderTime = orderTime;
        this.Total = Total;
        this.Completed = Completed;
    }

    public Document OrderToDoc(Order Order){
        return new org.bson.Document("ProductID",Order.ProductID)
                .append("OrderID",Order.OrderID)
                .append("ProductName",Order.ProductName)
                .append("UserEmail",Order.UserEmail)
                .append("ShopEmail",Order.ShopEmail)
                .append("Amount",Order.Amount)
                .append("DeliveryMode",Order.DeliveryMode)
                .append("OrderTime",Order.OrderTime)
                .append("Total",Order.Total)
                .append("Completed", Order.Completed);
    }
}
