import 'dart:async';

import 'package:bible_app/features/bible/bloc/bible_state.dart';
import 'package:bible_app/features/bible/bloc/bloc.dart';
import 'package:bible_app/features/bible/models/bible_model.dart';
import 'package:bible_app/features/bible/service/api.dart';
import 'package:bible_app/features/bible/ui/utils/service_locator.dart';

class BibleBloc implements Bloc {
  final _bibleStreamController = StreamController<BibleState>();
  late final BibleState _bibleState;

  //getter
  Stream<BibleState> get bibleStateStream => _bibleStreamController.stream;

  //initializes when bloc gets injected (upon go_route)
  BibleBloc() {
    final initialBible = BibleModel(id: '', dblId: '', name: '');
    List<BibleModel> initialBibles = [];
    initialBibles.add(initialBible);
    _bibleState = BibleState(bibles: initialBibles);
  }

  Future<void> getAllBibles() async {
    final bibles = await ServiceLocator()
        .bibleRepository
        .getAllBibles(method: RestMethod.get, path: '');

    //add bibles to streamController
    final allBibles = _bibleState.copyWith(bibles: bibles);
    _bibleStreamController.add(allBibles);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
