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

  //initializes when bloc gets injected (upon go_route)
  BibleBloc() {
    getAllBibles();
  }

  Future<void> getAllBibles() async {
    try {
      final bibles = await ServiceLocator()
          .bibleRepository
          .getAllBibles(method: RestMethod.get, path: '');
      _bibleStreamController
          .add(BibleState(bibles: bibles).copyWith(bibles: bibles));
      log('added bibles');
    } catch (e) {
      log('Could not get Bibles\n\n${e.toString()}');
    }
  }

  @override
  void dispose() {
    _bibleStreamController.close();
  }
}
