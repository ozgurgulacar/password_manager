
import 'package:flutter/material.dart';
import 'package:password_manager/Model/SingletonDB.dart';
import 'package:password_manager/View/TabBarPage.dart';

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
    checkUser();
  }


  final String appBarTitle = "Şifrenizi Oluşturun";
  final String inputTextMessage = "Şifre Girin";
  final String buttonText = "KAYDOL";
  final String errorLoginMessage="Hatalı Giriş Yaptınız";
  final String successLoginMessage="Giriş Başarılı";

  TextEditingController controllerFirst = TextEditingController();
  TextEditingController controllerSecond = TextEditingController();

  late final db;



  void dbCreate() {
    db=SingletonDB.getInstance();
  }

  Future<void> checkUser() async {
    if(db==null){
      await Future.delayed(Duration(seconds: 2));
    }else{
      final user = SingletonDB.getInstance()!.dao.getUser();
      user.then((value) {
        if(value.isNotEmpty){
          Navigator.pushReplacementNamed(context, "/TabBarPage");
        }
      },);
    }
  }

  bool userKaydet({required TextEditingController textFirst}) {
    if(SingletonDB.getInstance()==null){
      db=SingletonDB.getInstance();
      return false;
    }else{
      User user=User(password: textFirst.text, isActive: true);
      SingletonDB.getInstance()!.dao.insertUser(user);
      Navigator.pushReplacementNamed(context, "/TabBarPage");
      return true;
    }
  }


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
