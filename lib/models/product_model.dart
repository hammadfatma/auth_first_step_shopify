class ProductsModel {
  final String? id;
  final String name;
  final double price;
  final String image;
  // final int quantity;
  // final String categoryId;
  // final String description;

  ProductsModel(
      {this.id,
      required this.name,
      required this.price,
      required this.image});
  // required this.categoryId,
  // required this.description,
  // required this.quantity});
  // Products.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  //   categoryId = json['categoryId'];
  //   description = json['description'];
  //   price = json['price'];
  //   quantity = json['quantity'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['categoryId'] = this.categoryId;
  //   data['description'] = this.description;
  //   data['price'] = this.price;
  //   data['quantity'] = this.quantity;
  //   return data;
  // }
}
