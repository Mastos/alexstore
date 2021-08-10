import 'package:flutter/material.dart';

class CategoryItemCard extends StatefulWidget {
  const CategoryItemCard({
    Key? key,
    required this.isSelected, required this.name,
  }) : super(key: key);

  final bool isSelected;
  final String name;

  @override
  _CategoryItemCardState createState() => _CategoryItemCardState();
}

class _CategoryItemCardState extends State<CategoryItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5),
      child: GestureDetector(
        onTap: (){},
        child: Container(
          width: 100,
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: widget.isSelected == true ? Color(0xff36B5B9) : Colors.transparent
              ),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone_android, color: widget.isSelected == true ? Color(0xff36B5B9) : Colors.black,),
              Text('${widget.name}', maxLines: 2,
                  overflow: TextOverflow.ellipsis, style: TextStyle(color: widget.isSelected == true ? Color(0xff36B5B9) : Colors.black), textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    );
  }
}