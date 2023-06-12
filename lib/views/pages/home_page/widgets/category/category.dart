import 'package:flutter/material.dart';

class Category extends StatelessWidget {
   Category({Key? key}) : super(key: key);
 List<String>  items=["",];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) => CategoryContainer()),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){},
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://www.livemint.com/lm-img/img/2023/06/03/1600x900/SOCCER-FRANCE-PSG-MESSI-0_1685756670054_1685756685259.JPG"),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        child: Center(
          child: Text(
            "Mens Collections",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
