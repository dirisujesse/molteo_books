import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MbCancelButton extends StatelessWidget {
  const MbCancelButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.close),
      onPressed: () {
        Navigator.of(context).maybePop();
      },
    );
  }
}
