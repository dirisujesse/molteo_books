import 'package:flutter/material.dart';
import 'package:molteo_books/components/typography/button_text.dart';
import 'package:molteo_books/style/colors.dart';
import 'package:molteo_books/utils/dimensions.dart';
import 'package:molteo_books/utils/typedefs.dart';

class MbButton extends StatelessWidget {
  final OnPressed onPressed;
  final Color color;
  final Color disabledColor;
  final Color textColor;
  final String text;
  final bool isDense;
  final bool isFitted;
  final bool isBold;
  final double verticalPadding;
  final double horizontalPadding;
  final double fontSize;

  MbButton({
    @required this.text,
    @required this.onPressed,
    this.color = MbColors.green,
    this.textColor = MbColors.white,
    this.disabledColor,
    this.isDense = false,
    this.isBold = false,
    this.isFitted = true,
    this.verticalPadding,
    this.horizontalPadding,
    this.fontSize = 30,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaler = MbScaleUtil(context);
    return FlatButton(
      disabledColor: disabledColor ?? color,
      padding: scaler.insets.symmetric(
        vertical: verticalPadding ?? (isDense ? .7 : 2),
        horizontal: horizontalPadding ?? 8,
      ),
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          scaler.fontSizer.sp(100),
        ),
      ),
      child: ButtonText(
        text,
        textColor: onPressed != null ? textColor : textColor.withOpacity(.4),
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: fontSize,
        fitted: isFitted,
      ),
      onPressed: onPressed != null
          ? () {
              FocusScope.of(context).requestFocus(
                new FocusNode(),
              );
              onPressed();
            }
          : null,
    );
  }
}
