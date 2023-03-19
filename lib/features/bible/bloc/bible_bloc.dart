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
  final biblesRepo = ServiceLocator().bibleRepository;

  //initializes when bloc gets injected (upon go_route)
  BibleBloc() {
    // getAllBibles();
    getBooksOfTheBible();
    // getBook();
  }

  Future<void> getAllBibles() async {
    try {
      final bibles =
          await biblesRepo.getAllBibles(method: RestMethod.get, path: '');
      _bibleStreamController
          .add(BibleState(bibles: bibles).copyWith(bibles: bibles));
      log('added bibles');
    } catch (e) {
      log('Could not get Bibles\n\n${e.toString()}');
    }
  }

  Future<void> getBooksOfTheBible() async {
    try {
      final books = await biblesRepo.getAllBibles(
          method: RestMethod.get, path: '/de4e12af7f28f599-01/books');
      _bibleStreamController.add(BibleState(bibles: books));
    } catch (e) {
      log('Could not get the Book of that Bible\n\n${e.toString()}');
    }
  }

  Future<void> getBook() async {
    try {
      final books = await biblesRepo.getAllBibles(
          method: RestMethod.get,
          path: '/de4e12af7f28f599-01/books/GEN/chapters');
      _bibleStreamController.add(BibleState(bibles: books));
    } catch (e) {
      log('Could not get the Book of that Bible\n\n${e.toString()}');
    }
  }

  @override
  void dispose() {
    _bibleStreamController.close();
  }
}
