import 'package:flutter/material.dart';
import 'package:password_manager/Model/Crypto.dart';
import 'package:password_manager/Model/PasswordManagers.dart';
import 'package:password_manager/Model/SingletonDB.dart';

import '../View/AddPasswordPage.dart';

class addPasswordPageViewModel extends State<addPasswordPage> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  final textName = TextEditingController();
  final textPassword = TextEditingController();
  bool secureText = false;
  final crypto = Crypto();

  bool addNew() {
    if (textName.text.isEmpty || textPassword.text.isEmpty) {
      return false;
    } else {
      final password = PasswordManagers(
          name: textName.text, password: crypto.encryptText(textPassword.text));
      SingletonDB.getInstance()!.dao.insertPassword(password);
      textName.text = "";
      textPassword.text = "";
      return true;
    }
  }
}
