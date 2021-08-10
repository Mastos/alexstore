import 'package:flutter/material.dart';
class PopularCategoryItem extends StatelessWidget {
  final String? name;
  final String? img;
  const PopularCategoryItem({Key ?key, this.name, this.img}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {print("Container clicked");},
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width,
            height: 112,
            child: Image(image: AssetImage('$img'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text('$name', textAlign: TextAlign.center),
          )
        ],
      ),
    );
  }
}
