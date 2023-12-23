class AdvertisementsModel {
  final String? id;
  final String imageURL;
  final String title;

  AdvertisementsModel(
      {required this.title, required this.imageURL, this.id});

  // factory Advertisements.fromJson(Map<String, dynamic> json) {
  //   return Advertisements(
  //     title: json['title'],
  //     imageURL: json['imageURL'],
  //     id: json['id'],
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['imageURL'] = imageURL;
  //   data['title'] = title;
  //   return data;
  // }
}
//
// Future<List<Advertisements>> loadData() async {
//   final response = await rootBundle.loadString('assets/data/data.json');
//   final data = jsonDecode(response);
//   final ads = data['advertisements'] as List<dynamic>;
//   final advertisements = ads.map((e) => Advertisements.fromJson(e)).toList();
//   return advertisements;
// }