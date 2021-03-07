import 'dart:async';

import 'package:flutter/foundation.dart' show ChangeNotifier, ValueNotifier;
import 'package:flutter/widgets.dart' show BuildContext, Navigator;

import 'package:molteo_books/models/config/app_config.dart';
import 'package:molteo_books/models/enums/screen_type.dart';
import 'package:molteo_books/models/http/response/library_response_models.dart';
import 'package:molteo_books/services/http/library/library_contract.dart';
import 'package:molteo_books/services/http/library/library_http_service.dart';
import 'package:molteo_books/services/http/library/library_mock_http_service.dart';
import 'package:molteo_books/values/routes.dart';

class LibraryState extends ChangeNotifier {
  static LibraryState _instance;

  LibraryService _service;

  ValueNotifier<Future<LibraryResponse>> _booksRef = ValueNotifier(null);
  ValueNotifier<Future<BookDetail>> _bookRef = ValueNotifier(null);
  ValueNotifier<Book> _selectedBook = ValueNotifier(null);

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

  ValueNotifier<Book> get selectedBook {
    return _selectedBook;
  }

  ValueNotifier<Future<LibraryResponse>> get booksRef {
    if (_booksRef == null || _booksRef.value == null) {
      _booksRef = ValueNotifier(_getBooks());
    }
    return _booksRef;
  }

  ValueNotifier<Future<BookDetail>> get bookRef {
    if (_bookRef == null || _bookRef.value == null) {
      _bookRef = ValueNotifier(_getBook());
    }
    return _bookRef;
  }

  getBookDetail(Book book, {BuildContext context, ScreenType screenType}) {
    _bookRef.value = _getBook(isbn: book.isbn13);
    _selectedBook.value = book;
    if ((screenType != null && screenType == ScreenType.MOBILE) && context != null) {
      Navigator.of(context).pushNamed(MbRoutes.bookDetail);
    }
  }

  getBooks({String query}) {
    _booksRef.value = _getBooks(query: query);
    _selectedBook.value = null;
  }

  Future<LibraryResponse> _getBooks({String query}) async {
    try {
      final data = _service.getBooks(query: query);
      return data;
    } catch (e) {
      throw e;
    }
  }

  Future<BookDetail> _getBook({String isbn}) async {
    try {
      final data = _service.getBookDetail(isbn);
      return data;
    } catch (e) {
      throw e;
    }
  }
}
