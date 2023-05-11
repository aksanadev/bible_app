import 'dart:async';
import 'dart:developer';

import 'package:bible_app/features/bible/bloc/bible_state.dart';
import 'package:bible_app/features/bible/bloc/bloc.dart';
import 'package:bible_app/features/bible/service/rest_api.dart';
import 'package:bible_app/features/bible/ui/utils/service_locator.dart';
import 'package:bible_app/utils/app/bloc/loading_state.dart';

class BibleBloc implements Bloc {
  final _bibleStreamController = StreamController<BibleState>.broadcast();

  //getter
  Stream<BibleState> get bibleStateStream => _bibleStreamController.stream;

  //vars
  final bibleRepo = ServiceLocator().bibleRepository;

  late BibleState _bibleState;
  late LoadingState _loadingState;

  //initializes when bloc gets injected (upon go_route)
  BibleBloc() {
    _bibleState = BibleState();
    _loadingState = LoadingState(isLoading: false);
  }

// BIBLE VERSIONS
  Future<void> getBibleVersions() async {
    try {
      var loadingState = _loadingState.copywith(isLoading: true);
      final bibleState = _bibleState.copyWith(
          loadingState:
              loadingState); //configuring the BibleState MODEL to add to the stream later
      _bibleStreamController.sink
          .add(bibleState); //adding the configured MODEL to update the stream

      final bibleVersions =
          await bibleRepo.getBibleVersions(method: RestMethod.get, path: '');

      loadingState = _loadingState.copywith(isLoading: false);
      _bibleState =
          BibleState(bibleVersions: bibleVersions, loadingState: loadingState);
      _bibleStreamController.sink.add(_bibleState);
      log('got versions');
    } catch (e) {
      log('Could not get Bible versions\n\n${e.toString()}');
    }
  }

  Future<void> getBibleVersion(String bibleId) async {
    try {
      final bibleVersion = await bibleRepo.getBibleVersion(
          method: RestMethod.get, path: '/$bibleId/books');
      _bibleStreamController.sink
          .add(BibleState().copyWith(bibleVersion: bibleVersion));
      log('Bible Version Chose: $bibleId');
    } catch (e) {
      log('Could not get this version:$bibleId\n\n${e.toString()}');
    }
  }

// BIBLE BOOKS
  Future<void> getBibleBooks({required String bibleId}) async {
    try {
      final bibleBooks = await bibleRepo.getBibleBooks(
          method: RestMethod.get, path: '/$bibleId/books');
      var books = _bibleState.copyWith(bibleBooks: bibleBooks);
      _bibleStreamController.sink.add(books);
      log('got books of the Bible');
    } catch (e) {
      log('Could not get Bible books\n\n${e.toString()}');
    }
  }

  Future<void> getBibleBook(String bibleId, String book) async {
    try {
      final bibleBook = await bibleRepo.getBibleBook(
          method: RestMethod.get, path: '/$bibleId/books');
      _bibleStreamController.add(BibleState().copyWith(bibleBook: bibleBook));
      log('Chosen book from the Bible: $book');
    } catch (e) {
      log('Could not get this Book:$book\n\n${e.toString()}');
    }
  }

  @override
  void dispose() {
    _bibleStreamController.close();
  }
}
