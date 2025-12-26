package com.dto;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class SmsUtil {
	public static void sendSms(String mobile, String message) {
        try {
            String apiKey = "470833AnBUbCdsDYJ68d63971P1";
            String senderId = "E-Cart";
            String urlStr = "https://api.msg91.com/api/sendhttp.php?"
                + "mobiles=" + mobile
                + "&authkey=" + apiKey
                + "&route=4"
                + "&sender=" + senderId
                + "&message=" + URLEncoder.encode(message, "UTF-8");

            URL url = new URL(urlStr);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = rd.readLine()) != null) {
                System.out.println(line);
            }
            rd.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
