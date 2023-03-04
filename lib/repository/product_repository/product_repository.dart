import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../firebase_options.dart';

class ProductRepository {
  //final List<ProductModel> _listProduct = [];

  //corrigir os metodos e colocar o fromJson no controller
  getProduct() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    var db = FirebaseFirestore.instance;
    final snapshot = await db.collection('Product').get();

    return snapshot;
  }

  getFavoriteProducts() async {
    var db = FirebaseFirestore.instance;
    final snapshot =
        db.collection('Product').where('isFavorite', isEqualTo: true).get();
    return snapshot;
  }

  getProductByCategory({required String category}) async {
    var db = FirebaseFirestore.instance;
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('Category').doc(category);
    final snapshot =
        db.collection('Product').where('category', isEqualTo: docRef).get();
    return snapshot;
  }

  setFavorite(bool isFavorite, String id) async {
    var db = FirebaseFirestore.instance;
    db.collection('Product').doc(id).update({
      'isFavorite': isFavorite,
    });
  }

  searchProduct(String text) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    var db = FirebaseFirestore.instance;
    final search = db
        .collection('Product')
        .where('name', isNotEqualTo: text)
        .orderBy('name')
        .startAt([text]).endAt(['text+\uf8ff']).get();

    return search;
  }
}





/*
//metodos
setProduct() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    var db = FirebaseFirestore.instance;
    db
        .collection('Product')
        .add(product)
        .then((value) => print('O produto foi salvo com o id: ${value.id}'));
  }
  
//dados
DocumentReference ref =
    FirebaseFirestore.instance.collection('Category').doc('Cpu');

Map<String, dynamic> product = {
  'name':
      'Processador AMD Ryzen 7 5700G, 3.8GHz (4.6GHz Max Turbo), Cache 20MB, 8 Núcleos, 16 Threads, AM4,',
  'category': ref,
  'fullPrice': '1488.0',
  'discontPrice': '1399.0',
  'imgUrl': 'https://i.imgur.com/sEphorX.png',
  'isFavorite': false,
  'description':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sit amet lorem ipsum. Curabitur tellus dui, euismod quis diam at, egestas vestibulum justo. Sed sed interdum dolor. Cras commodo, augue luctus posuere pharetra, tellus libero ultricies risus, et vulputate ipsum ante eu neque. Donec purus lorem, volutpat non ante nec, aliquet consectetur massa. Ut commodo lorem a placerat gravida. Cras et nunc ac nulla blandit imperdiet. Praesent sed nibh porta, efficitur ante non, ultrices ex. Vivamus eget lacus sed magna porttitor volutpat.'
};

//código para pegar a categoria do produto
var category = await _listProduct[0]
        .category!
        .get(); 

 */