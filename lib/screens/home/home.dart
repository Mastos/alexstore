import 'package:alexstore/models/popularCategories.dart';
import 'package:alexstore/Services/service.dart';
import 'package:alexstore/models/product.dart';
import 'package:alexstore/screens/cart/cart.dart';
import 'package:alexstore/screens/product_detail/product_detail.dart';
import 'package:alexstore/widgets/buttons/button_appbar.dart';
import 'package:alexstore/widgets/products/product_card.dart';
import 'package:alexstore/widgets/title_custom.dart';
import 'widgets/mainSlider.dart';
import 'package:alexstore/widgets/popularCategoryItem.dart';
import 'package:flutter/material.dart';
import '../catalog/catalog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PopularCategories>? _popularCategories;
  List<Product>? _product;
  @override
  void initState() {
    super.initState();
    Service.getPopularCategories().then((popularCategories) {
      setState(() {
        _popularCategories = popularCategories;
      });
    });
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
            // backgroundColor: Color(0xffF4F4F4),
            title: Text("AppBar Title"),
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left:15, right: 15),
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
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainSlider(),
                  TitleCustom(name: 'Популярные категории'),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 7),
                      itemBuilder: (context, index) {
                        PopularCategories? popularCategories =
                            _popularCategories?[index];
                        if(popularCategories == null) {
                          return Center(child: CircularProgressIndicator());
                        }else {
                          return PopularCategoryItem(
                              name: popularCategories.name,
                              img: popularCategories.img);
                        }
                      }),
                  TitleCustom(name: 'Хиты продаж'),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: 2,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        childAspectRatio: 0.63,
                      ),
                      itemBuilder: (context, index) {
                        Product? product = _product?[index];
                        if(product == null) {
                          return Center(child: CircularProgressIndicator());
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
                  TitleCustom(name: 'Скидки и выгодные предложения'),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: 2,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (context, index) {
                        Product? product = _product?[index];
                        if(product == null) {
                          return Center(child: CircularProgressIndicator());
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
                    ButtonAppBar(path: 'assets/icons/home.svg', text: 'Главная',),
                    ButtonAppBar(path: 'assets/icons/menu-appbar.svg', text: 'Каталог',),
                    ButtonAppBar(path: 'assets/icons/shopping-cart.svg', text: 'Корзина', press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartView(),
                        )
                    )),
                    ButtonAppBar(path: 'assets/icons/heart.svg', text: 'Избранное',),
                    ButtonAppBar(path: 'assets/icons/profile.svg', text: 'Кабинет',),
                  ],
          ),
              ),
        )));
  }
}
