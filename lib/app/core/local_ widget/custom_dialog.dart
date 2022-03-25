import 'package:flutter/material.dart';

customDialog(context, String title, Widget child) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          actions:  <Widget>[child],
        );
      });
}
