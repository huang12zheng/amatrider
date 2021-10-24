mixin EndPoints {
  static const String APP_DOMAIN = 'api.manuelsnr.design';
  static const String API_ENDPOINT = '/api/v1';
  static const String BASE_URL = 'https://$APP_DOMAIN$API_ENDPOINT';
  static const String PUSHER_AUTH_URL =
      'https://api.manuelsnr.design/broadcasting/auth';
  static const String SLEEP = '/rider/sleep';

  //.....///.....// AUTHENTICATION ENDPOINTS ....////././//...//
  static const String LOGIN = '/rider/auth/login';
  static const String REGISTER = '/rider/auth/register';
  static const String LOGOUT = '/rider/auth/logout';
  static const String RESEND_PHONE_VERIFICATION =
      '/rider/auth/verify/phone/resend';
  static const String CONFIRM_PHONE_VERIFICATION = '/rider/auth/verify/phone';
  static const String SEND_PASSWORD_RESET_MESSAGE =
      '/rider/auth/forgot-password';
  static const String CONFIRM_PASSWORD_RESET = '/rider/auth/reset-password';
  static const String GOOGLE_SIGNIN = '/rider/auth/google/authenticate';
  static const String FACEBOOK_SIGNIN = '/rider/auth/facebook/authenticate';
  static const String APPLE_SIGNIN = '/rider/auth/apple/authenticate';

  /// .......///////...// USER ENDPOINTS .......///////./....//
  static const String GET_USER = '/rider/user';
  static const String UPDATE_PASSWORD = '/rider/user/password'; // (PATCH)
  static const String UPDATE_PHONE = '/rider/user/profile/phone'; // (POST)
  static const String CONFIRM_UPDATE_PHONE =
      '/rider/user/profile/phone'; // (PATCH)
  static const String UPDATE_USER_PROFILE = '/rider/user/profile'; // (POST)

  //.....///.....// UTILITIES ENDPOINTS ....////././//...//
  static const String COUNTRIES = '/utilities/countries';
  static const String BANKS = '/banks';
}
