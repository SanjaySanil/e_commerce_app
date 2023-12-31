import 'package:e_commerce_app/controller/api_service_controller/api_service_controller.dart';
import 'package:e_commerce_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Category extends StatefulWidget {
  Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<ApiServiceController>(context, listen: false)
          .fetchCategory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final category = Provider.of<ApiServiceController>(context).category;
    var items = [
      {
        "category": category[0],
        "imageUrl":
            "http://dealsmaps.com/wp-content/uploads/2022/03/The-Must-Have-15-Electronics-Products-to-Improve-Your-Life-Quality-1.jpg"
      },
      {
        "category": category[1],
        "imageUrl":
            "http://goldunlimitedsa.com/wp-content/uploads/2016/02/vintage-pile-jewelry.jpg"
      },
      {
        "category": category[2],
        "imageUrl":
            "https://dress-trends.com/wp-content/uploads/2015/10/Fashion-clothing-for-men-spring-summer-2016-61.jpg"
      },
      {
        "category": category[3],
        "imageUrl":
            "https://2.bp.blogspot.com/-iGxbYAcrHWs/UrFGfZPguyI/AAAAAAAAASA/5d30-akFDhw/s1600/Clothing+for+Women+(4).jpg"
      }
    ];
    return Provider.of<ApiServiceController>(context).isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: const EdgeInsets.all(12),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemBuilder: (context, index) => CategoryContainer(
                onTap: () {
                  context.push(
                      "${AppRoutes.categoryView}/${items[index]["category"]}");
                },
                url: "${items[index]["imageUrl"]}",
                text: "${items[index]["category"]}",
              ),
            ),
          );
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer(
      {Key? key, required this.text, required this.url, required this.onTap})
      : super(key: key);
  final String text;
  final String url;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
