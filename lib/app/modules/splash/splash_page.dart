import 'package:flutter/material.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/splash/controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = SplashController();

  @override
  void initState() {
    super.initState();
    controller.getData().then((complete) {
      if (complete == true) {
        Navigator.of(context).popAndPushNamed('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/splash.jpg',
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "PARTIDAS DE FUTEBOL PELO MUNDO",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "AGUARDE O CARREGAMENTO",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              CircularProgressIndicator.adaptive(),
            ],
          ),
        ],
      ),
    );
  }
}
