import 'package:encrypt/encrypt.dart';

mixin GzipUtil {
// //for AES Algorithms
  static Encrypted? encrypted;

  static String encryptAES(String plainText) {
    final key = Key.fromUtf8('4c5cfefcc958f1748eb31dcc609736FK');
    final iv = IV.fromUtf8('K8Csuc2GiKvetPZg'); // Must be 16 chars
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    print('Encrypted Base64 >>> ${encrypted.base64}');
    return encrypted.base64;
  }

  static String decryptAES(String encryptedData) {
    try {
      final key = Key.fromUtf8('4c5cfefcc958f1748eb31dcc609736FK');
      final iv = IV.fromUtf8('K8Csuc2GiKvetPZg'); // Match the IV used in your Java code
      final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
      final encrypted = Encrypted.fromBase64(encryptedData.trim());
      var decrypted = encrypter.decrypt(encrypted, iv: iv);
      print('DecryptedData >>> $decrypted');
      return decrypted;
    } catch (e) {
      print('Decryption error: $e');
      return 'Decryption error';
    }
  }



}