import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffffffff),
        padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.08) +
            EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.08) +
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.1),
              child: Image.asset(
                "images/logo_principal.png",
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.03),
              decoration: BoxDecoration(
                color: Color(0x44E3F2FD),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                autofocus: false,
                style: TextStyle(color: Color(0xff000000)),
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Color(0xff023047)),
                    fillColor: Color(0xff023047),
                    hintText: 'Name',
                    prefixIcon: Icon(
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
                color: Color(0x44E3F2FD),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                autofocus: false,
                style: TextStyle(color: Color(0xff023047)),
                obscureText: true,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    fillColor: Colors.white,
                    hintText: 'Username',
                    prefixIcon: Icon(
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
                  bottom: MediaQuery.of(context).size.height * 0.03),
              decoration: BoxDecoration(
                color: Color(0x44E3F2FD),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                autofocus: false,
                style: TextStyle(color: Color(0xff023047)),
                obscureText: true,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    fillColor: Colors.white,
                    hintText: 'Email',
                    prefixIcon: Icon(
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
                  bottom: MediaQuery.of(context).size.height * 0.03),
              decoration: BoxDecoration(
                color: Color(0x44E3F2FD),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                autofocus: false,
                style: TextStyle(color: Color(0xff023047)),
                obscureText: true,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    fillColor: Colors.white,
                    hintText: 'Password',
                    prefixIcon: Icon(
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
                  bottom: MediaQuery.of(context).size.height * 0.03),
              decoration: BoxDecoration(
                color: Color(0x44E3F2FD),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                autofocus: false,
                style: TextStyle(color: Color(0xff023047)),
                obscureText: true,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    fillColor: Colors.white,
                    hintText: 'Confirm Password',
                    prefixIcon: Icon(
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
                  primary: Color(0xff219EBC),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  FocusScope.of(context)
                      .unfocus(); // Que no abra el teclado al volver al login
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(
                        text: "Already an account?",
                        style: TextStyle(
                          color: Color(0xff023047),
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                        ))),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xffffffff),
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.075,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(0),
        child: Text(
          "Schange (C) - Políticas de privacidad",
          style: TextStyle(
            color: Color(0xff023047),
          ),
        ),
      ),
    );
  }
}
