import 'dart:async';

import 'package:dio/dio.dart';
import 'package:molteo_books/models/http/response/library_response_models.dart';
import 'package:molteo_books/services/http/library/library_contract.dart';
import 'package:molteo_books/utils/helpers.dart';
import 'package:molteo_books/values/json.dart';

class LibraryMockHttpService implements LibraryService {
  @override
  FutureOr<LibraryResponse> getBooks({String query}) {
    try {
      LibraryResponse data = LibraryResponse.fromJson(mockLibraryData);
      if (query == null || query.isEmpty) return data;
      data.books = data.books.where((it) => contains(it.title, query)).toList();
      return data;
    } on DioError catch (e) {
      throw e;
    }
  }

  @override
  FutureOr<BookDetail> getBookDetail(String isbn) {
    if (isbn == null || isbn.isEmpty) return null;
    try {
      return BookDetail.fromJson(mockBookDetail);
    } on DioError catch (e) {
      throw e;
    }
  }
}
