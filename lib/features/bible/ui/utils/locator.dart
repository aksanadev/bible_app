class Locator {
  Locator._();
  static Locator? _instance;
  static init(Locator locator) => _instance ??= locator;
  static T getInstance<T extends Locator>() {
    assert(_instance != null, "$T hasn't been initialized yet");
    return _instance as T;
  }

  factory Locator() => _instance ??= Locator._();
  static void dispose() => _instance = null;
}
