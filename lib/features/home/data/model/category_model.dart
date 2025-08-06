class ProductModel {
  final String name;
  final double price;
  final String image;
  final String category; 

  ProductModel({
    required this.name,
    required this.price,
    required this.image,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'] ?? '',
      price: (json['price'] as num).toDouble(),
      image: json['image'] ?? '',
      category: json['category'] ?? '', 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'category': category, 
    };
  }
}
