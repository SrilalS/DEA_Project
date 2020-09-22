package com.apex;

public class Shop {

    public String FName;
    public String LName;
    public String ShopName;
    public String ShopAddress;
    public double ShopLat;
    public double ShopLang;
    public String Address;
    public String Telephone;
    public String BDay;
    public String HashedPW;
    public String Email;
    public String Photo;

    public String NIC;
    public boolean ISVerified;

    public Shop(String FName, String LName, String shopName, String shopAddress, String address, String telephone, String BDay, String hashedPW, String email, String photoUrl, String NIC, boolean ISVerified, double lat, double lang) {
        this.FName = FName;
        this.LName = LName;
        this.ShopName = shopName;
        this.ShopAddress = shopAddress;
        this.Address = address;
        this.Telephone = telephone;
        this.BDay = BDay;
        this.HashedPW = hashedPW;
        this.Email = email;
        this.Photo = photoUrl;
        this.NIC = NIC;
        this.ISVerified = ISVerified;

        this.ShopLat = lat;
        this.ShopLang = lang;
    }
}
