class User {
  int id = 0;
  String name = "";
  String profilePic = "";
  String mail = "";
  String password = "";

  User({
    required this.id,
    required this.name,
    required this.profilePic,
    required this.mail,
    required this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    profilePic = json["profilePic"];
    mail = json["mail"];
    password = json["password"];
  }
}
