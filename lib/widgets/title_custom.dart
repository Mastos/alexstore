import 'package:flutter/material.dart';

class TitleCustom extends StatelessWidget {
  final String name;
  TitleCustom({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text('$name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}