import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AddProductService {
  Future<ProductModel> addProudct({required String url}) async {
    Map<String, dynamic> data = await Api().put(url: url);
    return ProductModel.fromJson(data);
  }
}
