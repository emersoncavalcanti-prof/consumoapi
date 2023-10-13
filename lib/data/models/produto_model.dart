import 'dart:convert';

class ProdutoModel {
  final String title;
  final String description;
  final int price;
  final String brand;
  final String category;
  final String thumbnail;
  final List<dynamic> images;

  ProdutoModel({
    required this.title,
    required this.description,
    required this.price,
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
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
      'images': images,
    };
  }

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      title: map['title'],
      description: map['description'],
      price: map['price'],
      brand: map['brand'],
      category: map['category'],
      thumbnail: map['thumbnail'],
      images: List<dynamic>.from((map['images'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutoModel.fromJson(String source) =>
      ProdutoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
