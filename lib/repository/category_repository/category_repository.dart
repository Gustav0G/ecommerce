import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryRepository {
  getCategory() async {
    var db = FirebaseFirestore.instance;
    final snapshot = await db.collection('Category').get();

    return snapshot;
  }
}
