package com.apex;

import jakarta.servlet.http.HttpServletRequest;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class ServletEngine {

    public User RequestToUser(HttpServletRequest request, String Base64Image){
        String HashedPW = null;
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = messageDigest.digest(request.getParameter("Password").getBytes(StandardCharsets.UTF_8));
            BigInteger noHash = new BigInteger(1, hashBytes);
            HashedPW = noHash.toString(16);
        } catch (NoSuchAlgorithmException ignored) {}

        return new User(
                request.getParameter("FName"),
                request.getParameter("LName"),
                request.getParameter("Address"),
                request.getParameter("Telephone"),
                request.getParameter("BDay"),
                HashedPW,
                request.getParameter("Email"),
                Base64Image
        );
    }

    public Shop RequestToShop(HttpServletRequest request, String Base64Image){
        String HashedPW = null;
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = messageDigest.digest(request.getParameter("Password").getBytes(StandardCharsets.UTF_8));
            BigInteger noHash = new BigInteger(1, hashBytes);
            HashedPW = noHash.toString(16);
        } catch (NoSuchAlgorithmException ignored) {}

        return new Shop(
                request.getParameter("FName"),
                request.getParameter("LName"),
                request.getParameter("ShopName"),
                request.getParameter("ShopAddress"),
                request.getParameter("Address"),
                request.getParameter("Telephone"),
                request.getParameter("BDay"),
                HashedPW,
                request.getParameter("Email"),
                Base64Image,
                request.getParameter("NIC"),
                false,
                Double.parseDouble(request.getParameter("ShopLat")),
                Double.parseDouble(request.getParameter("ShopLang"))
        );
    }
}
