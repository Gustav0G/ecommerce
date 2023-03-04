import 'package:e_commercex/model/promotion_model/promotion_model.dart';
import 'package:e_commercex/repository/promotion_repository/promotion_repository.dart';
import 'package:flutter/cupertino.dart';

class PromotionController extends ChangeNotifier {
  PromotionRepository repository = PromotionRepository();

  Future<List<PromotionModel>> readPromotion() async {
    var list = await repository.getPromotion();
    List<PromotionModel> listPromotion = [];
    for (var doc in list.docs) {
      listPromotion.add(PromotionModel.fromJson(doc));
    }
    notifyListeners();
    return listPromotion;
  }
}
