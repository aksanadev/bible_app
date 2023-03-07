import 'package:bible_app/features/bible/models/bible_model.dart';

// class represents the current condition that a widget is in
class BibleState {
  List<BibleModel> bibles;
  BibleModel? bible;
  String id;
  String dblId;
  String name;

  BibleState({
    required this.bibles,
    this.bible,
    this.id = '',
    this.dblId = '',
    this.name = '',
  });

  BibleState copyWith({
    List<BibleModel>? bibles,
    BibleModel? bible,
    String? id,
    String? dblId,
    String? name,
  }) =>
      BibleState(
        bibles: bibles ?? this.bibles,
        bible: bible ?? this.bible,
        id: id ?? this.id,
        dblId: dblId ?? this.dblId,
        name: name ?? this.name,
      );
}
