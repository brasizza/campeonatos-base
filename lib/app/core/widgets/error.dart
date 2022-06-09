import 'package:flutter/material.dart';

class ErrorWidgetCustom extends StatelessWidget {
  final String? text;
  const ErrorWidgetCustom({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outlined,
          color: Colors.red,
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
