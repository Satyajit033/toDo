import 'package:flutter/material.dart';

InputDecoration AppInputDecoration(lebel,suffixIcon) {
  return InputDecoration(
    focusedBorder:  const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.green, width: 2),
    ),
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 0.0),
    ),
    border: const OutlineInputBorder(),
    labelText: lebel,
    suffixIcon: suffixIcon,
    labelStyle: const TextStyle(color:Colors.grey),
  );
}

ButtonStyle ElevatedButtonStyle(){
  return ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(22),
    backgroundColor: Colors.green,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),

    )
  );
}