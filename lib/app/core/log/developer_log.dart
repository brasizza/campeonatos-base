import 'dart:developer';

class Developer {
  static void logInstance(dynamic instance) {
    log('Start the ${instance.runtimeType} instance');
  }

  Developer._();
}
