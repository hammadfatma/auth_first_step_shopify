import 'package:flutter/material.dart';

class SelectedSize extends StatefulWidget {
  const SelectedSize({super.key});

  @override
  State<SelectedSize> createState() => _SelectedColorState();
}

class _SelectedColorState extends State<SelectedSize> {
  int selectedIndex = 0;
  final List<String> number = ['4.5', '5.0', '6.5', '7.0', '8.0'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 39,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: number.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (selectedIndex == index) {
                  selectedIndex = 0;
                } else {
                  selectedIndex = index;
                }
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  width: 72,
                  height: 39,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffffffff),
                  ),
                  child: Center(
                    child: Text(
                      number[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: selectedIndex == index
                              ? Color(0xffff6969)
                              : Color(0xff727c8e),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}