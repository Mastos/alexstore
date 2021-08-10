import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonAppBar extends StatelessWidget {
  final String path;
  final String text;
  final VoidCallback? press;
  const ButtonAppBar({
    Key ?key, required this.path, required this.text, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextButton(
          style: TextButton.styleFrom(
            shape: CircleBorder(),
          ),
          onPressed: () {},
          child: GestureDetector(
            onTap: press,
            child: Column(
              children: [
                SvgPicture.asset('$path', color: Color(0xff97ABB4), height: 20,
                  width: 20,), Text('$text', style: TextStyle(color: Color(0xff71858D), fontSize: 11),)
              ],
            ),
          )
      ),
    );
  }
}