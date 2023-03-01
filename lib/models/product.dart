class Product {
  final int? id;
  final int categoryId;
  final String productName;
  final String quantityPerUnit;
  final double unitPrice;
  final int unitsInStock;

  Product(
      {this.id,
      required this.categoryId,
      required this.productName,
      required this.quantityPerUnit,
      required this.unitPrice,
      required this.unitsInStock});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        categoryId: json["categoryId"],
        productName: json["productName"],
        quantityPerUnit: json["quantityPerUnit"],
        unitPrice: json["unitPrice"],
        unitsInStock: json["unitsInStock"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryId": categoryId,
        "productName": productName,
        "quantityPerUnit": quantityPerUnit,
        "unitPrice": unitPrice,
        "unitsInStock": unitsInStock,
      };
}
