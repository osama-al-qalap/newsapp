// ignore_for_file: unnecessary_this

class Articles {
  String? title;
  String? description;
  String? urlToImage;

  Articles({
    required this.title,
    required this.description,
    required this.urlToImage,
  });
  Articles.fromjson(Map<String, dynamic> json) {
    this.title = json["title"];
    this.description = json["description"];
    this.urlToImage = json["urlToImage"];
  }
}

class NewModel {
  List<Articles>? articles;
  NewModel({this.articles});
  NewModel.friomjson(Map<String, dynamic> json) {
    this.articles = (json["articles"] as List)
        .map((e) => Articles.fromjson(e))
        .cast<Articles>()
        .toList();
  }
}

List categorieModel = [
  {'name': 'Business', 'image': 'assets/images/1.jpg', 'routeName': 'Business'},
  {
    'name': 'Entertainment',
    'image': 'assets/images/2.jpg',
    'routeName': 'Entertainment'
  },
  {'name': 'General', 'image': 'assets/images/3.jpg', 'routeName': 'Health'},
  {'name': 'Health', 'image': 'assets/images/4.jpg', 'routeName': 'Health'},
  {'name': 'Science', 'image': 'assets/images/5.jpg', 'routeName': 'Science'},
  {'name': 'Sports', 'image': 'assets/images/6.jpg', 'routeName': 'Sports'},
  {
    'name': 'Technology',
    'image': 'assets/images/7.jpg',
    'routeName': 'Technology'
  },
];
