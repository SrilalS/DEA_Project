package com.apex.paymentsGateway;

import org.bson.Document;

public class Payment {
    public String ID;
    public Double Time;
    public String FromEmail;
    public String ToEmail;
    public Double Amount;
    public String OrderID;

    public Payment(String ID, Double time, String fromEmail, String toEmail, Double amount, String orderID) {
        this.ID = ID;
        Time = time;
        FromEmail = fromEmail;
        ToEmail = toEmail;
        Amount = amount;
        OrderID = orderID;
    }

    public Document toDocument(){
        return new Document("ID", this.ID)
                .append("Time", this.Time)
                .append("FromEmail",this.FromEmail)
                .append("ToEmail",this.ToEmail)
                .append("Amount",this.Amount)
                .append("OrderID",this.OrderID)
                ;
    }
}


