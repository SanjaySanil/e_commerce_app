import 'package:e_commerce_app/controller/db_controller/db_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    Provider.of<DBController>(context,listen:false).readData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final data =Provider.of<DBController>(context).readData();
    return  GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemCount:data.length,
      itemBuilder: (context, index) =>
          CartCard(id:0,
              text:data[index].title,
              category:data[index].category,
              price:data[index].price,
              rating:data[index].rating,
              onTap:(){}));
  }
}


class CartCard extends StatelessWidget {
  CartCard(
      {Key? key,
        required this.id,
        required this.text,
        required this.category,
        required this.price,
        required this.rating,
        required this.onTap})
      : super(key: key);
  final int id;
  final VoidCallback onTap;
  final String text;
  final String category;
  final double price;
  final double rating;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin:EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(width: 2, color: Colors.grey.shade300)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: const TextStyle(fontSize: 15, color: Colors.grey),
            ),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis),
            ),
            Text(price.toString()),
            RatingBar.builder(
              initialRating: rating + .0,
              minRating: 1,
              itemSize: 15,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 6,
              itemPadding: const EdgeInsets.only(right: 5),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.green,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ],
        ),
      ),
    );
  }
}
