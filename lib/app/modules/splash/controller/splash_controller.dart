class SplashController {
  Future<bool> getData() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
