import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:molteo_books/style/themedata.dart';
import 'package:molteo_books/values/routes.dart';
import 'package:molteo_books/values/state_wrapper.dart';

void main() {
  startApp();
}

void startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("app_data");
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MolteoBooks());
}

class MolteoBooks extends StatelessWidget {
  const MolteoBooks({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateWrapper(
      child: MaterialApp(
        title: 'Schoolable Pay',
        home: MbRoutes.home,
        theme: MbThemes.defaultTheme,
        debugShowCheckedModeBanner: false,
        routes: MbRoutes.staticRoutes,
        onGenerateRoute: MbRoutes.dynamicRoutes,
      ),
    );
  }
}
