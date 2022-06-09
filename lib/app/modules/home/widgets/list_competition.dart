import 'package:flutter/material.dart';
import 'package:tabela_brasileirao_serie_a/app/data/models/competition_model.dart';

class ListCompetition extends StatelessWidget {
  final List<Competition> competitions;
  const ListCompetition(this.competitions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: competitions.length,
      itemBuilder: ((context, index) {
        final _competition = competitions[index];
        return ListTile(
          onTap: () => Navigator.pushNamed(context, '/leagues', arguments: _competition),
          leading: (_competition.country.flag == null)
              ? const Icon(Icons.add_location_outlined)
              : Image.network(
                  (_competition.country.flag!),
                ),
          title: Text(
            _competition.name,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(
            Icons.arrow_circle_right_rounded,
            color: Colors.black,
          ),
        );
      }),
    );
  }
}
