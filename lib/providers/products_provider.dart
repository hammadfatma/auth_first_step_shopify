import 'package:auth_first_step_shopify/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../utils/collection_util.dart';
import 'package:quickalert/quickalert.dart';
class ProductsProvider{
  List<ProductsModel> products = [];
  Future<List<ProductsModel>> getProducts(BuildContext context,{int? limit}) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> productsSnapshot;
      if (limit!=null) {
        productsSnapshot = await FirebaseFirestore.instance
            .collection(CollectionsUtils.products.name).orderBy('createdAt').limit(limit).get();
      }else{
        productsSnapshot = await FirebaseFirestore.instance
            .collection(CollectionsUtils.products.name).orderBy('createdAt').get();
      }
      products = productsSnapshot.docs.map((e) {
        return ProductsModel(
            id: e.id,
            name: e.get('name'),
            image: e.get('image'),
            price: e.get('price') is int ? (e.get('price') as int).toDouble() : e.get('price')
        );
      }).toList();
      return products;
    } catch (e) {
      if (context.mounted) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Oops...',
          text: 'Sorry, something went wrong',
        );
      }
      debugPrint('Error : $e');
      return[];
    }
  }
}