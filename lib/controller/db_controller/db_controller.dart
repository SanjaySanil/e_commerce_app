

import 'package:e_commerce_app/models/db_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DBController extends ChangeNotifier{
  Box<DBModel> shopping_box = Hive.box<DBModel>("shopping_box");

  Future<void> writeDate(DBModel model) async {
    await shopping_box.add(model);
    notifyListeners();
  }

  List<DBModel> readData()  {
    var items =  shopping_box.values.toList();
    return items;
  }

}