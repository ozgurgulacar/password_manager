import 'package:flutter/material.dart';
import 'package:password_manager/Thema/Themas.dart';

import '../ViewModel/AllPasswordPageViewModel.dart';

class Allpasswordpage extends StatefulWidget {
  const Allpasswordpage({super.key});

  @override
  State<Allpasswordpage> createState() => _AllpasswordpageState();
}

class _AllpasswordpageState extends Allpasswordpageviewmodel {
  final tileMargin = EdgeInsets.only(bottom: 15, top: 10);
  final String title = "Detayları Görmek İçin Uygulamanın Şifresini Giriniz";
  final String hintText = "Şifrenizi Giriniz";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.blueGrey,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: _PageStyle().boxDecoration(),
                margin: tileMargin,
                child: ListTile(
                  trailing: const Icon(
                    Icons.navigate_next_outlined,
                    size: 36,
                    color: Colors.blueAccent,
                  ),
                  leading: const Icon(
                    Icons.security_outlined,
                    size: 36,
                    color: Colors.blueAccent,
                  ),
                  title: Text(list[index].name),
                  subtitle: const Text("******"),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return _PageStyle()
                            .alertDialog(title: title, hintText: hintText,context: context,name: list[index].name);
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _PageStyle extends Allpasswordpageviewmodel {
  BoxShadow boxShadow() {
    return BoxShadow(
      color: Colors.grey.withOpacity(0.6),
      spreadRadius: 4,
      blurRadius: 3,
      offset: Offset(0, 1), // Gölge ofseti
    );
  }

  Decoration boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.amber,
      boxShadow: [
        _PageStyle().boxShadow(),
      ],
    );
  }

  AlertDialog alertDialog({required String title, required String hintText,required BuildContext context,required String name}) {
    return AlertDialog(
      title: Text(title),
      content: TextFormField(
        controller: controller,
        decoration: InputDecoration(hintText: hintText),
      ),
      actions: [
        TextButton(
          onPressed: () {
              alertDialogCancel(context);
          },
          child: Text('İptal'),
        ),
        TextButton(
          onPressed: () async {
            final result = listTileOnTap(name: name,cnt: context);
            if(await result){
              Navigator.pushNamed(context, "/PasswordDetailPage", arguments: name = name);
            }
          },
          child: Text('Onayla'),
        ),
      ],
    );
  }
}
