import 'package:flutter/material.dart';
import 'package:password_manager/View/AddPasswordPage.dart';
import 'package:password_manager/View/AllPasswordPage.dart';
import 'package:password_manager/View/homePage.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _AllPasswordPageState();
}

class _AllPasswordPageState extends State<TabBarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // Kaç sekmeden oluşacağını belirliyoruz.
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          centerTitle: true,
          title: const Text("PASSWORD MANAGER"),
        ),
        bottomNavigationBar: const TabBar(
          dividerColor: Colors.red,
          labelColor: Colors.amber,
          tabs: [
            Tab(icon: Icon(Icons.list_alt_outlined),text: "TÜM ŞİFRELER",),
            Tab(icon: Icon(Icons.add_box_outlined),text: "YENİ EKLE"),
          ],
        ),
        body: const TabBarView(children: [
          Allpasswordpage(),
          addPasswordPage(),
        ]),
      ),
    );
  }
}
