import 'package:bible_app/features/bible/models/bible/book_model.dart';

class ChapterModel extends BookModel {
  String chapterId;
  String? chapterName;
  String? chapterNumber;

  ChapterModel({
    required bibleId, //de4e12af7f28f599-01
    required bookId, //GEN
    bibleVerson = 'NKJV', //
    required this.chapterId, //GEN.1
    this.chapterName, // Genesis 1:1 ("reference")
    this.chapterNumber, //"1"
  }) : super(bibleId: bibleId, bookId: bookId);

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
        bibleId: json['bibleId'],
        bookId: json['bookId'],
        chapterId: json['id'],
        chapterName: json['reference'],
        chapterNumber: json['number'],
      );

  @override
  ChapterModel copyWith({
    String? bibleId,
    String? bibleVersion,
    String? bookId,
    String? chapterId,
    String? chapterName,
    String? chapterNumber,
  }) =>
      ChapterModel(
        bibleId: bibleId ?? this.bibleId,
        bibleVerson: bibleVersion ?? bibleVersion,
        bookId: bookId ?? this.bookId,
        chapterId: chapterId ?? this.chapterId,
        chapterName: chapterName ?? this.chapterName,
        chapterNumber: chapterNumber ?? this.chapterNumber,
      );
}
