import 'package:bible_app/features/bible/repository/bible_repository.dart';
import 'package:bible_app/features/bible/service/api.dart';
import 'package:bible_app/features/bible/ui/utils/locator.dart';

class ServiceLocator implements Locator {
  ServiceLocator._();
  factory ServiceLocator() {
    Locator.init(ServiceLocator._());
    return Locator.getInstance();
  }
  static void dispose() => Locator.dispose();

  RestAPI api = RestAPI();

  BibleRepository bibleRepository = BibleRepository();
}