import 'package:flutter/material.dart';
import 'package:Schange/DashboardPage.dart';

class PasswordReset extends StatelessWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Password reset"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/login');
          },
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          color: const Color(0xffffffff),
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.08,
              right: MediaQuery.of(context).size.width * 0.08,
              top: MediaQuery.of(context).size.height * 0.10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.03),
                child: Image.asset(
                  "images/logo_principal.png",
                  width: MediaQuery.of(context).size.width * 0.35,
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Don't worry!\nWe will send you an email with instructions",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.5,
                      color: Theme.of(context).primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.03),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff023047)),
                  color: const Color(0x44E3F2FD),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  autofocus: false,
                  style: const TextStyle(color: Color(0xff023047)),
                  decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Color(0xff023047)),
                      fillColor: const Color(0xff023047),
                      hintText: 'Mail',
                      prefixIcon: const Icon(
                        Icons.mail_outline,
                        color: Color(0xff023047),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02) +
                          EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).size.height * 0.02)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.005),
                width: MediaQuery.of(context).size.height * 0.2,
                child: ElevatedButton(
                  child: const Text('SEND EMAIL'),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff219EBC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    FocusScope.of(context)
                        .unfocus(); // Que no abra el teclado al volver al login
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardPage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xffffffff),
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.04,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(0),
        child: const Text(
          "Schange (C) - Políticas de privacidad",
          style: TextStyle(
            color: Color(0xff023047),
          ),
        ),
      ),
    );
  }
}
