import 'package:flutter/material.dart';

class LoadingWidgetCustom extends StatelessWidget {
  final String? text;
  const LoadingWidgetCustom({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator.adaptive(),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Text(text ?? 'Carregando ....'),
        ),
      ],
    ));
  }
}
