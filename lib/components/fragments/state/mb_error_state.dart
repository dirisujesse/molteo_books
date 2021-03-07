import 'package:molteo_books/components/fragments/buttons/mb_button.dart';
import 'package:molteo_books/components/fragments/spacers/mb_sized_box.dart';
import 'package:molteo_books/components/typography/app_text.dart';
import 'package:molteo_books/style/colors.dart';
import 'package:molteo_books/utils/typedefs.dart';
import 'package:molteo_books/values/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MbErrorState extends StatelessWidget {
  final String errorMessage;
  final OnPressed onRetry;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  MbErrorState({
    @required this.errorMessage,
    @required this.onRetry,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  })  : assert(errorMessage != null),
        assert(onRetry != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        SvgPicture.asset(MbSvgs.failure),
        const MbSizedBox(height: .5),
        Flexible(
          child: MbText(
            errorMessage,
            textAlign: TextAlign.center,
          ),
        ),
        Flexible(
          child: FittedBox(
            child: MbButton(
              text: "Retry",
              textColor: MbColors.red,
              onPressed: onRetry,
              color: MbColors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
