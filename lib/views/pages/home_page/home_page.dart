import 'package:e_commerce_app/views/pages/home_page/widgets/cart/cart.dart';
import 'package:e_commerce_app/views/pages/home_page/widgets/category/category.dart';
import 'package:e_commerce_app/views/pages/home_page/widgets/products/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(
                Icons.production_quantity_limits,
                color: Colors.black,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.category,
                color: Colors.black,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            )
          ]),
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
        body:  TabBarView(
          children: [
            Product(),
            Category(),
            Cart(),
          ],
        ),
      ),
    );
  }
}
