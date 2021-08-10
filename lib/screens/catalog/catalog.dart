import 'package:flutter/material.dart';
import 'package:alexstore/services/service.dart';

import 'widgets/EntryItem.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 60.0),
                          child: SizedBox(
                            child: Text('Каталог'),
                          ),
                        )
                      ],
                    )
                  )
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    //
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.white,
                      textColor: Colors.black,
                      child: Icon(
                        Icons.close,
                        size: 20,
                      ),
                      padding: EdgeInsets.all(8),
                      shape: CircleBorder(),
                    ),
                  )
                )
              ],
            ),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                  future: getListData(),
                  builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snap) {
                    if (snap.connectionState == ConnectionState.done) {
                      //print(snap.data);
                      return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return EntryItem(snap.data?[index] as Map<String, dynamic>);
                        },
                        itemCount: snap.data?.length,
                      );
                    } else
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  }),
              flex: 4,
            )
          ],
        ),
      )
    );
  }
}
