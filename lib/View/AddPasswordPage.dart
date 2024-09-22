import 'package:flutter/material.dart';

import '../Thema/Themas.dart';
import '../ViewModel/AddPasswordPageViewModel.dart';

class addPasswordPage extends StatefulWidget {
  const addPasswordPage({super.key});

  @override
  State<addPasswordPage> createState() => _addPasswordPageState();
}

class _addPasswordPageState extends addPasswordPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: 16, right: 16, top: (MediaQuery.of(context).size.height / 4)),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextField(
              controller: textName,
              keyboardType: TextInputType.text,
              style: Themas().inputTextStyle(),
              decoration: Themas().inputDecoration(
                  labelText: "NAME", icon: Icon(Icons.airplay_sharp)),
            ),
          ),
          TextField(
              obscureText: secureText,
              controller: textPassword,
              keyboardType: TextInputType.text,
              style: Themas().inputTextStyle(),
              decoration: Themas().inputDecoration(
                  labelText: "PASSWORD", icon: Icon(Icons.password_outlined))),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: FloatingActionButton(
                onPressed: () {
                  final result = addNew();
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      if (!result) {
                        return Themas().bottomSheetContainer(
                            context: context, text: "Bir Hata Oluştu");
                      } else {
                        return Themas().bottomSheetContainer(
                            context: context, text: "EKLENDİ");
                      }
                    },
                  );
                },
                child: Icon(Icons.add)),
          )
        ]),
      ),
    );
  }
}
