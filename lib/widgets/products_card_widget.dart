import 'package:auth_first_step_shopify/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});
  final ProductsModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            // width: 101,
            // height: 135,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffe7eaf0),
                    offset: Offset(0, 10),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    product.image,
                    width: 85,
                    height: 79,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff515c6f),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff515c6f),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
