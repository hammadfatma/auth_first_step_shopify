import 'package:flutter/material.dart';

class SelectedColor extends StatefulWidget {
  const SelectedColor({super.key});

  @override
  State<SelectedColor> createState() => _SelectedColorState();
}

class _SelectedColorState extends State<SelectedColor> {
  int selectedIndex = 0;
  final List<Color> colors = [
    Color(0xffed5199),
    Color(0xffff8c69),
    Color(0xff67b5f7),
    Color(0xffffffff),
    Color(0xffc9c9c9),
    Color(0xff3e3a3a),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 39,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if(selectedIndex == index){
                  selectedIndex = 0;
                }else{
                  selectedIndex = index;
                }
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 22),
                child: Container(
                  width: 39,
                  height: 39,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    color: colors[index],
                  ),
                  child: Center(
                    child: selectedIndex == index ? Icon(Icons.check,color: Colors.white,): null,
                  ),
                ),
              ),
            );
          }),
    );
  }
}