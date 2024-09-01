package com.example.data_back.Crypto;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.crypto.spec.IvParameterSpec;
import java.util.Base64;
import java.security.Key;

public class CryptoUtil {
    public static final String ALGORITHM = "AES";
    public static final String TRANSFORMATION = "AES/CBC/PKCS5Padding";
    public static final String KEY = "0123456789abcdef"; // 16-byte private key
    public static final String IV = "abcdef0123456789"; // 16-byte IV

    public static final SecretKeySpec secretKeySpec = new SecretKeySpec(KEY.getBytes(), ALGORITHM);
    public static final IvParameterSpec ivParameterSpec = new IvParameterSpec(IV.getBytes());

    public static String encrypt(String data) throws Exception {
        Cipher cipher = Cipher.getInstance(TRANSFORMATION);
        cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, ivParameterSpec);
        byte[] encrypted = cipher.doFinal(data.getBytes());
        return Base64.getEncoder().encodeToString(encrypted);
    }

    public static String decrypt(String encryptedData) throws Exception {
        Cipher cipher = Cipher.getInstance(TRANSFORMATION);
        cipher.init(Cipher.DECRYPT_MODE, secretKeySpec, ivParameterSpec);
        byte[] original = cipher.doFinal(Base64.getDecoder().decode(encryptedData));
        return new String(original);
    }

    public static void main(String[] args) {
        try {
            String originalText = "111";
            String encryptedText = encrypt(originalText);
            String decryptedText = decrypt("2uElhDY7TFLGQpe4nb4siD5OsKiwvVbfoNizjaRw6Kc");

            System.out.println("Original: " + originalText);
            System.out.println("Encrypted: " + encryptedText);
            System.out.println("Decrypted: " + decryptedText);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
