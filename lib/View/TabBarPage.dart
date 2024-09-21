import 'package:flutter/material.dart';
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
          title: const Text("appBarTitle"),
        ),
        bottomNavigationBar: const TabBar(
          dividerColor: Colors.red,
          labelColor: Colors.amber,
          tabs: [
            Tab(icon: Icon(Icons.directions_car),text: "TEXT1",),
            Tab(icon: Icon(Icons.directions_subway),text: "TEXT2"),
          ],
        ),
        body: const TabBarView(children: [
          Allpasswordpage(),
          Placeholder(color: Colors.black,),
        ]),
      ),
    );
  }
}
