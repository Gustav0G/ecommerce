import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commercex/components/product_item_widget/product_item_widget.dart';
import 'package:e_commercex/controller/product_controller/product_controller.dart';
import 'package:e_commercex/model/product_model/product_model.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

List<ProductModel> productList = [];
ProductController productController = ProductController();
String name = '';

class _SearchPageState extends State<SearchPage> {
  readSearchList() async {
    //productList = await productController.searchProducts(name);
  }

  @override
  void initState() {
    readSearchList();
    productController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.18),
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
            decoration:
                const BoxDecoration(color: Colors.transparent, boxShadow: []),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                //searchbar
                Container(
                  height: sizeHeight * 0.06,
                  width: sizeWidth * 0.75,
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 1,
                            offset: Offset(1, 1),
                            color: Colors.black54),
                      ]),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Pesquisar',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(width: 10)
              ],
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('Product').snapshots(),
            builder: (context, snapshots) {
              return (snapshots.connectionState == ConnectionState.waiting)
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: snapshots.data!.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshots.data!.docs[index].data()
                            as Map<String, dynamic>;

                        var id = snapshots.data!.docs[index].id;
                        var product = ProductModel.fromMap(data);

                        if (data['name']
                                .toString()
                                .toLowerCase()
                                .startsWith(name.toLowerCase()) ||
                            data['category']
                                .toString()
                                .toLowerCase()
                                .contains(name.toLowerCase())) {
                          return ProductItemWidget(
                            id: id,
                            product: product,
                          );
                        }

                        return Container();
                      });
            }));
  }
}
