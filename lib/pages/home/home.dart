import 'package:flutter/material.dart';
import 'package:e_commercex/components/search_bar_widget/search_bar_widget.dart';
import 'package:e_commercex/pages/cart/cart_page.dart';
import 'package:e_commercex/pages/favorites/favorites_page.dart';
import 'package:e_commercex/pages/homepage/home_page.dart';
import 'package:e_commercex/pages/products/products_page.dart';

class Home extends StatefulWidget {
  int selectedIndex;
  int tabIndex;
  Home({
    Key? key,
    required this.selectedIndex,
    required this.tabIndex,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomePageState();
}

int _selectedIndex = 0;
int _tabIndex = 0;
List pages = [];

TextEditingController controller = TextEditingController();

class _HomePageState extends State<Home> {
  @override
  void initState() {
    setState(() {
      _tabIndex = widget.tabIndex;
      _selectedIndex = widget.selectedIndex;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pages = [
      HomePage(),
      const FavoritesPage(),
      ProductsPage(
        tabIndex: _tabIndex,
      ),
      const CartPage(),
    ];
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
            children: const [
              SearchBarWidget(),
            ],
          ),
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _tabIndex = 0;
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Favoritos',
            icon: Icon(
              Icons.favorite,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Produtos',
            icon: Icon(
              Icons.grid_on,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Carrinho',
            icon: Icon(
              Icons.shopping_cart,
            ),
          )
        ],
        elevation: 20,
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
        selectedItemColor: Colors.black,
      ),
    );
  }
}
