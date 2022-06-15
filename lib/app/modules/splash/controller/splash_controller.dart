class SplashController {
  Future<bool> getData() async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }
}
