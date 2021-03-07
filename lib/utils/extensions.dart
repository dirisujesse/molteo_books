import 'package:flutter/widgets.dart';

extension WidgetExtensions on Widget {
  List<Widget> operator *(int count) {
    return List.generate(count, (_) => this);
  }
}
