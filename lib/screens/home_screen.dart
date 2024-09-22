import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products_service.dart';
import 'package:store_app/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "New Trend",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.cartShopping),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 5,
        ),
        child: FutureBuilder(
          future: GetAllProductsService().getAllProducts(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              List<ProductModel> products = snapShot.data!;
              return GridView.builder(
                clipBehavior: Clip.none,
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  //the ratio of the width to the height
                  //we affect the width
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 25,
                ),
                itemBuilder: (context, index) => ProductCard(
                  product: products[index],
                ),
              );
            } else if (snapShot.hasError) {
              return Center(
                child: Text("${snapShot.error}"),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(value: 2),
              );
            }
          },
        ),
      ),
    );
  }
}


/* 
      
*/