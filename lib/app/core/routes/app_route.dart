import 'package:flutter/material.dart';

import '../../data/models/competition_model.dart';
import '../../data/repositories/championship_repository_impl.dart';
import '../../data/repositories/competition_repository_impl.dart';
import '../../data/services/championship_service_impl.dart';
import '../../data/services/competition_service_impl.dart';
import '../../modules/competitions/competition_page.dart';
import '../../modules/home/controller/home_controller.dart';
import '../../modules/home/home_page.dart';
import '../../modules/leagues/controller/leagues_controller.dart';
import '../../modules/leagues/leagues_page.dart';
import '../../modules/splash/splash_page.dart';
import '../rest/dio/dio_rest_client.dart';
import '../widgets/error.dart';

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
