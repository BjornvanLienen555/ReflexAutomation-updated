package nl.gall.reflex.java;

import java.util.Random;

public class RandomStringGenerator {
    public static String generateRandomString(int length) {
        String possible = "0123456789";
        StringBuilder text = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(possible.length());
            char randomChar = possible.charAt(randomIndex);
            text.append(randomChar);
        }

        return text.toString();
    }
    public static String generateRandomCSV(int length) {
        String possible = "0123";
        StringBuilder text = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(possible.length());
            char randomChar = possible.charAt(randomIndex);
            text.append(randomChar);
        }

        return text.toString();
    }
}