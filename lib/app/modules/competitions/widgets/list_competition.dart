import 'package:flutter/material.dart';
import 'package:tabela_brasileirao_serie_a/app/data/models/competition_model.dart';

class ListCompetition extends StatelessWidget {
  final List<Competition> competitions;
  const ListCompetition(this.competitions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: competitions.length,
      itemBuilder: ((context, index) {
        final _competition = competitions[index];
        return InkWell(
          onTap: () => Navigator.pushNamed(context, '/leagues', arguments: _competition),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    _competition.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
                (_competition.country.flag == null)
                    ? const SizedBox.shrink()
                    : Image.network(
                        _competition.country.flag!,
                        errorBuilder: (context, error, stackTrace) => const Text('Sem bandeira.'),
                      )
              ],
            ),
          ),
        );
      }),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
    );
  }
}
