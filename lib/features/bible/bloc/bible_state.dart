import 'package:bible_app/features/bible/models/bible/book_model.dart';
import 'package:bible_app/features/bible/models/bible/chapter_model.dart';
import 'package:bible_app/features/bible/models/bible/verse_model.dart';
import 'package:bible_app/features/bible/models/bible/version_model.dart';
import 'package:bible_app/utils/app/bloc/loading_state.dart';

// class represents the current condition that a widget is in
class BibleState {
  List<VersionModel>? bibleVersions;
  VersionModel? bibleVersion;
  List<BookModel>? bibleBooks;
  BookModel? bibleBook;
  ChapterModel? chapter;
  VerseModel? verse;
  LoadingState? loadingState;

  BibleState({
    this.bibleVersions,
    this.bibleVersion,
    this.bibleBooks,
    this.bibleBook,
    this.chapter,
    this.verse,
    this.loadingState,
  });

  BibleState copyWith({
    List<VersionModel>? bibleVersions,
    VersionModel? bibleVersion,
    List<BookModel>? bibleBooks,
    BookModel? bibleBook,
    ChapterModel? chapter,
    VerseModel? verse,
    LoadingState? loadingState,
  }) =>
      BibleState(
        bibleVersions: bibleVersions ?? this.bibleVersions,
        bibleVersion: bibleVersion ?? this.bibleVersion,
        bibleBooks: bibleBooks ?? this.bibleBooks,
        bibleBook: bibleBook ?? this.bibleBook,
        chapter: chapter ?? this.chapter,
        verse: verse ?? this.verse,
        loadingState: loadingState ?? this.loadingState,
      );
}
