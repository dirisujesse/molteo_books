import 'dart:async';
import 'package:molteo_books/models/http/response/library_response_models.dart';

abstract class LibraryService {
  FutureOr<LibraryResponse> getBooks({String query});
  FutureOr<BookDetail> getBookDetail(String isbn);
}
