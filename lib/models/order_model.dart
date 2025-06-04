class OrderModel {
  String? orderID;
  String? coolerId;
  DateTime? date;
  double? paidAmount;
  String? paymentStatus;
  List<ProductModel>? products;

  OrderModel({
    this.orderID,
    this.coolerId,
    this.date,
    this.paidAmount,
    this.paymentStatus,
    this.products,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderID: json['orderID'] as String?,
      coolerId: json['coolerId'] as String?,
      date:
          json['date'] != null
              ? DateTime.fromMillisecondsSinceEpoch(json['date'])
              : null,
      paidAmount: (json['paidAmount'] as num?)?.toDouble(),
      paymentStatus: json['paymentStatus'] as String?,
      products:
          (json['product'] as List<dynamic>?)
              ?.map((item) => ProductModel.fromJson(item))
              .toList(),
    );
  }

  static List<OrderModel> fromDecodedJsonList(List<dynamic>? decodedList) {
    if (decodedList == null) return [];
    return decodedList.map((json) => OrderModel.fromJson(json)).toList();
  }
}

class ProductModel {
  String? productName;
  int? productId;
  double? perProductPrice;
  int? productCount;
  String? productOtherUrl;

  ProductModel({
    this.productName,
    this.productId,
    this.perProductPrice,
    this.productCount,
    this.productOtherUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['productName'] as String?,
      productId: json['productId'] as int?,
      perProductPrice: (json['perProductPrice'] as num?)?.toDouble(),
      productCount: json['productCount'] as int?,
      productOtherUrl: json['productOtherUrl'] as String?,
    );
  }
}
