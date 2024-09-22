import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
    required String id,
  }) async {
    Map<String, dynamic> data = await Api().put(
      url: "$baseUrl/products/$id",
      body: {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
        "id": id,
      },
    );

    return ProductModel.fromJson(data);
  }
}
