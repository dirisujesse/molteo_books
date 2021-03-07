class AppConfig {
  static bool _isMock;
  
  static init({bool isMock = true}) {
    _isMock = true;
  }

  static bool get isMock {
    return _isMock ?? true;
  }
}