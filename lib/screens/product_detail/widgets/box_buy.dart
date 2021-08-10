import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoxBuy extends StatelessWidget {
  const BoxBuy({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('В наличии 2 шт в'),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text('2 '),
                        Text('магазинах'),
                      ],
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textDirection: TextDirection.ltr,
                    text: TextSpan(
                      text: "от",
                      style: TextStyle(fontSize: 12, color: Color(0xff343434)),
                      children: <TextSpan>[
                        TextSpan(text: " 7 830₽ ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        TextSpan(text: "/ шт", style: TextStyle()),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('1 шт'),
                  Column(children: [
                    GestureDetector(
                      onTap: () {
                        print('up');
                      },
                      child: SizedBox(
                        height: 20,
                        child: Icon(Icons.keyboard_arrow_up),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('down');
                      },
                      child: SizedBox(
                        height: 20,
                        child: Icon(Icons.keyboard_arrow_down),
                      ),
                    ),
                  ]),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: SvgPicture.asset('assets/icons/shopping-cart-2.svg'),
                    label: Text('В Корзину', style: TextStyle(color: Color(0xff343434)),),
                    onPressed: () {
                      print('Button Pressed');
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffFBB819),
                        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                        textStyle: TextStyle(
                            fontSize: 16)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}