class Category {
  final int? id;
  final String categoryName;
  final String seoUrl;

  Category({this.id, required this.categoryName, required this.seoUrl});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryName: json["categoryName"],
        seoUrl: json["seoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName,
        "seoUrl": seoUrl,
      };
}
