import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveRaisedButton extends StatelessWidget {
  final String text;
  final Function clickHandler;

  AdaptiveRaisedButton(this.text, this.clickHandler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(text),
            onPressed: clickHandler,
            color: Theme.of(context).primaryColor,
          )
        : RaisedButton(
            child: Text(text),
            onPressed: clickHandler,
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).textTheme.button.color,
          );
  }
}
