class User {
  int id;
  String name;
  String profilePic;
  String mail;
  List<int> contacts;
  List<int> chats;

  User(
      {required this.id,
      required this.name,
      required this.profilePic,
      required this.mail,
      required this.contacts,
      required this.chats});
}
