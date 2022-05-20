import 'package:flutter/material.dart';
import 'EventCustomCard.dart';

class NewEvent extends StatefulWidget {
  const NewEvent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewEvent();
}

class _NewEvent extends State<NewEvent> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F9FF),
      appBar: AppBar(
        title: Text("New event"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 1,
                        color: Color(0xffBEC1FF)),
                  ],
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                      decoration: InputDecoration(
                        hintText: "Add your title here...",
                        hintStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontStyle: FontStyle.italic,
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    EventCustomCardImage(),
                    Container(
                      height: 100,
                      margin: EdgeInsets.only(bottom: 25),
                      child: Text('Espacio para Ubicación'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TextButton(
              onPressed: () {
                print(_titleController.text);
              },
              child: Text(
                "Publish event",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  // If the button is pressed, return green, otherwise blue
                  if (states.contains(MaterialState.pressed)) {
                    return Theme.of(context).focusColor.withOpacity(0.9);
                  }
                  return Theme.of(context).focusColor;
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
