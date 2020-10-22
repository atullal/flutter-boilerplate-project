class Product {
  String id;
  String name;
  List<dynamic> category; // Category
  List<String> productImages;
  dynamic brand; // Brand
  dynamic productType;
  List<String> keywords;
  dynamic productDetails;
  Map<String, int> inventory;
  DateTime createdAt;
  DateTime updatedAt;

  Product(
      {this.id,
      this.name,
      this.category,
      this.productImages,
      this.brand,
      this.productType,
      this.keywords,
      this.productDetails,
      this.inventory,
      this.createdAt,
      this.updatedAt});

  factory Product.fromMap(Map<String, dynamic> json) => Product(
      id: json["doc._id"],
      name: json["doc.name"],
      category: json["doc.category"],
      productImages: json["doc.productImages"],
      brand: json["doc.brand"],
      productType: json["doc.productType.name"],
      keywords: json["doc.keywords"],
      productDetails: json["doc.productDetails"],
      inventory: json["inventory"],
      createdAt: json["doc.createdAt"],
      updatedAt: json["doc.updatedAt"]);

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "category": category,
        "productImages": productImages,
        "brand": brand,
        "productType": productType,
        "keywords": keywords,
        "productDetails": productDetails,
        "inventory": inventory,
        "createdAt": createdAt,
        "updatedAt": updatedAt
      };
}
