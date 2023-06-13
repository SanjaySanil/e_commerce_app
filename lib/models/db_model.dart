import 'package:hive/hive.dart';
part 'db_model.g.dart';
@HiveType(typeId: 1)
class DBModel {

  @HiveField(0)
  final String category;
  @HiveField(1)
  final double price;
  @HiveField(2)
  final double rating;
  @HiveField(3)
  final String url;
  @HiveField(4)
  final String title;

  DBModel(
      {required this.rating,
      required this.price,
      required this.title,
      required this.category,
      required this.url});
}
