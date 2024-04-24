package com.user.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Cipher {
	public static String GenerateMD5(String data){
        try {
            // gọi phương thức tạo đối tượng mã hóa MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            //chuyển chuỗi mã hóa về dạng byte
            byte[] messageDigest = md.digest(data.getBytes());
            //chuyển mảng byte thành ký số
            BigInteger no = new BigInteger(1, messageDigest);
            // convert thành chuỗi hexa 16
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            } 
            return hashtext;
        } catch (NoSuchAlgorithmException ex) {
            System.out.println("Sai tên giải thuật");
        }
        return null;
    
    }
}
