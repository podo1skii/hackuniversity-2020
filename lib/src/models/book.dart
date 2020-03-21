class Book {
  String name;
  String author;
  double price;
  String linkToImage;
  double mark = 4.0;

  Book();

  Book.fromJson(Map<String, dynamic> json){
    this.name = json['name'];
    this.author = json['author'];
    this.price = json['price'];
    this.linkToImage = json['image'];
    this.mark = json['mark'];
  }
}
