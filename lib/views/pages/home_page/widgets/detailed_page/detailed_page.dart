import 'package:e_commerce_app/controller/api_service_controller/api_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ApiServiceController>(context, listen: false)
          .fetchApi(widget.id);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ApiServiceController>(context, listen: true)
        .productsDetails;
    int id = int.parse(widget.id);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.pop;
        },
        label: const Text("Add to Cart"),
      ),
      body: Provider.of<ApiServiceController>(context).isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .5,
                        color: Colors.red,
                        child: Image.network(
                          products!.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        products.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        products.category.name,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      RatingBar.builder(
                        initialRating: products.rating.rate + .0,
                        minRating: 1,
                        itemSize: 20,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.only(right: 5),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.green,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        products.price.toString(),
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        products.description,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
