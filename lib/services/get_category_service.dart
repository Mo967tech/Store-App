import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetCategoryService {
  Future<List<ProductModel>> getCategory({required String categoryName}) async {
    List<dynamic> data = await Api().get(
      url: "$baseUrl/products/category/$categoryName",
    );
    List<ProductModel> category = [];

    for (ProductModel product in data) {
      category.add(ProductModel.fromJson(product));
    }

    return category;
  }
}
