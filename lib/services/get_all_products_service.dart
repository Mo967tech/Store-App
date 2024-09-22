
import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data = await Api().get(url: '$baseUrl/products');
    List<ProductModel> products = [];
  
    for (var product in data) {
      products.add(ProductModel.fromJson(product));
    }

    return products;
  }
}
