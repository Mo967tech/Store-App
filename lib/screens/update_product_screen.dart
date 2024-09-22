import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:store_app/helper/show_snack_bar.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductScreen extends StatefulWidget {
  static String id = 'UpdateProductScreen';

  const UpdateProductScreen({super.key});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, description, image, price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Skeletonizer(
      enabled: isLoading,
      enableSwitchAnimation: true,
      child: Scaffold(
        appBar: AppBar(
          //make the color of app bar same to the scaffold
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Update Product",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 150),
                CustomTextField(
                  inputType: TextInputType.name,
                  onChanged: (productName) => this.productName = productName,
                  hintText: 'Product Name',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  inputType: TextInputType.text,
                  onChanged: (description) => this.description = description,
                  hintText: 'Description',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  inputType: TextInputType.number,
                  onChanged: (price) => this.price = price,
                  hintText: 'Price',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  inputType: TextInputType.url,
                  onChanged: (image) => this.image = image,
                  hintText: 'Image',
                ),
                const SizedBox(height: 70),
                CustomButton(
                  onTap: () async {
                    setState(() => isLoading = true);
                    try {
                      await updateProduct(product);
                      showSnackBar(context, "Product Updated Successfully!");
                    } on Exception catch (e) {
                      print(e.toString());
                      showSnackBar(context, "Error Product Not Updated!");
                    }
                    setState(() => isLoading = false);
                  },
                  title: 'Update',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async{
    await UpdateProductService().updateProduct(
      title: productName ?? product.title,
      price: price ?? product.price.toString(),
      description: description ?? product.description,
      image: image ?? product.image,
      category: product.category,
      id: product.id.toString(),
    );
  }
}
