class Categories {
  final String id;
  final String title;
  final String backColor1;
  final String backColor2;
  final String? imagePath;
  final String shadowColor;
  // final String description;

  Categories(
      {required this.id,
      required this.title,
      this.imagePath,
      required this.shadowColor,
      required this.backColor1,
      required this.backColor2});

  // factory Categories.fromJson(Map<String, dynamic> json) {
  //   return Categories(
  //       id: json['id'], title: json['title'], description: json['description']);
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['title'] = title;
  //   data['description'] = description;
  //   return data;
  // }
}
