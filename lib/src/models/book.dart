class Book {
  String name;
  String author;
  double price;
  String linkToImage;
  double mark = 4.0;
  String genre;

  Book();

  Book.fromJson(Map<String, dynamic> json) {
    this.name = (json['name'] as String).split('.').sublist(2).join('.');
    this.author = json['author'];
    this.price = json['price'];
    this.linkToImage = json['image'];
    this.mark = (json['mark'] as double)/2;
    this.genre = json['theme'];
  }
}
