import 'package:flutter/material.dart';
import 'package:password_manager/Database/Database.dart';
import 'package:password_manager/Model/Crypto.dart';
import 'package:password_manager/Model/SingletonDB.dart';

import '../Model/PasswordManagers.dart';
import '../View/AllPasswordPage.dart';

class Allpasswordpageviewmodel extends State<Allpasswordpage> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  void initState() {
    super.initState();
    getPasswords();
  }

  List<PasswordManagers> list = [];
  late AppDatabase? db;
  final crypto=Crypto();
  late String userPassword;
  TextEditingController controller = TextEditingController();

  void createDB() async {
    db = await SingletonDB.getInstance();
  }

  void getPasswords() async {
    await {createDB()};
    await Future.delayed(Duration(seconds: 2));
    if (db == null) {
      createDB();
      await Future.delayed(Duration(seconds: 2));
    }

    final value = await db!.dao.getUser();

    if (value.last != null) {
      userPassword = crypto.decryptText(value.last!.password);
    }

    final value2 = await db!.dao.getAllPassword();

    for (var item in value2) {
      if (item != null) {
        setState(() {
          list.add(item);
        });
      }
    }
  }

  Future<bool> listTileOnTap({required String name, required BuildContext cnt}) async {
    final value = await SingletonDB.getInstance()!.dao.getUser();

    if (value.last != null) {
      userPassword = crypto.decryptText(value.last!.password);
      if (controller.text == userPassword) {
        //Detay Sayfasına Gidilecek
        Navigator.pop(cnt);
        return true;

      } else {
        //Yanlış şifre Girildi Mesajı verilecek
        Navigator.pop(cnt);
      }
    }

    return false;
  }

  void alertDialogCancel(BuildContext cnt) {
    Navigator.pop(cnt);
  }
}
