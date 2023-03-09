import 'dart:async';
import 'dart:developer';

import 'package:bible_app/features/bible/bloc/bible_state.dart';
import 'package:bible_app/features/bible/bloc/bloc.dart';
import 'package:bible_app/features/bible/models/bible_model.dart';
import 'package:bible_app/features/bible/service/api.dart';
import 'package:bible_app/features/bible/ui/utils/service_locator.dart';

class BibleBloc implements Bloc {
  final _bibleStreamController = StreamController<BibleState>();
  late final BibleState _bibleState;
  BibleModel bible = BibleModel();

  //getter
  Stream<BibleState> get bibleStateStream => _bibleStreamController.stream;

  //initializes when bloc gets injected (upon go_route)
  BibleBloc() {
    final firstBible = BibleModel(id: '234', dblId: '234', name: 'NKJV');
    List<BibleModel> allBibles = List.empty(growable: true);
    allBibles.add(firstBible);
    _bibleState = BibleState(bibles: allBibles);
  }

  Future<void> getAllBibles() async {
    try {
      final bibles = await ServiceLocator()
          .bibleRepository
          .getAllBibles(method: RestMethod.get, path: '');
      final allBibles = _bibleState.copyWith(bibles: bibles);
      _bibleStreamController.add(allBibles);
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
