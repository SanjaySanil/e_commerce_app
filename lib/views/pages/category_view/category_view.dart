import 'package:e_commerce_app/controller/api_service_controller/api_service_controller.dart';
import 'package:e_commerce_app/routes/app_routes.dart';
import 'package:e_commerce_app/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatefulWidget {
  CategoryView({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<ApiServiceController>(context, listen: false)
          .fetchByCategory(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final products =
        Provider.of<ApiServiceController>(context, listen: true).categoryList;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          widget.id,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Provider.of<ApiServiceController>(context).isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 13 / 20),
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) => ProductCard(
                  description: products[index].description,
                  category: products[index].category.name,
                  text: products[index].title,
                  id: products[index].id,
                  onTap: () {
                    context.push(
                        "${AppRoutes.detailedView}/${products[index].id}");
                  },
                  price: products[index].price,
                  rating: products[index].rating.rate,
                  url: products[index].image,
                ),
              ),
            ),
    );
  }
}
