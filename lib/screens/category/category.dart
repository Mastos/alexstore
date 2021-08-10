import 'package:alexstore/models/product.dart';
import 'package:alexstore/screens/catalog/catalog.dart';
import 'package:alexstore/screens/category/widgets/category_item_card.dart';
import 'package:alexstore/screens/product_detail/product_detail.dart';
import 'package:alexstore/services/service.dart';
import 'package:alexstore/widgets/products/product_card.dart';
import 'package:alexstore/widgets/title_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool isSelected = false;
  String dropdownValue = 'От дешевых к дорогим';
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
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 100.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CategoryItemCard(
                          isSelected: true, name: 'Смартфон',),
                        CategoryItemCard(
                          isSelected: false, name: 'Кнопочные телефоны'),
                        CategoryItemCard(
                          isSelected: false, name: 'Планшеты',),
                        CategoryItemCard(
                          isSelected: false, name: 'Смартфон',),
                        CategoryItemCard(
                          isSelected: false, name: 'Планшеты',),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: Color(0xff97ABB4)
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xff97ABB4)),
                      iconSize: 20,
                      elevation: 14,
                      style: const TextStyle(color: Colors.black),
                      isExpanded: true,
                      underline: Container(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['От дешевых к дорогим', 'От дорогих к дешевым',]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: Color(0xff97ABB4)
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/equalizer.svg',height: 20, width: 20,),
                            Text('Фильтр'),
                          ],
                        ),
                        Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xff97ABB4),)
                      ],
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(
                          height: 24,
                          width: 24,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Color(0xff97ABB4)
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: SvgPicture.asset('assets/icons/list.svg'),
                        ),
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Color(0xff97ABB4)
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: SvgPicture.asset('assets/icons/menu.svg', color: Color(0xff71858D),),
                      ),
                    ],
                  ),
                ),
                TitleCustom(name: 'Хиты продаж'),
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
                        if(product != null) {
                          return ProductCard(
                            name: product.name,
                            press: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetail(product: product),
                                )
                            ),
                          );
                        }else {
                          return Center(child: CircularProgressIndicator());
                        }

                      }),
                ),
                Text('test'),
              ],
            )
          ],
        )
      )
    );
  }
}

