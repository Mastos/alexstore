import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

Future<List<dynamic>> getImageList() async {
  var url = Uri.parse(
      "http://www.json-generator.com/api/json/get/cfrxyAbYde?indent=2");
  var res = await http.get(url);
  List<dynamic> t = json.decode(res.body);
  dynamic obj = t[0];
  List<dynamic> images = obj["picture"];
  print(images);
  return images;
}

class SliderView extends StatefulWidget {
  SliderViewState createState() => SliderViewState();
}

class SliderViewState extends State<SliderView> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: getImageList(),
        builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          return Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 200,
                    width: 40,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: snap.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              _controller.animateToPage(index);
                              this.setState(() {
                                _current = index;
                              });
                            },
                            child:
                            Stack(alignment: Alignment.center, children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                    Border.all(color: Color(0xffBBCFD8)),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                  ),
                                  height: 46,
                                  width: 46,
                                  child: CachedNetworkImage(
                                    imageUrl: snap.data![index],
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                              Center(
                                child: Icon(
                                  _current == index ? Icons.circle : null,
                                  color: Colors.orange,
                                  size: 12,
                                ),
                              ),
                            ]),
                          );
                        }),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 70,
                      child: CarouselSlider(
                        items: snap.data!
                            .map((item) => Container(
                          child: Image.network(item),
                          color: Colors.white,
                        ))
                            .toList(),
                        options: CarouselOptions(
                            scrollDirection: Axis.vertical,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                        carouselController: _controller,
                      ))
                ],
              ));
        }else {
          return CircularProgressIndicator();
        }

        });
  }
}
