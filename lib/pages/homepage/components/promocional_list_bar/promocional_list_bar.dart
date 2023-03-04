import 'package:e_commercex/model/promotion_model/promotion_model.dart';
import 'package:flutter/material.dart';

class PromotionListBar extends StatelessWidget {
  final List<PromotionModel> promotionList;
  const PromotionListBar({super.key, required this.promotionList});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 140,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              itemCount: promotionList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) {
                return PromotionListItem(
                  description1: promotionList[index].description1,
                  description2: promotionList[index].description2,
                  imgUrl: promotionList[index].imgUrl,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class PromotionListItem extends StatelessWidget {
  final String description1;
  final String description2;
  final String imgUrl;
  const PromotionListItem({
    super.key,
    required this.description1,
    required this.description2,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff404AA6),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: 250,
        child: Column(
          children: [
            Text(
              description1,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Expanded(
              child: Image.network(
                imgUrl,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              description2,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            //Image(image: NetworkImage(imgUrl))
          ],
        ),
      ),
    );
  }
}
