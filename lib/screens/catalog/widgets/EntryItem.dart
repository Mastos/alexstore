import 'package:alexstore/screens/category/category.dart';
import 'package:flutter/material.dart';

class EntryItem extends StatelessWidget {
  final Map<String, dynamic> entry;
  const EntryItem(this.entry);

  Widget _buildTiles(dynamic root) {
    String t = "${root["name"]}";
    if (root["sub"] == null) return ListTile(title: Text(t));
    return ExpansionTile(
      title: Text(t),
      children: root["sub"].map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget tiles = _buildTiles(entry);
    // print("tiles");
    // print(tiles);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Category(),
            )
        );
      },
        child: tiles
    );
  }
}