class Event {
  int id = 0;
  String title = "";
  String picUrl = "";
  int creatorId = 0;
  String creationDate = "";
  int maxPeople = 0;
  String eventDate = "";
  int price = 0;
  String category = "";
  String description = "";
  int likes = 0;
  double latitude = 0;
  double longitude = 0;
  List<dynamic> subscribedPeople = [];

  Event(
      {required this.id,
      required this.title,
      required this.picUrl,
      required this.creatorId,
      required this.creationDate,
      required this.maxPeople,
      required this.eventDate,
      required this.price,
      required this.category,
      required this.description,
      required this.likes,
      required this.latitude,
      required this.longitude,
      required this.subscribedPeople});

  Event.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    picUrl = json["picUrl"];
    creatorId = json["creatorId"];
    creationDate = json["creationDate"];
    maxPeople = json["maxPeople"];
    eventDate = json["eventDate"];
    price = json["price"];
    category = json["category"];
    description = json["description"];
    likes = json["likes"];
    latitude = json["latitude"];
    longitude = json["longitude"];
    subscribedPeople = json["subscribedPeople"];
  }
}
