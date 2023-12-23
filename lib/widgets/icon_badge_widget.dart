import 'package:flutter/material.dart';

class IconBadgeWidget extends StatelessWidget {
  const IconBadgeWidget({super.key, required this.txt, required this.con, required this.fl});
  final String txt;
  final IconData con;
  final bool fl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon: Transform.flip(
            flipX: fl,
            child: Icon(
              con,
              color: Color(0xff727c8e),
              size: 20,
            ),
          ),
        ),
        Positioned(
          bottom: 6,
          child: Badge(
            smallSize: 15,
            backgroundColor: Color(0xffff6969),
            label: Text(
              txt,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
        ),
      ],
    );
  }
}