class AppApi {
  AppApi._();
  
  static const baseUrl = "https://watchstore.sasansafari.com$versionRoute";
  static const versionRoute = "/public/api/v1";
  static const sendSms = "$baseUrl/send_sms";
  static const checkSmsCode = "$baseUrl/check_sms_code";
  static const register = "$baseUrl/register";
}
