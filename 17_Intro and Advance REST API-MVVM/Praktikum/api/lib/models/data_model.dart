class JsonModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  JsonModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory JsonModel.fromJson(Map<String, dynamic> json) {
    return JsonModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
