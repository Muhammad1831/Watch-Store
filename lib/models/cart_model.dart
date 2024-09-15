class CartModel {
  List<UserCart> userCart;
  int? cartTotalPrice;
  int? totalWithoutDiscountPrice;

  CartModel(
      {required this.userCart,
      required this.cartTotalPrice,
      required this.totalWithoutDiscountPrice});

  factory CartModel.fromJosn(dynamic json) {
    return CartModel(
        userCart: (json['user_cart'] as List)
            .map((e) => UserCart.fromJson(e))
            .toList(),
        cartTotalPrice: json['cart_total_price'],
        totalWithoutDiscountPrice: json['total_without_discount_price']);
  }

  Map<String, dynamic> toJson() {
    return {
      'user_cart': userCart,
      'cart_total_price': cartTotalPrice,
      'total_without_discount_price': totalWithoutDiscountPrice,
    };
  }
}

class UserCart {
  bool isLoading = false;
  int? id;
  int? productId;
  String? product;
  int? count;
  int? price;
  int? discount;
  int? discountPrice;
  String? image;

  UserCart(
      {this.isLoading = false,
      required this.id,
      required this.productId,
      required this.product,
      required this.count,
      required this.price,
      required this.discount,
      required this.discountPrice,
      required this.image});

  factory UserCart.fromJson(dynamic json) {
    return UserCart(
        id: json['id'],
        productId: json['product_id'],
        product: json['product'],
        count: json['count'],
        price: json['price'],
        discount: json['discount'],
        discountPrice: json['discount_price'],
        image: json['image']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'product': product,
      'count': count,
      'price': price,
      'discount': discount,
      'discount_price': discountPrice,
      'image': image,
    };
  }
}
