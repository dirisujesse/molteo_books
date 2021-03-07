import 'dart:async';

import 'package:dio/dio.dart';
import 'package:molteo_books/models/http/response/library_response_models.dart';
import 'package:molteo_books/services/http/base_http.dart';
import 'package:molteo_books/services/http/library/library_contract.dart';
import 'package:molteo_books/services/repository/repository_service.dart';

class LibraryHttpService extends MbHttpService
    with CacheService
    implements LibraryService {
  ///
  /// ### LibraryHttpService getBooks
  ///
  /// Getbooks serves to retrieve a list of books from the API
  /// It optionally takes a `String` argument
  /// When provided getBooks calls the `/search` endpoint to get books matching the string
  /// Otherwise it call the `/new` books enedpoint
  ///
  @override
  FutureOr<LibraryResponse> getBooks({String query}) async {
    try {
      final path = query == null || query.isEmpty ? "/new" : "/search/$query";
      final req = await http.get(path);
      cacheResponse(req);
      return LibraryResponse.fromJson(Map.from(req.data));
    } on DioError catch (e) {
      try {
        final cacheData = await fetch(e);
        return LibraryResponse.fromJson(Map.from(cacheData));
      } catch (error) {
        throw error;
      }
    }
  }

  ///
  /// ### LibraryHttpService getBooks
  ///
  /// Getbooks serves to retrieve a list of books from the API
  /// It optionally takes a `String` argument
  /// When provided getBooks calls the `/search` endpoint to get books matching the string
  /// Otherwise it call the `/new` books enedpoint
  ///
  @override
  FutureOr<BookDetail> getBookDetail(String isbn) async {
    if (isbn == null || isbn.isEmpty) return null;
    try {
      final req = await http.get("/books/$isbn");
      cacheResponse(req);
      return BookDetail.fromJson(Map.from(req.data));
    } on DioError catch (e) {
      try {
        final cacheData = await fetch(e);
        return BookDetail.fromJson(Map.from(cacheData));
      } catch (error) {
        throw error;
      }
    }
  }
}
