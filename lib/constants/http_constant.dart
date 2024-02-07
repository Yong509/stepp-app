class HttpConstants {
  static const statusOk = 200;

  static final responseHeader = {
    'content-type': 'application/json; charset=utf-8',
  };
  static Map<String, String> getBearerTokenString(String accessToken) => {
        'Authorization': accessToken,
      };

  static const authorizationKey = 'Authorization';
}
