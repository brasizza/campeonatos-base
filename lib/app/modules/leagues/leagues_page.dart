import 'package:flutter/material.dart';
import 'package:tabela_brasileirao_serie_a/app/data/models/competition_model.dart';

class LeaguesPage extends StatefulWidget {
  // final dynamic args;
  const LeaguesPage({Key? key}) : super(key: key);

  @override
  State<LeaguesPage> createState() => _LeaguesPageState();
}

class _LeaguesPageState extends State<LeaguesPage> {
  @override
  Widget build(BuildContext context) {
    final Competition? competition = ModalRoute.of(context)?.settings.arguments as Competition;
    return Scaffold(
      appBar: AppBar(
        title: (competition?.name == null) ? SizedBox() : Text(competition!.name),
      ),
      body: Container(child: Text(competition.toString())),
    );
  }
}
