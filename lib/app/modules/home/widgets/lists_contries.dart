import 'package:flutter/material.dart';
import 'package:tabela_brasileirao_serie_a/app/data/models/country_model.dart';
import 'package:tabela_brasileirao_serie_a/app/data/models/competition_model.dart';

class ListCountries extends StatelessWidget {
  final Map<Country, List<Competition>>? competitions;
  const ListCountries(this.competitions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _paises = competitions!.keys.toList();
    return GridView.builder(
      itemCount: _paises.length,
      itemBuilder: ((context, index) {
        final _pais = _paises[index];
        return InkWell(
          onTap: () => Navigator.pushNamed(context, '/competitions', arguments: {'competitions': competitions?[_pais], 'country': _pais}),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _pais.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                (_pais.flag == null)
                    ? const SizedBox.shrink()
                    : Image.network(
                        _pais.flag!,
                        errorBuilder: (context, error, stackTrace) => const Text('Sem bandeira.'),
                      )
              ],
            ),
          ),
        );
      }),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:tabela_brasileirao_serie_a/app/data/models/competition_model.dart';

// class ListCountries extends StatelessWidget {
//   final List<WorldCompetition> competitions;
//   const ListCountries(this.competitions, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: competitions.length,
//       itemBuilder: ((context, index) {
//         final _competition = competitions[index];
//         return ListTile(
//             // onTap: () => Navigator.pushNamed(context, '/leagues', arguments: _competition),
//             // leading: (_competition.country.flag == null)
//             //     ? const Icon(Icons.add_location_outlined)
//             //     : Image.network(
//             //         (_competition.country.flag!),
//             //       ),
//             // title: Text(
//             //   _competition.name,
//             //   style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//             // ),
//             // trailing: const Icon(
//             //   Icons.arrow_circle_right_rounded,
//             //   color: Colors.black,
//             // ),
//             );
//       }),
//     );
//   }
// }
