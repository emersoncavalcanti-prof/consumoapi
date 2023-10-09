import 'dart:convert';

class ProdutoModel {
  final String title;
  final String description;
  final price;
  final rating;
  final String brand;
  final String category;
  final String thumbnail;
  final List<dynamic> images;

  ProdutoModel({
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'price': price,
      'rating': rating,
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
      'images': images,
    };
  }

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      title: map['title'] as String,
      description: map['description'] as String,
      price: map['price'],
      rating: map['rating'],
      brand: map['brand'] as String,
      category: map['category'] as String,
      thumbnail: map['thumbnail'] as String,
      images: List<dynamic>.from((map['images'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutoModel.fromJson(String source) =>
      ProdutoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
