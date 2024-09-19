import 'package:flutter/material.dart';

class Themas {
  InputDecoration inputDecoration(
      {required String labelText, required Icon icon}) {
    return InputDecoration(
      suffixIcon: icon,
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Colors.red)),
      labelText: labelText,
      suffixIconColor: Colors.black,
      counterStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Container bottomSheetContainer({required BuildContext context, required String text}) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
      width: MediaQuery.of(context).size.width,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }


}
