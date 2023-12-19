import 'package:auth_first_step_shopify/utils/collection_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import '../models/ads_model.dart';
import '../models/category_model.dart';
//import 'package:quickalert/quickalert.dart';

class HomeProvider extends ChangeNotifier {
  List<Advertisements> ads = [];
  List<Categories> cats = [];
  Future<void> getDataFromFireStore() async {
    // QuickAlert.show(
    //   context: context,
    //   type: QuickAlertType.loading,
    //   title: 'Loading',
    //   text: 'Fetching your data',
    // );
    try {
      final adsSnapshot = await FirebaseFirestore.instance
          .collection(CollectionsUtils.ads.name)
          .get();
      final catsSnapshot = await FirebaseFirestore.instance
          .collection(CollectionsUtils.categories.name).orderBy('createdAt')
          .get();
      ads = adsSnapshot.docs.map((e) {
        return Advertisements(
            title: e.get('title'), imageURL: e.get('imageURL'), id: e.id);
      }).toList();
      cats = catsSnapshot.docs.map((e) {
        return Categories(
            id: e.id,
            title: e.get('title'),
            imagePath: e.get('imagePath'),
            shadowColor: e.get('shadowColor'),
            backColor1: e.get('backColor1'),
            backColor2: e.get('backColor2'));
      }).toList();
      notifyListeners();
    } catch (e) {
      // if (context.mounted) {
      //   QuickAlert.show(
      //     context: context,
      //     type: QuickAlertType.error,
      //     title: 'Oops...',
      //     text: 'Sorry, something went wrong',
      //   );
      // }
      debugPrint('Error : $e');
    }
  }
}
