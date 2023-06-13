
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {Key? key,
      required this.id,
      required this.text,
      required this.category,
      required this.description,
      required this.price,
      required this.rating,
      required this.url,
      required this.onTap})
      : super(key: key);
  final int id;
  final VoidCallback onTap;
  final String text;
  final String category;
  final String description;
  final double price;
  final double rating;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(url),
                ),
              ),
            ),
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
