class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://jsonplaceholder.typicode.com";
  static const String backendUrl = "http://192.168.101.5:3000";

  // receiveTimeout
  static const int receiveTimeout = 5000;

  // connectTimeout
  static const int connectionTimeout = 3000;

  // booking endpoints
  static const String getPosts = baseUrl + "/posts";

  static const String getProducts = backendUrl + "/products";
  static const String getBrands = backendUrl + "/brands";
}
