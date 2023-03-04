import 'package:cloud_firestore/cloud_firestore.dart';

class CartRepository {
  addToCart(Map<String, dynamic> product) async {
    var db = FirebaseFirestore.instance;
    var check = await db.collection('Cart').doc(product['id']).get();
    if (check.exists) {
      db
          .collection('Cart')
          .doc(product['id'])
          .update({'qtd': check['qtd'] + 1}).then(
              (value) => print("o produto existe no banco de dados"));
    } else {
      db.collection('Cart').doc(product['id']).set(product).then((value) =>
          print('O produto foi salvo no carrinho com o id: ${product['id']}'));
    }
  }

  getCartProducts() async {
    var db = FirebaseFirestore.instance;
    final snapshot = await db.collection('Cart').get();
    return snapshot;
  }

  increaseProductQtd(String id, int qtd) async {
    var db = FirebaseFirestore.instance;
    db.collection('Cart').doc(id).update({'qtd': qtd + 1});
  }

  decreaseProductQtd(String id, int qtd) async {
    var db = FirebaseFirestore.instance;
    if (qtd > 1) {
      db.collection('Cart').doc(id).update({'qtd': qtd - 1});
    }
  }

  deleteProduct(String id) {
    var db = FirebaseFirestore.instance;
    db.collection('Cart').doc(id).delete();
  }

  clearCart() async {
    var db = FirebaseFirestore.instance;
    db.collection('Cart').doc().delete();
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