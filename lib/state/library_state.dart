import 'package:flutter/foundation.dart' show ChangeNotifier;

class LibraryState extends ChangeNotifier {
  static LibraryState _instance;

  static LibraryState get instance {
    if (_instance == null) {
      _instance = LibraryState();
    }
    return _instance;
  }
}