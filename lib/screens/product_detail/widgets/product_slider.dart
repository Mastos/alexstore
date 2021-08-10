import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class ProductSlider extends StatelessWidget {
  final List<int> list = [1,2,3,4,5];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
          margin: EdgeInsets.only(top: 15, bottom: 15),
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
            ),
            items: list.map((item) => Container(
              child: Center(
                  child: Text(item.toString())
              ),
              color: Colors.white,
            )).toList(),
          )
      ),
    );
  }

}