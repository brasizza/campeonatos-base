import 'package:flutter/material.dart';

import '../rest/dio/dio_rest_client.dart';
import 'routes.dart';

class AppRoute extends Route {
  static Route<dynamic> routes(RouteSettings settings) {
    final DioRestClient rest = DioRestClient.instance;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) {
            return const SplashPage();
          },
        );

      case '/home':
        final repository = CompetitionRepositoryImpl.instance(restClient: rest);
        final service = CompetitionServiceImpl.instance(repository: repository);
        final controller = HomeController.instance(service: service);
        return MaterialPageRoute(
          builder: (context) {
            return HomePage(
              controller: controller,
              arguments: settings.arguments,
            );
          },
        );

      case '/competitions':
        final arguments = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) {
            return CompetitionPage(
              competitions: arguments['competitions'] ?? [],
              country: arguments['country'],
              // arguments: settings.arguments,
            );
          },
        );

      case '/leagues':
        final competiton = settings.arguments as Competition;
        final repository = ChampionshipRepositoryImpl.instance(restClient: rest);
        final service = ChampionshipServiceImpl.instance(repository: repository);
        final controller = LeaguesController.instance(service: service)..competition = competiton;
        return MaterialPageRoute(
          builder: (context) {
            return LeaguesPage(
              controller: controller,
            );
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const ErrorWidgetCustom(text: 'Rota não encontrada');
          },
        );
    }
  }
}
