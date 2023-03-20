import 'package:bible_app/features/bible/models/bible/book_model.dart';
import 'package:bible_app/features/bible/models/bible/chapter_model.dart';
import 'package:bible_app/features/bible/models/bible/verse_model.dart';
import 'package:bible_app/features/bible/models/bible/version_model.dart';
import 'package:bible_app/features/bible/models/bible_model.dart';

// class represents the current condition that a widget is in
class BibleState {
  // List<BibleModel>? bibles;
  // BibleModel? bible;
  VersionModel version;
  BookModel book;
  ChapterModel chapter;
  VerseModel verse;

  BibleState({
    // required this.bibles,
    required this.version,
    required this.book,
    required this.chapter,
    required this.verse,
  });

  BibleState copyWith({
    // List<BibleModel>? bibles,
    // BibleModel? bible,
    VersionModel? version,
    BookModel? book,
    ChapterModel? chapter,
    VerseModel? verse,
  }) =>
      BibleState(
        // bibles: bibles ?? this.bibles,
        // bible: bible ?? this.bible,
        version: version ?? this.version,
        book: book ?? this.book,
        chapter: chapter ?? this.chapter,
        verse: verse ?? this.verse,
      );
}
