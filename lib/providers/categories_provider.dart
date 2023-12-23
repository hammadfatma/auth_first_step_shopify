import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category_model.dart';
import 'package:flutter/material.dart';
import '../utils/collection_util.dart';
import 'package:quickalert/quickalert.dart';
class CategoriesProvider{
  List<CategoriesModel> cats = [];
  Future<List<CategoriesModel>> getCategories(BuildContext context,{int? limit}) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> catsSnapshot;
      if (limit!=null) {
        catsSnapshot = await FirebaseFirestore.instance
            .collection(CollectionsUtils.categories.name).orderBy('createdAt').limit(limit).get();
      }else{
        catsSnapshot = await FirebaseFirestore.instance
            .collection(CollectionsUtils.categories.name).orderBy('createdAt').get();
      }
      cats = catsSnapshot.docs.map((e) {
        return CategoriesModel(
            id: e.id,
            title: e.get('title'),
            imagePath: e.get('imagePath'),
            shadowColor: e.get('shadowColor'),
            backColor1: e.get('backColor1'),
            backColor2: e.get('backColor2'));
      }).toList();
      return cats;
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