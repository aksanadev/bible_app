import 'package:bible_app/features/bible/models/bible/version_model.dart';

class BookModel extends VersionModel {
  String bookId;

  BookModel({
    required bibleId, //de4e12af7f28f599-01
    required this.bookId, //GEN
    String? bibleVersion, //The NKJV version
  }) : super(bibleId: bibleId, bibleVersion: bibleVersion);

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        bibleId: json['bibleId'],
        bookId: json['id'],
      );

  @override
  BookModel copyWith({
    String? bibleId,
    String? bibleVersion,
    String? bookId,
  }) =>
      BookModel(
        bookId: bookId ?? this.bookId,
        bibleId: bibleId ?? this.bibleId,
        bibleVersion: bibleVersion ?? this.bibleVersion,
      );
}
