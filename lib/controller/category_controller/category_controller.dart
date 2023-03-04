import 'package:e_commercex/model/category_model/category_mode.dart';
import 'package:e_commercex/repository/category_repository/category_repository.dart';
import 'package:flutter/cupertino.dart';

class CategoryController extends ChangeNotifier {
  CategoryRepository repository = CategoryRepository();

  Future<List<CategoryModel>> readCategory() async {
    var list = await repository.getCategory();
    List<CategoryModel> listCategory = [];
    for (var doc in list.docs) {
      listCategory.add(CategoryModel.fromJson(doc));
    }
    notifyListeners();
    return listCategory;
  }
}
