import 'package:e_commerce_app/controller/db_controller/db_controller.dart';
import 'package:e_commerce_app/views/pages/home_page/widgets/cart/cart.dart';
import 'package:e_commerce_app/views/pages/home_page/widgets/category/category.dart';
import 'package:e_commerce_app/views/pages/home_page/widgets/products/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DBController>(context).readData();
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              const Tab(
                icon: Icon(
                  Icons.production_quantity_limits,
                  color: Colors.black,
                ),
              ),
              const Tab(
                icon: Icon(
                  Icons.category,
                  color: Colors.black,
                ),
              ),
              Tab(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                    data.isNotEmpty
                        ? CircleAvatar(
                            radius: 12,
                            child: Text(
                              data.length.toString(),
                            ),
                          )
                        : const Text(""),
                  ],
                ),
              )
            ],
          ),
          leading: const Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 25,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Shopsy",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          actions: const [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  "https://img.a.transfermarkt.technology/portrait/big/28003-1671435885.jpg?lm=1"),
            ),
            SizedBox(
              width: 12,
            )
          ],
        ),
        body: TabBarView(
          children: [
            const Product(),
            Category(),
            // Category(),
            const Cart(),
          ],
        ),
      ),
    );
  }
}
