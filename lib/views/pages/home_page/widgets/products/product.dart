import 'package:e_commerce_app/controller/api_service_controller/api_service_controller.dart';
import 'package:e_commerce_app/routes/app_routes.dart';
import 'package:e_commerce_app/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ApiServiceController>(context, listen: false).fetchProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final products =
        Provider.of<ApiServiceController>(context, listen: true).products;
    return Provider.of<ApiServiceController>(context).isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            margin: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 13 / 20),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) => ProductCard(
                  onTap: () {
                    context.push(
                        "${AppRoutes.detailedView}/${products[index].id}");
                  },
                  description: products[index].description,
                  id: products[index].id,
                  category: products[index].category.name,
                  text: products[index].title,
                  price: products[index].price,
                  rating: products[index].rating.rate,
                  url: products[index].image,
                ),
              ),
            ),
          );
  }
}
