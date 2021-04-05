import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
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
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(5),
        height: widget.size.height * 0.15,
        width: widget.size.width * 0.1,
        decoration: BoxDecoration(
          color: widget.boxColor,
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
            Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: widget.size.height * 0.02),
            Image.asset(
              widget.icon,
              color: widget.color,
            ),
            SizedBox(height: widget.size.height * 0.015),
            Text(widget.text,
                style: TextStyle(
                    fontSize: 10,
                    color: widget.textColor,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
