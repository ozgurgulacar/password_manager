import 'package:flutter/material.dart';

import '../Thema/Themas.dart';
import '../ViewModel/PasswordDetailViewModel.dart';

class PasswordDetail extends StatefulWidget {
  const PasswordDetail({super.key, this.name});

  final String? name;

  @override
  State<PasswordDetail> createState() => _PasswordDetailState();
}

class _PasswordDetailState extends PasswordDetailViewModel {
  TextStyle _textStyle() {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: const Text("PASSWORD DETAİL"),
      ),
      body: Container(
        color: Colors.tealAccent,
        child: Container(
          margin: EdgeInsets.only(right: 16, left: 16, top: 32),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  controller: textName,
                  keyboardType: TextInputType.text,
                  style: Themas().inputTextStyle(),
                  decoration: Themas().inputDecoration(
                      labelText: "NAME", icon: Icon(Icons.airplay_sharp))),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextField(
                    controller: textPassword,
                    keyboardType: TextInputType.text,
                    style: Themas().inputTextStyle(),
                    decoration: Themas().inputDecoration(
                        labelText: "PASSWORD",
                        icon: Icon(Icons.password_outlined))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SizedBox(
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FloatingActionButton(
                          onPressed: () {
                            delete();
                          },
                          backgroundColor: Colors.cyanAccent,
                          child: Text("Sil", style: _textStyle()),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
