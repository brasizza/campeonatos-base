import 'package:flutter/material.dart';
import 'package:tabela_brasileirao_serie_a/app/core/widgets/error.dart';
import 'package:tabela_brasileirao_serie_a/app/core/widgets/no_data.dart';
import 'package:tabela_brasileirao_serie_a/app/data/models/competition_model.dart';
import 'package:tabela_brasileirao_serie_a/app/data/repositories/competition_repository.dart';
import 'package:tabela_brasileirao_serie_a/app/data/repositories/competition_repository_impl.dart';
import 'package:tabela_brasileirao_serie_a/app/data/services/competition_service.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/home/home_controller.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/home/widgets/lists_contries.dart';

import '../../core/widgets/loading.dart';
import '../../data/models/country_model.dart';
import '../../data/services/competition_service_impl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(service: CompetitionServiceImpl.instance(repository: CompetitionRepositoryImpl.instance));
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Competições pelo mundo!'),
      ),
      body: FutureBuilder<Map<Country, List<Competition>>?>(
          future: controller.getCompetitions(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const LoadingWidgetCustom(text: 'Carregando as competições');
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return ErrorWidgetCustom(text: snapshot.error.toString());
                }
                if (!snapshot.hasData) {
                  return const NoDataWidgetCustom(text: 'Nenhuma competição encontrada');
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListCountries(snapshot.data),
                );
            }
          }),
    );
  }
}
