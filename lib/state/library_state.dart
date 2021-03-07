import 'dart:async';

import 'package:flutter/foundation.dart' show ChangeNotifier, ValueNotifier;

import 'package:molteo_books/models/config/app_config.dart';
import 'package:molteo_books/models/http/response/library_response_models.dart';
import 'package:molteo_books/services/http/library/library_contract.dart';
import 'package:molteo_books/services/http/library/library_http_service.dart';
import 'package:molteo_books/services/http/library/library_mock_http_service.dart';

class LibraryState extends ChangeNotifier {
  static LibraryState _instance;

  LibraryService _service;

  ValueNotifier<FutureOr<LibraryResponse>> _booksRef = ValueNotifier(null);
  ValueNotifier<FutureOr<BookDetail>> _bookRef = ValueNotifier(null);

  void resetState() {
    _bookRef.value = null;
    _booksRef.value = null;
  }

  LibraryState() {
    _service =
        AppConfig.isMock ? LibraryMockHttpService() : LibraryHttpService();
  }

  static LibraryState get instance {
    if (_instance == null) {
      _instance = LibraryState();
    }
    return _instance;
  }

  ValueNotifier<FutureOr<LibraryResponse>> get booksRef {
    if (_booksRef == null || _booksRef.value == null) {
      _booksRef = ValueNotifier(_service.getBooks());
    }
    return _booksRef;
  }

  ValueNotifier<FutureOr<BookDetail>> get bookRef {
    if (_bookRef == null || _bookRef.value == null) {
      _bookRef = ValueNotifier(_service.getBookDetail(null));
    }
    return _bookRef;
  }

  getBookDetail(String isbn) {
    _bookRef.value = _service.getBookDetail(isbn);
  }

  getBooks({String query}) {
    _booksRef.value = _service.getBooks(query: query);
  }
}
