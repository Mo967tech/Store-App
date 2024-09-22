import 'package:store_app/models/rating_model.dart';

class ProductModel {
  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    // required this.rating,
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(
      id: (json['id'] as num).toInt(),
      title: json['title'],
      price: json['price'].toString(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      // rating: RatingModel.fromJson(json['rating']),
    );
  }

  final int id;
  final String title, description, category, image, price;
  // final RatingModel rating;
}
