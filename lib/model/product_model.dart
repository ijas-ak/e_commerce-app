class Product {
  String title;
  String description;
  String category;
  double price;
  double rating;
  List<dynamic> image;

  Product({
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    title: json["title"],
    description: json["description"],
    category: json["category"],
    price: json["price"],
    rating: json["rating"],
    image: json["images"],
  );
}
