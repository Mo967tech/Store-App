import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';

class GetAllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> categories = await Api().get(
      url: '$baseUrl/products/categories',
    );

    return categories;
  }
}
