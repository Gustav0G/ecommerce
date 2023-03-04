import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commercex/model/promotion_model/promotion_model.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../firebase_options.dart';

class PromotionRepository {
  getPromotion() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    var db = FirebaseFirestore.instance;
    final snapshot = await db.collection('Promotion').get();
    List<PromotionModel> listPromotion = [];
    for (var doc in snapshot.docs) {
      listPromotion.add(PromotionModel.fromJson(doc));
    }

    return snapshot;
  }
}
