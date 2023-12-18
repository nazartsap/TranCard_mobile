class ApiConstants {
  static const String baseUrl = 'http://192.168.0.104:3000';
  static const String signUpUrl = '$baseUrl/auth/signup';
  static const String verifyUrl = '$baseUrl/auth/verify';
  static const String resendVerificationCodeUrl = '$baseUrl/auth/resend-verification-code';
  static const String loginUrl = '$baseUrl/auth/login';
  static const String cardUrl = '$baseUrl/card';
  static const String addCardUrl= '$baseUrl/card/add';
}