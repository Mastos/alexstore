import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MainSlider extends StatelessWidget {
  final List<int> list = [1,2,3,4,5];
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 15, bottom: 15),
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
          ),
          items: list.map((item) => Container(
            child: Center(
                child: Text(item.toString())
            ),
            color: Colors.grey[300],
          )).toList(),
        )
    );
  }

}