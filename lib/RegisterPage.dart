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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          color: const Color(0xffffffff),
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.08,
              right: MediaQuery.of(context).size.width * 0.08,
              top: MediaQuery.of(context).size.height * 0.15,
              bottom: MediaQuery.of(context).size.height * 0.025),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.04),
                child: Image.asset(
                  "images/logo_principal.png",
                  width: MediaQuery.of(context).size.width * 0.3,
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
                  style: const TextStyle(color: Color(0xff023047)),
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: const Color(0xff023047).withOpacity(0.6)),
                      fillColor: const Color(0xff023047),
                      hintText: 'Name',
                      prefixIcon: const Icon(
                        Icons.person,
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
                      hintStyle: TextStyle(
                          color: const Color(0xff023047).withOpacity(0.6)),
                      fillColor: const Color(0xff023047),
                      hintText: 'Email',
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
                    bottom: MediaQuery.of(context).size.height * 0.03),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff023047)),
                  color: const Color(0x44E3F2FD),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  autofocus: false,
                  style: const TextStyle(color: Color(0xff023047)),
                  obscureText: true,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: const Color(0xff023047).withOpacity(0.6)),
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
                              bottom:
                                  MediaQuery.of(context).size.height * 0.02)),
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
                  style: const TextStyle(color: Color(0xff023047)),
                  obscureText: true,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: const Color(0xff023047).withOpacity(0.6)),
                      fillColor: const Color(0xff023047),
                      hintText: 'Confirm Password',
                      prefixIcon: const Icon(
                        Icons.security_outlined,
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
                  child: const Text('Create Account'),
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
                          builder: (context) => const LoginPage()),
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
                    child: const Text("Already have an account?"),
                    style: TextButton.styleFrom(
                      primary: const Color(0xff023047),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
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
