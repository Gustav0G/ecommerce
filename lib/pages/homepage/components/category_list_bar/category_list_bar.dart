import 'package:e_commercex/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:e_commercex/model/category_model/category_mode.dart';

class CategoryListBarWidget extends StatefulWidget {
  final List<CategoryModel> categoryList;

  const CategoryListBarWidget({
    Key? key,
    required this.categoryList,
  }) : super(key: key);

  @override
  State<CategoryListBarWidget> createState() => _CategoryListBarWidgetState();
}

class _CategoryListBarWidgetState extends State<CategoryListBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 120,
            child: ListView.builder(
                // padding: EdgeInsets.symmetric(horizontal: 0),
                scrollDirection: Axis.horizontal,
                itemCount: widget.categoryList.length,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home(
                                      selectedIndex: 2,
                                      tabIndex: index + 1,
                                    )));
                      });
                    },
                    child: CategoryListBarItem(
                      categoryName: widget.categoryList[index].name!,
                      urlImage: widget.categoryList[index].urlImage!,
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }
}

class CategoryListBarItem extends StatefulWidget {
  final String categoryName;
  final String urlImage;

  const CategoryListBarItem({
    super.key,
    required this.categoryName,
    required this.urlImage,
  });

  @override
  State<CategoryListBarItem> createState() => _CategoryListBarItemState();
}

class _CategoryListBarItemState extends State<CategoryListBarItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 105,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            elevation: 5,
            color: Theme.of(context).scaffoldBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              height: 79,
              width: 80,
              decoration: const BoxDecoration(),
              child: Image(
                image: NetworkImage(widget.urlImage),
                //fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            widget.categoryName,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
