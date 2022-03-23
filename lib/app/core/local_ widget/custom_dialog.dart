import 'package:flutter/material.dart';

 Widget customDialog(context,String title, Widget child) {
  return
    SimpleDialog(

      title: Text(title,textAlign: TextAlign.center,),
      children: <Widget>[
    child
      ],
    );
}
