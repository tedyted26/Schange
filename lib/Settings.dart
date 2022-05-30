import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/dashboard');
          },
        ),
      ),
      body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(),
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
            ],
          )),
    );
  }
}
