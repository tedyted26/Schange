class Event {
  int id;
  String title;
  String picUrl;
  String creatorName;
  int creatorId;
  String creationDate;
  int maxPeople;
  String eventDate;
  int price;
  String category;
  String description;
  int likes;
  String ubication;
  List<int> subscribedPeople;

  Event(
      {required this.id,
      required this.title,
      required this.picUrl,
      required this.creatorName,
      required this.creatorId,
      required this.creationDate,
      required this.maxPeople,
      required this.eventDate,
      required this.price,
      required this.category,
      required this.description,
      required this.likes,
      required this.ubication,
      required this.subscribedPeople});
}
