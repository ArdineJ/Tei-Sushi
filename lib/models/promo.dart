import 'package:flutter/material.dart';

class Promo {
  final String sushiImg;
  final String disc;

  Promo({
    required this.sushiImg,
    required this.disc,
  });
}

class PromoList extends ChangeNotifier {
  List<Promo> promoList = [
    Promo(sushiImg: 'images/salmon.png', disc: '35%'),
    Promo(sushiImg: 'images/wagyu.png', disc: '20%'),
    Promo(sushiImg: 'images/maguro.png', disc: '10%'),
    Promo(sushiImg: 'images/tako.png', disc: '25%'),
    Promo(sushiImg: 'images/uni.png', disc: '15%'),
  ];

  List<Promo> getPromoList() {
    return promoList;
  }
}
