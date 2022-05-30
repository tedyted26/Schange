import 'package:Schange/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:Schange/DashboardPage.dart';

import 'PasswordReset.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final mail = "lauralevy@mail.com";
  final password = "pass123";
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffffffff),
        padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.08) +
            EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.08) +
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.05),
              child: Image.asset(
                "images/logo_principal.png",
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ),
            isVisible
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.025,
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.01),
                    child: Text(
                      "Mail or password incorrect",
                      style: TextStyle(color: Theme.of(context).errorColor),
                    ))
                : Container(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.03),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff023047)),
                color: const Color(0x44E3F2FD),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: _mailController,
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
                            bottom: MediaQuery.of(context).size.height * 0.02)),
              ),
            ),
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
                controller: _passController,
                style: const TextStyle(color: Color(0xff023047)),
                obscureText: true,
                decoration: InputDecoration(
                    hintStyle: const TextStyle(color: Color(0xff023047)),
                    fillColor: const Color(0xff023047),
                    hintText: 'Password',
                    prefixIcon: const Icon(
                      Icons.security_outlined,
                      color: Color(0xff023047),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02) +
                        EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.02)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.005),
              width: MediaQuery.of(context).size.height * 0.2,
              child: ElevatedButton(
                child: const Text('LOGIN'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff219EBC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  FocusScope.of(context)
                      .unfocus(); // Que no abra el teclado al volver al login
                  if (_mailController.text == mail &&
                      _passController.text == password) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardPage()),
                    );
                  } else {
                    setState(() {
                      isVisible = true;
                    });
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    FocusScope.of(context)
                        .unfocus(); // Que no abra el teclado al volver al login
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PasswordReset()),
                    );
                  },
                  child: const Text("Forgot Password?"),
                  style: TextButton.styleFrom(
                    primary: const Color(0xff023047),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    FocusScope.of(context)
                        .unfocus(); // Que no abra el teclado al volver al login
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()),
                    );
                  },
                  child: const Text("Create an account here"),
                  style: TextButton.styleFrom(
                    primary: const Color(0xff023047),
                  ),
                ),
              ],
            ),
          ],
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
