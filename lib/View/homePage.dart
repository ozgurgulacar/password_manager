import 'package:flutter/material.dart';


import '../Thema/Themas.dart';
import '../ViewModel/HomePageViewModel.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends Homepageviewmodel {





  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: Text(appBarTitle),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          color: Colors.black12,
          child: Column(
            children: [
              SizedBox(
                  width: 20,
                  height: (MediaQuery.of(context).size.height / 5) - 25),
              Container(
                width: 100,
                padding: EdgeInsets.all(20),
                height: 100,
                decoration: _PageStyle().containerDecoration(
                    colors: [Colors.black87, Colors.black12]),
                child: Container(
                    child: const Icon(Icons.login_outlined, color: Colors.red),
                    width: 100,
                    height: 100,
                    decoration: _PageStyle().containerDecoration(
                        colors: [Colors.blueGrey, Colors.lightBlueAccent])),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: TextFormField(
                    maxLength: 20,
                    obscureText: true,
                    controller: controllerFirst,
                    keyboardType: TextInputType.text,
                    style: _PageStyle().inputTextStyle(),
                    decoration: Themas().inputDecoration(
                        labelText: inputTextMessage,
                        icon: Icon(Icons.password))),
              ),
              TextFormField(
                  maxLength: 20,
                  obscureText: true,
                  controller: controllerSecond,
                  keyboardType: TextInputType.text,
                  style: _PageStyle().inputTextStyle(),
                  decoration: Themas().inputDecoration(
                      labelText: inputTextMessage,
                      icon: Icon(Icons.password_outlined))),
              Container(
                width: (MediaQuery.of(context).size.width) / 3,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    bool result = Homepageviewmodel().clickButton(
                        textFirst: controllerFirst,
                        textSecond: controllerSecond);
                    if (!result) {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Themas().bottomSheetContainer(
                              context: context, text: errorLoginMessage);
                        },
                        backgroundColor: Colors.indigoAccent,
                      );
                    }else{
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Themas().bottomSheetContainer(
                              context: context, text: successLoginMessage);
                        },
                        backgroundColor: Colors.indigoAccent,
                      );
                    }
                  },
                  child: _PageStyle().butonText(text: buttonText),
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                      foregroundColor: WidgetStatePropertyAll(Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PageStyle {
  TextStyle inputTextStyle() {
    return const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
      letterSpacing: 3,
    );
  }

  BoxDecoration containerDecoration({required List<Color> colors}) {
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      gradient: LinearGradient(colors: colors),
    );
  }

  Text butonText({required String text}) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        letterSpacing: 1,
      ),
    );
  }



}
