import 'package:flutter/material.dart';
import '../../app/core/rest/dio/dio_rest_client.dart';
import 'app/data/models/competition_model.dart';
import 'app/data/repositories/championship_repository.dart';
import 'app/data/repositories/championship_repository_impl.dart';
import 'app/data/repositories/competition_repository.dart';
import 'app/data/repositories/competition_repository_impl.dart';
import 'app/data/services/championship_service.dart';
import 'app/data/services/championship_service_impl.dart';
import 'app/data/services/competition_service.dart';
import 'app/data/services/competition_service_impl.dart';
import '../../app/modules/competitions/competition_page.dart';
import '../../app/modules/home/controller/home_controller.dart';
import '../../app/modules/home/home_page.dart';
import '../../app/modules/leagues/leagues_page.dart';
import '../../app/modules/splash/splash_page.dart';
import 'app/modules/leagues/controller/leagues_controller.dart';

void main() {
  final DioRestClient rest = DioRestClient.instance;
  // final HttpRestClient _rest = HttpRestClient.instance;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/':
          return MaterialPageRoute(
            builder: (context) {
              return const SplashPage();
            },
          );

        case '/home':
          final CompetitionRepository repository = CompetitionRepositoryImpl.instance(restClient: rest);
          final CompetitionService service = CompetitionServiceImpl.instance(repository: repository);
          final HomeController controller = HomeController.instance(service: service);
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
          final ChampionshipRepository repository = ChampionshipRepositoryImpl.instance(restClient: rest);
          final ChampionshipService service = ChampionshipServiceImpl.instance(repository: repository);
          final LeaguesController controller = LeaguesController.instance(service: service)..competition = competiton;
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
              return const Text('SEM ROTA!');
            },
          );
      }
    },
  ));
}
