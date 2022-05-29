import 'package:Schange/LoginPage.dart';
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
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.09),
              child: Image.asset(
                "images/logo_principal.png",
                width: MediaQuery.of(context).size.width * 0.2,
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
                    hintStyle:
                        TextStyle(color: Color(0xff023047).withOpacity(0.6)),
                    fillColor: Color(0xff023047),
                    hintText: 'Name',
                    prefixIcon: Icon(
                      Icons.person,
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
                    hintStyle:
                        TextStyle(color: Color(0xff023047).withOpacity(0.6)),
                    fillColor: Color(0xff023047),
                    hintText: 'Username',
                    prefixIcon: Icon(
                      Icons.alternate_email,
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
                    hintStyle:
                        TextStyle(color: Color(0xff023047).withOpacity(0.6)),
                    fillColor: Color(0xff023047),
                    hintText: 'Email',
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
                    hintStyle:
                        TextStyle(color: Color(0xff023047).withOpacity(0.6)),
                    fillColor: Color(0xff023047),
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
                    hintStyle:
                        TextStyle(color: Color(0xff023047).withOpacity(0.6)),
                    fillColor: Color(0xff023047),
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
                child: const Text('Create Account'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff219EBC),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  FocusScope.of(context)
                      .unfocus(); // Que no abra el teclado al volver al login
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
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
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: Text("Already an account?"),
                  style: TextButton.styleFrom(
                    primary: Color(0xff023047),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xffffffff),
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.05,
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
