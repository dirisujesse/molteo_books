import 'dart:convert';

LibraryResponse libraryResponseFromJson(String str) =>
    LibraryResponse.fromJson(json.decode(str));

String libraryResponseToJson(LibraryResponse data) =>
    json.encode(data.toJson());

class LibraryResponse {
  LibraryResponse({
    this.total,
    this.page,
    this.error,
    this.books,
  });

  int total;
  int page;
  int error;
  List<Book> books;

  LibraryResponse.fromJson(Map<String, dynamic> json)
      : total = int.tryParse(json["total"]),
        page = int.tryParse(json["page"]),
        error = int.tryParse(json["error"]),
        books = List<Book>.from(
          json["books"].map(
            (x) => Book.fromJson(x),
          ),
        );

  Map<String, dynamic> toJson() {
    return {
      "total": total,
      "page": page,
      "books": List<dynamic>.from(books.map((x) => x.toJson())),
    };
  }
}

class Book {
  Book({
    this.title,
    this.subtitle,
    this.isbn13,
    this.price,
    this.image,
    this.url,
  });

  String title;
  String subtitle;
  String isbn13;
  String price;
  String image;
  String url;

  Book.fromJson(Map json)
      : title = json["title"],
        subtitle = json["subtitle"],
        isbn13 = json["isbn13"],
        price = json["price"],
        image = json["image"],
        url = json["url"];

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "subtitle": subtitle,
      "isbn13": isbn13,
      "price": price,
      "image": image,
      "url": url,
    };
  }
}

BookDetail bookDetailFromJson(String str) => BookDetail.fromJson(json.decode(str));

String bookDetailToJson(BookDetail data) => json.encode(data.toJson());

class BookDetail {
    BookDetail({
        this.error,
        this.title,
        this.subtitle,
        this.authors,
        this.publisher,
        this.language,
        this.isbn10,
        this.isbn13,
        this.pages,
        this.year,
        this.rating,
        this.desc,
        this.price,
        this.image,
        this.url,
        this.pdf,
    });

    String error;
    String title;
    String subtitle;
    String authors;
    String publisher;
    String language;
    String isbn10;
    String isbn13;
    String pages;
    String year;
    String rating;
    String desc;
    String price;
    String image;
    String url;
    Map pdf;

    BookDetail.fromJson(Map json) :
        error = json["error"],
        title = json["title"],
        subtitle = json["subtitle"],
        authors = json["authors"],
        publisher = json["publisher"],
        language = json["language"],
        isbn10 = json["isbn10"],
        isbn13 = json["isbn13"],
        pages = json["pages"],
        year = json["year"],
        rating = json["rating"],
        desc = json["desc"],
        price = json["price"],
        image = json["image"],
        url = json["url"],
        pdf = json["pdf"];

    Map<String, dynamic> toJson() {
      return {
        "error": error,
        "title": title,
        "subtitle": subtitle,
        "authors": authors,
        "publisher": publisher,
        "language": language,
        "isbn10": isbn10,
        "isbn13": isbn13,
        "pages": pages,
        "year": year,
        "rating": rating,
        "desc": desc,
        "price": price,
        "image": image,
        "url": url,
        "pdf": pdf,
    };
    }
}

