class LanguageManager {
  static final LanguageManager _instance = LanguageManager._internal();
  factory LanguageManager() => _instance;
  LanguageManager._internal();

  Map<String, dynamic> _translations = {};

  void loadTranslations(Map<String, dynamic> json) {
    _translations = json;
  }

  /// Returns string value for a key, or key itself if not found
  String get(String key) {
    final value = _translations[key];
    if (value is String) return value;
    return key;
  }

  /// Returns list of strings for a key, or empty list if not found or not a list
  List<String> getList(String key) {
    final value = _translations[key];
    if (value is List) {
      return value.map((e) => e.toString()).toList();
    }
    return [];
  }
}