class User {
  int id = 0;
  String name = "";
  String profilePic = "";
  String mail = "";
  String password = "";
  List<dynamic> contacts = [];
  List<dynamic> chats = [];

  User(
      {required this.id,
      required this.name,
      required this.profilePic,
      required this.mail,
      required this.password,
      required this.contacts,
      required this.chats});

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    profilePic = json["profilePic"];
    mail = json["mail"];
    password = json["password"];
    contacts = json["contacts"];
    chats = json["chats"];
  }
}
