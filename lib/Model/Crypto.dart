import 'package:encrypt/encrypt.dart';

class Crypto {
  final iv = IV.fromLength(16);
  final key = Key.fromUtf8("EazLyuasBRDANUVS");


  String encryptText(String plainText) {

    final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  String decryptText(String encryptedText) {

    final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));

    final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    return decrypted;
  }
}
