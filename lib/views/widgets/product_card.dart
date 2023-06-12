import 'package:e_commerce_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        context.push(AppRoutes.detailedView);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(width: 2, color: Colors.grey.shade300)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: const ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://s.yimg.com/fz/api/res/1.2/pfXZKNsMXFHFpkSGhByk.A--~C/YXBwaWQ9c3JjaGRkO2ZpPWZpbGw7aD0yMjA7cT04MDt3PTE2NQ--/https://s.yimg.com/zb/imgv1/314ff28a-c3e1-3e63-9f17-d265f9686377/t_500x300")),
              ),
            ),
            const Text(
              "category",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const Text(
              "Title",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text("Rs.50"),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,itemSize:15,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.only(right:5),
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