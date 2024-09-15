class UserStatusOrderModel {
  int id;
  int code;
  String status;
  List<OrderDetailsModel> orderDetails;

  UserStatusOrderModel(
      {required this.id,
      required this.code,
      required this.status,
      required this.orderDetails});

  factory UserStatusOrderModel.fromJson(dynamic json) {
    return UserStatusOrderModel(
        id: json['id'],
        code: json['code'],
        status: json['status'],
        orderDetails: (json['order_details'] as List)
            .map((e) => OrderDetailsModel.fromJson(e))
            .toList());
  }
}

class OrderDetailsModel {
  int id;
  String product;
  int count;
  int price;
  int discountPrice;
  String status;

  OrderDetailsModel(
      {required this.id,
      required this.product,
      required this.count,
      required this.price,
      required this.discountPrice,
      required this.status});

  factory OrderDetailsModel.fromJson(dynamic json) {
    return OrderDetailsModel(
        id: json['id'],
        product: json['product'],
        count: json['count'],
        price: json['price'],
        discountPrice: json['discount_price'],
        status: json['status']);
  }
}