import 'package:alexstore/models/product.dart';
import 'package:alexstore/screens/catalog/catalog.dart';
import 'package:alexstore/screens/product_detail/widgets/box_buy.dart';
import 'package:alexstore/screens/product_detail/widgets/color_dot.dart';
import 'package:alexstore/screens/product_detail/widgets/slider.dart';
import 'package:alexstore/screens/product_detail/widgets/tab.dart';
import 'package:alexstore/services/service.dart';
import 'package:alexstore/widgets/block_widget.dart';
import 'package:alexstore/widgets/products/product_card.dart';
import 'package:alexstore/widgets/title_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetail extends StatefulWidget {
  final Product? product;
  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  List<Product>? _product;
  @override
  void initState() {
    super.initState();
    Service.getProduct().then((productItem) {
      setState(() {
        _product = productItem;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
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
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back)),
                    ),
                    Flexible(
                      child: Text(
                        '${widget.product?.name}',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
                SliderView(),
                BoxBuy(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffF4F4F4),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 5.0,
                                        bottom: 5.0),
                                    child: Text(
                                      'Артикул: 5060',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff71858D)),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Text(
                                  'Операционная система',
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xff71858D)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text('Android 10 HMS',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff343434))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Text('Дисплей',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff71858D))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text('5.45", IPS',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff343434))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Text('Разрешение дисплея',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff71858D))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text('1440x720',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff343434))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Text('Процессор',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff71858D))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                    'MediaTek Helio P22, 2000МГц, 8-ми ядерный',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff343434))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Text('Объем оперативной памяти',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff71858D))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text('2 ГБ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff343434))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Text('Объем встроенной памяти',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff71858D))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text('32 ГБ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff343434))),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Text('Цвет'),
                              ColorDot(
                                color: Color(0xff343434),
                                isSelected: true,
                              ),
                              ColorDot(color: Color(0xffBBCFD8)),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text('Категория'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  constraints: BoxConstraints(minWidth: 50),
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xffBBCFD8)),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                      child: Text('A',
                                          style: TextStyle(
                                            color: Color(0xffBBCFD8),
                                            fontSize: 18,
                                          ))),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TabView(),
                BlockWidget(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Доставка в '),
                            GestureDetector(
                              child: Row(
                                children: [
                                  Text('Москве'),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 14,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Text('Самовывоз из наших магазинов'),
                        Text('Забрать завтра с 10:00'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Курьер по вашему адресу'),
                        Text('Доставка завтра с 18:00'),
                      ],
                    ),
                  ),
                ),
                BlockWidget(child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Оплата')
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: SvgPicture.asset('assets/icons/done-tick.svg'),
                          ),
                          Text('Наличная'),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: SvgPicture.asset('assets/icons/done-tick.svg'),
                          ),
                          Text('Google Pay'),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: SvgPicture.asset('assets/icons/done-tick.svg'),
                          ),
                          Text('Картой онлайн'),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: SvgPicture.asset('assets/icons/done-tick.svg'),
                          ),
                          Text('Безналичными для юридических лиц'),
                        ],
                      ),
                    ],
                  ),
                ),
                ),
                BlockWidget(child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Гарантия'),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/verified.svg'),
                          Text('Срок гарантии уценки: 90 к.дн.'),
                        ],
                      )
                    ],
                  ),
                ),),
                TitleCustom(name: 'Также вас могут заинтересовать'),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: 2,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        childAspectRatio: 0.69,
                      ),
                      itemBuilder: (context, index) {
                        Product? product = _product?[index];
                        if(product == null) {
                          return CircularProgressIndicator();
                        }else{
                          return ProductCard(
                            name: product.name,
                            press: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetail(product: product),
                                )
                            ),
                          );
                        }
                      }),
                ),
                Center(
                  child: SizedBox(
                    width: 164,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.grey,
                      ),
                      onPressed: () {
                        print('Pressed');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('Показать еще',
                                style: TextStyle(color: Color(0xff71858D))),
                          ),
                          Icon(Icons.keyboard_arrow_down,
                              size: 20, color: Color(0xff71858D)),
                        ],
                      ),
                    ),
                  ),
                ),
                TitleCustom(name: 'Вместе с этим товаром покупают'),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: 2,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        childAspectRatio: 0.69,
                      ),
                      itemBuilder: (context, index) {
                        Product? product = _product?[index];
                        if(product == null) {
                          return CircularProgressIndicator();
                        }else{
                          return ProductCard(
                            name: product.name,
                            press: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetail(product: product),
                                )
                            ),
                          );
                        }
                      }),
                ),
                Center(
                  child: SizedBox(
                    width: 164,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.grey,
                      ),
                      onPressed: () {
                        print('Pressed');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('Показать еще',
                                style: TextStyle(color: Color(0xff71858D))),
                          ),
                          Icon(Icons.keyboard_arrow_down,
                              size: 20, color: Color(0xff71858D)),
                        ],
                      ),
                    ),
                  ),
                ),
                TitleCustom(name: 'Вы недавно смотрели'),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: 2,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        childAspectRatio: 0.69,
                      ),
                      itemBuilder: (context, index) {
                        Product? product = _product?[index];
                        if(product == null) {
                          return CircularProgressIndicator();
                        }else{
                          return ProductCard(
                            name: product.name,
                            press: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetail(product: product),
                                )
                            ),
                          );
                        }
                      }),
                ),
                Center(
                  child: SizedBox(
                    width: 164,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.grey,
                      ),
                      onPressed: () {
                        print('Pressed');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('Показать еще',
                                style: TextStyle(color: Color(0xff71858D))),
                          ),
                          Icon(Icons.keyboard_arrow_down,
                              size: 20, color: Color(0xff71858D)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}


