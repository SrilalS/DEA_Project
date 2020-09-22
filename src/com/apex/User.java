package com.apex;

public class User {
    public String FName;
    public String LName;
    public String Address;
    public String Telephone;
    public String BDay;
    public String HashedPW;
    public String Email;
    public String Photo;

    public User(String FName, String LName, String address, String telephone, String BDay, String hashedPW, String email, String Photo) {
        this.FName = FName;
        this.LName = LName;
        this.Address = address;
        this.Telephone = telephone;
        this.BDay = BDay;
        this.HashedPW = hashedPW;
        this.Email = email;
        this.Photo = Photo;
    }
}
