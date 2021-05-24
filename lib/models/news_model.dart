class NewsModel {
  DateTime? created;
  String objectID;
  String title;
  String? content; // story_text
  String url;
  String author;
  int numComments;
  int points;

  NewsModel(
      {required this.objectID,
      required this.title,
      this.content,
      required this.url,
      required this.author,
      required this.points,
      this.created,
      required this.numComments});

  NewsModel.fromJson(Map<String, dynamic> json)
      : created = DateTime.parse(json['created_at']),
        title = json['title'],
        objectID = json['objectID'],
        content = json['story_text'],
        author = json['author'],
        numComments = json['num_comments'],
        points = json['points'],
        url = json['url'];
}
