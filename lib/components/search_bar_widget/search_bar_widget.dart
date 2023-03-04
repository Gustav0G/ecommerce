import 'package:e_commercex/pages/search/search_page.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  //final TextEditingController controller;
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: (() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SearchPage()));
      }),
      child: Container(
        height: sizeHeight * 0.06,
        width: sizeWidth * 0.8,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 1, offset: Offset(1, 1), color: Colors.black54),
            ]),
        child: const TextField(
          enabled: false,
          decoration: InputDecoration(
            hintText: 'Pesquisar',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
