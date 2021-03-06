import 'package:flutter/widgets.dart';
import 'package:molteo_books/utils/dimensions.dart';

class MbSizedBox extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;

  const MbSizedBox({this.height = 0, this.width = 0, this.child});

  @override
  Widget build(BuildContext context) {
    final sizer = MbScaleUtil(context).sizer;
    return SizedBox(
      height: sizer.setHeight(height),
      width: sizer.setWidth(width),
      child: child,
    );
  }
}
