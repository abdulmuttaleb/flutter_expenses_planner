import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {

  final String text;
  final Function clickHandler;

  AdaptiveFlatButton(this.text, this.clickHandler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS?
    CupertinoButton(
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold),),
      onPressed: clickHandler,
    ):
    FlatButton(
      textColor: Theme.of(context).primaryColor,
      child: Text( text, style: TextStyle(fontWeight: FontWeight.bold)),
      onPressed: clickHandler,
    );
  }
}
