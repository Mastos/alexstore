import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class TabView extends StatefulWidget {
  TabViewState createState() => TabViewState();
}

class TabViewState extends State<TabView> {
  int currentTab = 0;
  List<Widget> pages = [
    Text("Смартфон Huawei Honor 10i 4/128GB (HRY-LX1T) имеет большой экран с диагональю 5.45 дюйма, который характеризуется высоким разрешением. Пользователь будет видеть яркую, динамичную и насыщенную картинку. Устройство подходит для просмотра любого видео. В нем есть встроенная память объемом 32 Гб, но ее можно увеличить еще на 512 Гб за счет карты памятиПроизводительный восьмиядерный процессор MediaTek Helio P22 гарантирует скорость выполнения всех операций. Даже при использовании сложных приложений и игр гаджет работает быстро, зависания в нем исключены. Его обладатель сможет ни в чем себя не ограничивать, совершать любые действия без ограничений. Операционная система Android 10 HMS и 2 Гб оперативной памяти способствуют скорости отклика устройства."),
    Text("Tab2"),
    Text("Tab3"),
  ];
  List<String> titles = [
    "О товаре",
    "Характеристики",
    "Обзоры",
  ];
  @override
  void initState() {
    currentTab = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15),
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: titles.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      this.setState(() {
                        currentTab = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              padding: EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(
                                    color: index == currentTab ? Color(0xff36B5B9) : Colors.transparent,
                                    width: 2,// Underline thickness
                                  ))
                              ),
                              child: Text(
                                titles[index],
                                style: TextStyle(
                                    color:
                                    index == currentTab ? Colors.black : Color(0xff97ABB4),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: pages[currentTab],
              ),
            ),
          )
        ],
      );
  }
}