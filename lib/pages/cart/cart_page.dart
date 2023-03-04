import 'package:e_commercex/controller/cart_controller/cart_controller.dart';
import 'package:e_commercex/model/cart_model/cart_model.dart';
import 'package:e_commercex/pages/cart/components/cart_listview_widget/cart_listview_widget.dart';
import 'package:e_commercex/pages/cart/components/empty_cart_message/empty_cart_message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

List<CartModel> cartProductList = [];
CartController controller = CartController();

readList() async {
  cartProductList = await controller.readCartData();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    readList();
    controller.addListener(() {
      if (mounted) {
        setState(() {
          readList();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: cartProductList.isEmpty
            ? const EmptyCardMessage()
            : Container(
                padding: const EdgeInsets.symmetric(vertical: 10.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                          'Carrinho de Compras (${cartProductList.length})',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    const SizedBox(height: 10),
                    Card(
                      elevation: 5,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          height: size.height * 0.5255,
                          child: CartListViewWidget(
                              cartProductList: cartProductList)),
                    ),
                    const SizedBox(height: 5),
                    Card(
                      child: Container(
                        height: size.height * 0.15,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Valor Total da Compra',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 25),
                                RichText(
                                    text: TextSpan(
                                        text: NumberFormat.currency(
                                                locale: 'pt_BR', symbol: ' R\$')
                                            .format(double.parse(
                                                controller.sumDiscontPrice(
                                                    cartProductList))),
                                        style: const TextStyle(
                                            color: Color(0xff404AA6),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        children: const [
                                      TextSpan(
                                        text: ' á vista ou',
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                        ),
                                      )
                                    ])),
                                const SizedBox(height: 3),
                                RichText(
                                    text: TextSpan(
                                        text:
                                            ' ${NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(double.parse(controller.sumTotalPrice(cartProductList)))}',
                                        style: const TextStyle(
                                            color: Color(0xff404AA6),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        children: const [
                                      TextSpan(
                                        text: ' em até 10x',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13),
                                      )
                                    ]))
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.10),
                                  backgroundColor: const Color(0xff404AA6),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Text(
                                'Continuar',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ));
  }
}
