import 'package:alexstore/constants/colors.dart';
import 'package:alexstore/models/cart.dart';
import 'package:alexstore/screens/catalog/catalog.dart';
import 'package:alexstore/services/service.dart';
import 'package:alexstore/widgets/buttons/button_appbar.dart';
import 'package:alexstore/widgets/page_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  bool isChecked = false;
  List<int> text = [1,2,3,4];
  List<Cart>? _product;
  void initState() {
    super.initState();
    getCartProducts().then((productsItem) {
      setState(() {
      _product = productsItem;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Color(0xffF4F4F4),
            title: Text("AppBar Title"),
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Москва и Московская область',
                            style: TextStyle(color: Color(0xff0699D6)),
                          ),
                        ],
                      ),
                      Column(
                        children: [Text('495 120-26-40')],
                      ),
                    ],
                  ),
                ),
              ),
            )),
        drawer: Catalog(),
        body: ListView(
          children: [
            PageTitle(name: 'Корзина'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 10.0),
                  //   child: Container(
                  //     width: MediaQuery.of(context).size.width,
                  //     height: 40,
                  //     child: Center(
                  //       child: ListView(
                  //         shrinkWrap: true,
                  //         //itemExtent: 50,
                  //         scrollDirection: Axis.horizontal,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.only(right: 10.0),
                  //             child: Container(
                  //               constraints:
                  //               BoxConstraints(minWidth: 40, minHeight: 40),
                  //               height: 30,
                  //               decoration: BoxDecoration(
                  //                   border: Border.all(
                  //                       width: 1, color: Color(0xff97ABB4)),
                  //                   borderRadius: BorderRadius.circular(5),
                  //                   color: Colors.white),
                  //               child: Center(child: Text('#1')),
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsets.only(right: 10.0),
                  //             child: Container(
                  //               constraints:
                  //               BoxConstraints(minWidth: 40, minHeight: 40),
                  //               height: 30,
                  //               decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(5),
                  //                   color: Colors.white),
                  //               child: Center(
                  //                   child: Text(
                  //                     '#2',
                  //                     style: TextStyle(color: Color(0xff97ABB4)),
                  //                   )),
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsets.only(right: 10.0),
                  //             child: Container(
                  //               constraints:
                  //               BoxConstraints(minWidth: 40, minHeight: 40),
                  //               height: 30,
                  //               decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(5),
                  //                   color: Colors.white),
                  //               child: Center(
                  //                   child: Text(
                  //                     '#3',
                  //                     style: TextStyle(color: Color(0xff97ABB4)),
                  //                   )),
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsets.only(right: 10.0),
                  //             child: Container(
                  //               constraints:
                  //               BoxConstraints(minWidth: 40, minHeight: 40),
                  //               height: 30,
                  //               decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(5),
                  //                   color: Colors.white),
                  //               child: Center(
                  //                   child: Text(
                  //                     '#4',
                  //                     style: TextStyle(color: Color(0xff97ABB4)),
                  //                   )),
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsets.only(right: 10.0),
                  //             child: Container(
                  //               constraints:
                  //               BoxConstraints(minWidth: 40, minHeight: 40),
                  //               height: 30,
                  //               decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(5),
                  //                   color: Color(0xff36B5B9)),
                  //               child: Center(
                  //                   child: Text(
                  //                     '+',
                  //                     style: TextStyle(color: Colors.white),
                  //                   )),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                                Text('Корзина #1'),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.close,
                                    size: 20,
                                  ),
                                  Text('Удалить корзину #1')
                                ],
                              ),
                            )
                          ],
                        ),
                        ListView.builder(
                            // scrollDirection: Axis.vertical,
                            shrinkWrap: true, //add this line
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                                return OrderCardItem();
                            }
                        ),
                        // OrderCardItem(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Выбрано 2 товара',
                              style: TextStyle(fontSize: 12),
                            ),
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    minimumSize: Size(136, 40)),
                                onPressed: () => {

                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.close,
                                      color: contentColor,
                                      size: 20,
                                    ),
                                    Text(
                                      'Удалить выбранное',
                                      style: TextStyle(color: contentColor),
                                    )
                                  ],
                                ))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Переместить в корзину',
                                  style: TextStyle(fontSize: 12)),
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    padding:
                                    EdgeInsets.only(left: 10, right: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0)),
                                      border: Border.all(
                                        width: 1,
                                        color: Color(
                                            0xff36B5B9), //                   <--- border width here
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text('2'),
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 16,
                                        )
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                      style: OutlinedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10.0),
                                                bottomRight:
                                                Radius.circular(10.0)),
                                          ),
                                          elevation: 0,
                                          backgroundColor: Color(0xff36B5B9),
                                          minimumSize: Size(98, 40)),
                                      onPressed: () => {},
                                      child: Row(
                                        children: [
                                          Text(
                                            'Переместить',
                                            style:
                                            TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Корзина #1'),
                              Container(child: Text('2 товара - 1.93 кг')),
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Color(0xffEFEFEF),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text('Товары'),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 2, right: 4, bottom: 2, left: 4),
                                    decoration: BoxDecoration(
                                        color: Color(0xffF4F4F4),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text('2'),
                                  )
                                ],
                              ),
                              Text('7 650₽'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text('Скидка'),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: 5, right: 10, bottom: 5, left: 10),
                                decoration: BoxDecoration(
                                    color: Color(0xffFBB819),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text('300₽'),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Color(0xffEFEFEF),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text('Общая стоимость'),
                                  ),
                                ],
                              ),
                              Text('7 350₽')
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0,
                                backgroundColor: Color(0xffFBB819),
                              ),
                              onPressed: () => {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.done, size: 16, color: primaryColor,),
                                  Text('Оформить заказ', style: TextStyle(color: primaryColor),),
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/icons/userAvatar.png'),
                    ),
                    ButtonAppBar(
                      path: 'assets/icons/home.svg',
                      text: 'Главная',
                    ),
                    ButtonAppBar(
                      path: 'assets/icons/menu-appbar.svg',
                      text: 'Каталог',
                    ),
                    ButtonAppBar(
                        path: 'assets/icons/shopping-cart.svg',
                        text: 'Корзина'),
                    ButtonAppBar(
                      path: 'assets/icons/heart.svg',
                      text: 'Избранное',
                    ),
                    ButtonAppBar(
                      path: 'assets/icons/profile.svg',
                      text: 'Кабинет',
                    ),
                  ],
                ),
              ),
            )));
  }
}

class OrderCardItem extends StatefulWidget {
  const OrderCardItem({
    Key? key,
  }) : super(key: key);

  @override
  _OrderCardItemState createState() => _OrderCardItemState();
}

class _OrderCardItemState extends State<OrderCardItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
        color: Color(0xffEFEFEF),
        width: 1,
      ))),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
        child: Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
              child: SizedBox(
                width: 50,
                height: 70,
                child: Image.network(
                    'https://alexstore24.ru/upload/iblock/5fc/18c0bd9f_bd2f_11eb_b80c_005056021804.jpg.png',
                    fit: BoxFit.fitHeight),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('',
                      style: TextStyle(fontSize: 14, color: linkColor)),
                  Text('Артикул: 10317',
                      style: TextStyle(fontSize: 12, color: contentColor)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('6 400 ₽',
                          style: TextStyle(
                              fontSize: 16,
                              color: primaryColor,
                              fontWeight: FontWeight.bold)),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFBB819)),
                        child: Text(
                          'Скидка 300₽',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Row(
                            children: [
                              Text('2 шт'),
                              Column(children: [
                                GestureDetector(
                                  onTap: () {
                                    print('up');
                                  },
                                  child: SizedBox(
                                    height: 16,
                                    child:
                                        Icon(Icons.keyboard_arrow_up, size: 18),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print('down');
                                  },
                                  child: SizedBox(
                                    height: 16,
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ))
                    ],
                  ),
                  Text('3 200 ₽/шт',
                      style: TextStyle(fontSize: 12, color: contentColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
