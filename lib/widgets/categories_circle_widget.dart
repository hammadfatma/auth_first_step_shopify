import 'package:auth_first_step_shopify/models/category_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoriesCircleWidget extends StatelessWidget {
  const CategoriesCircleWidget({super.key, required this.category});
  final CategoriesModel category;
  @override
  Widget build(BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(right: 20,top: 8,bottom: 8),
          child: Column(
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33),
                  gradient: LinearGradient(
                    colors: [
                      Color(int.parse(category.backColor1)),
                      Color(int.parse(category.backColor2))
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(int.parse(category.shadowColor))
                          .withOpacity(0.34),
                      offset: Offset(0, 10),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Center(
                  child: category.imagePath != 'null'
                      ? Image.network(
                          category.imagePath!,
                          width: 38,
                          height: 38,
                        ): Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 20,
                          color: Color(
                            0xffff6969,
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                category.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff515c6f),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        );
  }
}
