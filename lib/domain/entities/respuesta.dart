

class Respuesta {
  String title;
  String price;
  String description;
  String image;
  String category;

  Respuesta({
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
  });

  factory Respuesta.fromJson(Map<String, dynamic> json) {
    return Respuesta(
      title: json["title"],
      price: json["price"].toString(),
      description: json["description"],
      image: json["image"],
      category: json["category"],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
      };
}
