class AppApi {
  AppApi._();

  static const String baseUrl =
      "https://watchstore.sasansafari.com$versionRoute";
  static const String versionRoute = "/public/api/v1";

  static const String sendSms = "$baseUrl/send_sms";
  static const String checkSmsCode = "$baseUrl/check_sms_code";
  static const String register = "$baseUrl/register";
  static const String brands = "$baseUrl/brands";
  static const String search = "$baseUrl/all_products/";
  static const String productsByCategory = "$baseUrl/products_by_category/";
  static const String productsByBrand = "$baseUrl/products_by_brand/";
  static const String home = "$baseUrl/home";
  static const String productDetails = '$baseUrl/product_details/';
  static const String userCart = '$baseUrl/user_cart';
  static const String addToCart = '$baseUrl/add_to_cart';
  static const String removeFromCart = '$baseUrl/remove_from_cart';
  static const String deleteFromCart = '$baseUrl/delete_from_cart';
  static const String userProfile = '$baseUrl/profile';
  static const String userAddress = '$baseUrl/user_addresses';
  static const String userReceivedOrders = '$baseUrl/user_received_orders';
  static const String userCancelledOrders = '$baseUrl/user_cancelled_orders';
  static const String userProcessingOrders = '$baseUrl/user_processing_orders';
  static const String payment = '$baseUrl/payment';
}

class SortBy {
  static const String newestProducts = '/newest_products';
  static const String cheapestProducts = '/cheapest_products';
  static const String mostExpensiveProducts = '/most_expensive_products';
  static const String mostViewedProducts = '/most_viewed_products';
}
//Bearer 1673|v1eJX7i7Wu7EC4l3Fz11ZnN0n3uIVMDM0kyjiflu
//https://watchstore.sasansafari.com/public/api/v1/user_cart/
