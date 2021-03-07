import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:molteo_books/values/images.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      MbSvgs.logo,
      fit: BoxFit.scaleDown,
      alignment: Alignment.center,
    );
  }
}
