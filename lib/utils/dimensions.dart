import 'package:flutter/widgets.dart'
    show
        BuildContext,
        MediaQuery,
        MediaQueryData,
        EdgeInsets,
        RenderBox,
        Offset;
import 'package:molteo_books/models/enums/screen_type.dart';

class _MbDimension {
  MediaQueryData _queryData;
  _MbDimension(BuildContext context) {
    _queryData = MediaQuery.of(context);
  }

  ScreenType get screenType {
    if (_queryData.size.width > 500) return ScreenType.TABLET;
    return ScreenType.MOBILE;
  }

  double get topInset {
    return _queryData.padding.top;
  }

  double get width {
    return _queryData.size.shortestSide;
  }

  double get height {
    return _queryData.size.longestSide;
  }

  double setHeight(double percentage) {
    if (percentage == 0) {
      return 0;
    }
    return height * (percentage / 100);
  }

  double setWidth(double percentage) {
    if (percentage == 0) {
      return 0;
    }
    return width * (percentage / 100);
  }
}

class _MbFontSizer {
  num _shortestSide;
  _MbFontSizer(BuildContext context) {
    _shortestSide = MediaQuery.of(context).size.shortestSide;
  }

  num sp(double percentage) {
    return ((_shortestSide) * ((percentage ?? 35) / 1000)).ceil().toDouble();
  }
}

class _MbInsets {
  _MbDimension sizer;

  _MbInsets(BuildContext context) {
    sizer = _MbDimension(context);
  }

  EdgeInsets get zero {
    return EdgeInsets.zero;
  }

  EdgeInsets all(double inset) {
    return EdgeInsets.all(sizer.setWidth(inset));
  }

  EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(
      top: sizer.setHeight(top),
      left: sizer.setWidth(left),
      bottom: sizer.setHeight(bottom),
      right: sizer.setWidth(right),
    );
  }

  EdgeInsets fromLTRB(
    double left,
    double top,
    double right,
    double bottom,
  ) {
    return EdgeInsets.fromLTRB(
      sizer.setWidth(left),
      sizer.setHeight(top),
      sizer.setWidth(right),
      sizer.setHeight(bottom),
    );
  }

  EdgeInsets symmetric({
    double vertical = 0,
    double horizontal = 0,
  }) {
    return EdgeInsets.symmetric(
      vertical: sizer.setHeight(vertical),
      horizontal: sizer.setWidth(horizontal),
    );
  }
}

class MbScaleUtil {
  final BuildContext context;

  MbScaleUtil(this.context);

  _MbDimension get sizer => _MbDimension(context);
  _MbFontSizer get fontSizer => _MbFontSizer(context);
  _MbInsets get insets => _MbInsets(context);
}

Offset getPos(BuildContext context) {
  final RenderBox box = context.findRenderObject();
  return box.localToGlobal(Offset.zero);
}
