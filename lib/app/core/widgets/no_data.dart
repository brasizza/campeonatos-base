import 'package:flutter/material.dart';

class NoDataWidgetCustom extends StatelessWidget {
  final String? text;
  const NoDataWidgetCustom({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add_chart_sharp,
          color: Colors.green,
          size: 80,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Text(text ?? 'Carregando ....'),
        ),
      ],
    ));
  }
}
