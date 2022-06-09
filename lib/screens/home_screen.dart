import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Widget> card = List.generate(20, (index) => const TeamCard());

  final url = 'https://www.scorebat.com/api/competition/2/brasil-serie-a';
  var _list = [];
  var imageLink = 'https://s3.amazonaws.com/bookmkrs/img/logos/mini/';

  void teams() async {
    try {
      final response = await http.get(Uri.parse(url));
      final json = jsonDecode(response.body);
      Map<String, dynamic> dados = json;
      final mapCampeonato = dados['response']['standings']['rows'];
      _list = mapCampeonato;
    } catch (e) {}
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    teams();
  }

  String titulo = 'Campeonato Brasileiro 2022';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, i) {
              final tabela = _list[i];
              // return ExpansionTile(title: Text('Teste'));
              return CardTeam(tabela: tabela, imageLink: imageLink);
            }),
      ),
    );
  }
}

class CardTeam extends StatelessWidget {
  CardTeam({
    Key? key,
    required this.tabela,
    required this.imageLink,
  }) : super(key: key);

  var tabela;
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        children: [
          SizedBox(
            height: 30,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _textExpanded('Vitórias', 'w', Colors.green.shade600),
                  _textExpanded('Empates', 'd', Colors.grey.shade600),
                  _textExpanded('Derrotas', 'l', Colors.red.shade600),
                ],
              ),
            ),
          )
        ],
        trailing: Text(
          '${tabela['pnt']}',
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        title: Text(
          tabela['team'],
          style: const TextStyle(fontWeight: FontWeight.w900),
        ),
        subtitle: Text(
          'Jogos: ${tabela['p']}',
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Image.network('${imageLink + tabela['teamScId']}.png'),
        ),
      ),
    );
  }

  Text _textExpanded(String texto, String titulo, Color color) {
    return Text(
      '$texto: ${tabela[titulo]}',
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: color),
    );
  }
}
