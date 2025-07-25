class Product {
  int id;
  String title;
  String description;
  String category;
  double price;
  double rating;
  List<dynamic> image;
  bool isOrdered;
  int itemCount;
  bool isLiked;

  Product({
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.image,
    this.isOrdered = false,
    this.itemCount = 0,
    this.isLiked = false,
    required this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    title: json["title"],
    description: json["description"],
    category: json["category"],
    price: json["price"],
    rating: json["rating"],
    image: json["images"],
    id: json["id"],
  );
}
