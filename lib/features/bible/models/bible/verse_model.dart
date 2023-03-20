import 'package:bible_app/features/bible/models/bible/chapter_model.dart';

class VerseModel extends ChapterModel {
  String verseId; //GEN.1.1
  String? verseName; //Genesis 1:1 ("reference")
  String? verseNumber; //"1" ("verseCount")
  String? text; //"in the beginning..."

  VerseModel({
    required bibleId,
    required bookId,
    required chapterId,
    String? bibleVersion,
    String? chapterName,
    String? chapterNumber,
    required this.verseId,
    this.verseName,
    this.verseNumber,
    this.text,
  }) : super(
            bibleId: bibleId,
            bookId: bookId,
            chapterId: chapterId,
            chapterName: chapterName,
            chapterNumber: chapterNumber);

  factory VerseModel.fromJson(Map<String, dynamic> json) => VerseModel(
        bibleId: json['bibleId'],
        bookId: json['bookId'],
        chapterId: json['chapterId'],
        verseId: json['id'],
        verseName: json['reference'],
        verseNumber: json['verseCount'],
        text: json['content'],
      );

  @override
  VerseModel copyWith({
    String? bibleVersion,
    String? bibleId,
    String? bookId,
    String? chapterId,
    String? chapterName,
    String? chapterNumber,
    String? verseId,
    String? verseName,
    String? verseNumber,
    String? text,
  }) =>
      VerseModel(
        bibleVersion: bibleVersion ?? bibleVersion,
        bibleId: bibleId ?? this.bibleId,
        bookId: bookId ?? this.bookId,
        chapterId: chapterId ?? this.chapterId,
        chapterName: chapterName ?? this.chapterName,
        chapterNumber: chapterNumber ?? this.chapterNumber,
        verseId: verseId ?? this.verseId,
        verseName: verseName ?? this.verseName,
        verseNumber: verseNumber ?? this.verseNumber,
        text: text ?? this.text,
      );
}
