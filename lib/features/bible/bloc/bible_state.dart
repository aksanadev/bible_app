import 'package:bible_app/features/bible/models/bible_model.dart';

// class represents the current condition that a widget is in
class BibleState {
  List<BibleModel>? bibles;
  BibleModel? bible;

  BibleState({
    required this.bibles,
    this.bible,
  });

  BibleState copyWith({
    List<BibleModel>? bibles,
    BibleModel? bible,
  }) =>
      BibleState(
        bibles: bibles ?? this.bibles,
        bible: bible ?? this.bible,
      );
}
