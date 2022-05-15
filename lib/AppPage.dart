import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Image(
            image: AssetImage("images/logo_principal.png"),
          ),
          const Text("Your exchange to Spain, in company"),
          const Text("Loading...",
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'Sniglet',
              )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: const Text("Boton provisional a home"),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/home',
                  arguments: "prueba",
                );
              })
        ],
      )),
    );
  }
}
