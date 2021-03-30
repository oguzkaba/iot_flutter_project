import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key key,
    @required this.size,
    @required this.icon,
    @required this.color,
    @required this.boxColor,
    @required this.text,
    @required this.textColor,
    @required this.title,
  }) : super(key: key);

  final Size size;
  final String icon;
  final Color color;
  final Color boxColor;
  final Color textColor;
  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            debugPrint("Oldu");
          },
          child: Container(
            margin: EdgeInsets.all(5),
            height: size.height * 0.1,
            width: size.width * 0.07,
            decoration: BoxDecoration(
              color: boxColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 30,
                  offset: Offset(5, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  icon,
                  color: color,
                ),
                SizedBox(height: size.height * 0.01),
                Text(text,
                    style: TextStyle(
                        fontSize: 10,
                        color: textColor,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
