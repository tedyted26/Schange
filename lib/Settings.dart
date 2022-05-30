import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  File? image;
  String picPath = "images/user_0.jpg";

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      final imageTemporary = File(image.path);
      this.image = imageTemporary;

      setState(() {
        picPath = this.image!.path;
      });
    }
  }

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
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(bottom: 40, top: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipOval(
                        child: picPath.startsWith('images/')
                            ? Image.asset(
                                picPath,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                File(picPath),
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Theme.of(context).errorColor,
                          ),
                          onPressed: () => pickImage(),
                        ),
                      ),
                    ],
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
                                top:
                                    MediaQuery.of(context).size.height * 0.02) +
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
                                top:
                                    MediaQuery.of(context).size.height * 0.02) +
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
                        hintText: 'New password',
                        prefixIcon: const Icon(
                          Icons.security_outlined,
                          color: Color(0xff023047),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                                top:
                                    MediaQuery.of(context).size.height * 0.02) +
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
                                top:
                                    MediaQuery.of(context).size.height * 0.02) +
                            EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.02)),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.height * 0.2,
                  margin: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    child: const Text('SAVE'),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff219EBC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (_) => AlertDialog(
                                title: const Text("Save changes?"),
                                elevation: 1,
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'Cancel');
                                      },
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).focusColor),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('/dashboard');
                                      },
                                      child: Text(
                                        "Yes",
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).errorColor),
                                      ))
                                ],
                              ));
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
