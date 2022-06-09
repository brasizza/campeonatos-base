import 'package:flutter/material.dart';
import 'package:tabela_brasileirao_serie_a/app/core/widgets/error.dart';
import 'package:tabela_brasileirao_serie_a/app/core/widgets/no_data.dart';
import 'package:tabela_brasileirao_serie_a/app/data/models/competition_model.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/home/home_controller.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/home/widgets/list_competition.dart';

import '../../core/widgets/loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

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
      body: FutureBuilder<List<Competition>?>(
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
                return ListCompetition(snapshot.data!);
            }
          }),
    );
  }
}
