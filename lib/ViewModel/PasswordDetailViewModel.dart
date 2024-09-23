import 'package:flutter/material.dart';
import 'package:password_manager/Model/PasswordManagers.dart';
import 'package:password_manager/Model/SingletonDB.dart';

import '../View/PasswordDetail.dart';


class PasswordDetailViewModel extends State<PasswordDetail>{

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  void initState() {

    super.initState();
    Future.microtask(() {
      checkId();
      getPassword();
    },);

  }

  late  Object? name;
  final textName = TextEditingController();
  final textPassword = TextEditingController();
  var parola;

  void checkId(){
    name=ModalRoute.of(context)?.settings.arguments;
    SingletonDB.getInstance();
    if(name==null){
      Navigator.pop(context);
    }
  }

  Future<void> getPassword() async {
    await Future.delayed(Duration(seconds: 2));
    final password = SingletonDB.getInstance()!.dao.findPassword(name.toString());
    if(await password.isEmpty){
      Navigator.pop(context);
    }else{
      password.first.then((value) {
        textName.text=value!.name;
        textPassword.text=value.password;
        parola=value;
      },);
    }
  }


  Future<void> delete() async {
    SingletonDB.getInstance()!.dao.deletePassword(parola);
    await Future.delayed(Duration(seconds: 1));
    Navigator.pop(context);
  }





}