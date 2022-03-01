import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autovalidateMode: AutovalidateMode.always,
        autofocus: false,
        decoration:  InputDecoration(

          fillColor: Theme.of(context).colorScheme.primaryContainer,
          contentPadding: const EdgeInsets.only(
              left: 14.0, bottom: 6.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          icon: Icon(Icons.person),
          hintText: 'What do people call you?',
          labelText: 'Name *',
        ),
        onSaved: (e) => print("hahhah"),
        validator: (e) {
          if (e != "") {
            return "";
          } else {
            return "error";
          }
        });
  }
}
