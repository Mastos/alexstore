import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String? name;
  final String? article;
  final String? price;
  final String? available;
  final VoidCallback? press;

  const ProductCard({
    Key ?key,
    this.name,
    this.article,
    this.price,
    this.available,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
      ),
      width: 180,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () =>{},
                      child:Icon(Icons.favorite_border, color: Color(0xffBBCFD8))),
                ],
              ),
            ),
            GestureDetector(
              onTap: press,
              child: Column(
                children: [
                  SizedBox(
                    width: 130,
                    height: 100,
                    child: Image.network(
                        'https://alexstore24.ru/upload/iblock/5fc/18c0bd9f_bd2f_11eb_b80c_005056021804.jpg.png',
                        fit: BoxFit.fitHeight),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$name',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color(0xff343434), fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Text('Артикул', style: TextStyle(fontSize: 13)),
                  SizedBox(
                    width: 35,
                  ),
                  Expanded(
                    child: Text('5060', style: TextStyle(fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Text('Наличие', style: TextStyle(fontSize: 13)),
                  SizedBox(
                      width: 30,
                      child: Icon(Icons.keyboard_arrow_right, size: 20)),
                  Expanded(
                    child: Text('10 шт', style: TextStyle(fontSize: 12),                  maxLines: 1,
                      overflow: TextOverflow.ellipsis,),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Text('Артикул', style: TextStyle(fontSize: 13)),
                  SizedBox(
                    width: 35,
                  ),
                  Expanded(
                    child: Text('от 2 000 200 850Р', style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: SizedBox(
                width: double.infinity,
                height: 34,
                child: OutlinedButton.icon(
                  label: Text('В корзину'),
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    print('Pressed');
                  },
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
