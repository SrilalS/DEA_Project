package com.apex;

public class Image {
    protected String Name;
    protected String Email;
    protected String Byte64;
    protected String ProductID;

    public Image(String name, String email, String byte64, String productID) {
        this.Name = name;
        this.Email = email;
        this.Byte64 = byte64;
        this.ProductID = productID;
    }
}
