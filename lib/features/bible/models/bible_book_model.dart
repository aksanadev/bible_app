import 'package:bible_app/features/bible/models/bible_model.dart';

class BibleBookModel extends BibleModel {
  String? chapterId;

  BibleBookModel({
    name,
    required this.chapterId,
  }) : super(id: chapterId);
}
