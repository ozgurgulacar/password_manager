import 'package:flutter/material.dart';
import 'package:password_manager/Model/SingletonDB.dart';
import 'package:password_manager/View/TabBarPage.dart';

import 'PasswordDetail.dart';
import 'homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => _SplashScreen(),
        "/HomePage": (context) => homePage(),
        "/TabBarPage": (context) => TabBarPage(),
        "/PasswordDetailPage": (context) => PasswordDetail(),
      },
    );
  }


}

// İlk sayfa widget'ı
class _SplashScreen extends StatefulWidget {
  const _SplashScreen({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<_SplashScreen> {


  @override
  void initState() {
    super.initState();
    _routePage();
  }


  Future<void> _routePage() async {
    final db = await SingletonDB.getInstance();
    if (db == null) {
      await Future.delayed(Duration(seconds: 2));
    }
    final user = await SingletonDB.getInstance()!.dao.getUser();
    if (user.isEmpty) {
      Navigator.pushReplacementNamed(context, "/HomePage");
    } else {
      Navigator.pushReplacementNamed(context, "/TabBarPage");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold();

  }
}
