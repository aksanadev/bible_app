import 'package:bible_app/features/bible/models/bible_model.dart';

class BibleBook extends BibleModel {
  String? chapterId;

  BibleBook({
    name,
    required this.chapterId,
  }) : super(id: chapterId);
}
