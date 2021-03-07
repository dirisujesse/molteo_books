import 'package:flutter/material.dart'
    show BuildContext, Widget, MaterialPageRoute, Route, RouteSettings;
import 'package:molteo_books/pages/library/library_detail_page.dart';
import 'package:molteo_books/pages/library/library_list_page.dart';
import 'package:molteo_books/pages/splash_page.dart';

class MbRoutes {
  static Widget home = SplashPage();

  /// Splash Routes
  static const splash = "/splash";

  /// Library Rutes
  static const booksList = "/books";
  static const bookDetail = "/books/detail";

  static Map<String, Widget Function(BuildContext)> staticRoutes = {
    splash: (BuildContext context) => const SplashPage(),
    booksList: (BuildContext context) => const LibraryHomePage(),
    bookDetail: (BuildContext context) => const LibraryDetailPage(),
  };

  static Route<dynamic> dynamicRoutes(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(
          builder: (context) {
            return SplashPage();
          },
        );
    }
  }
}
