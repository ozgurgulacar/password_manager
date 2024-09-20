
import 'package:flutter/material.dart';
import 'package:password_manager/Model/SingletonDB.dart';

import '../Model/User.dart';
import '../View/homePage.dart';


class Homepageviewmodel extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  void initState() {
    super.initState();
    dbCreate();
  }


  late final db;



  void dbCreate() {
    db=SingletonDB.getInstance();

  }





  bool userKaydet({required TextEditingController textFirst}) {
    if(SingletonDB.getInstance()==null){
      db=SingletonDB.getInstance();
      return false;
    }else{
      User user=User(password: textFirst.text, isActive: true);
      SingletonDB.getInstance()!.dao.insertUser(user);
      //NAVİGATE İŞLEMİ YAPILACAK
      return true;
    }
  }







  final String appBarTitle = "Şifrenizi Oluşturun";
  final String inputTextMessage = "Şifre Girin";
  final String buttonText = "KAYDOL";
  final String errorLoginMessage="Hatalı Giriş Yaptınız";
  final String successLoginMessage="Giriş Başarılı";

  TextEditingController controllerFirst = TextEditingController();
  TextEditingController controllerSecond = TextEditingController();

  bool clickButton(
      {required TextEditingController textFirst,
      required TextEditingController textSecond}) {
    if (textFirst.text.isEmpty ||
        textFirst.text.length < 4 ||
        textSecond.text.isEmpty ||
        textSecond.text.length < 4) {
      return false;
    } else if (textFirst.text != textSecond.text) {
      return false;
    } else {
      return true;
    }
  }
}
