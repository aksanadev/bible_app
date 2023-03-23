import 'dart:async';
import 'dart:developer';

import 'package:bible_app/features/bible/bloc/bible_state.dart';
import 'package:bible_app/features/bible/bloc/bloc.dart';
import 'package:bible_app/features/bible/service/api.dart';
import 'package:bible_app/features/bible/ui/utils/service_locator.dart';

class BibleBloc implements Bloc {
  final _bibleStreamController = StreamController<BibleState>();

  //getter
  Stream<BibleState> get bibleStateStream => _bibleStreamController.stream;

  //vars
  final bibleRepo = ServiceLocator().bibleRepository;

  //initializes when bloc gets injected (upon go_route)
  BibleBloc() {
    // getBibleVersions();
    getBibleBooks();
  }

// BIBLE VERSIONS
  Future<void> getBibleVersions() async {
    try {
      final bibleVersions =
          await bibleRepo.getBibleVersions(method: RestMethod.get, path: '');
      _bibleStreamController.add(BibleState(bibleVersions: bibleVersions)
          .copyWith(bibleVersions: bibleVersions));
      log('got versions');
    } catch (e) {
      log('Could not get Bible versions\n\n${e.toString()}');
    }
  }

  Future<void> getBibleVersion(String bibleId) async {
    try {
      final bibleVersion = await bibleRepo.getBibleVersion(
          method: RestMethod.get, path: '/$bibleId/books');
      _bibleStreamController
          .add(BibleState().copyWith(bibleVersion: bibleVersion));
      log('Bible Version Chose: $bibleId');
    } catch (e) {
      log('Could not get this version:$bibleId\n\n${e.toString()}');
    }
  }

// BIBLE BOOKS
  Future<void> getBibleBooks({String? bibleId}) async {
    try {
      final bibleBooks = await bibleRepo.getBibleBooks(
          method: RestMethod.get, path: '/de4e12af7f28f599-01/books');
      _bibleStreamController.add(
          BibleState(bibleBooks: bibleBooks).copyWith(bibleBooks: bibleBooks));
      log('got versions');
    } catch (e) {
      log('Could not get Bible versions\n\n${e.toString()}');
    }
  }

  Future<void> getBibleBook(String bibleId, String book) async {
    try {
      final bibleBook = await bibleRepo.getBibleBook(
          method: RestMethod.get, path: '/$bibleId/books');
      _bibleStreamController.add(BibleState().copyWith(bibleBook: bibleBook));
      log('Bible Book Chose: $book');
    } catch (e) {
      log('Could not get this Book:$book\n\n${e.toString()}');
    }
  }

  @override
  void dispose() {
    _bibleStreamController.close();
  }
}
