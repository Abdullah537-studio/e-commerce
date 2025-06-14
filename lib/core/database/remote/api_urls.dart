class ApiUrls {
  //! Base URL
  static const String baseUrl = 'https://fakestoreapi.com/';
}

class ApiGet {
  static const String getProducts = 'products';
  static String getASingleProduct(int id) => 'products/$id';
  static const String getCarts = 'carts';
  static String getASingleCart(int id) => 'carts/$id';
  static const String getAllUsers = "users";
  static String getASingleUser(int id) => 'carts/$id';
  static const String login = "auth/login";
}

class ApiPost {
  static const String addNewProduct = 'products';
  static const String addANewCart = 'carts';
  static const String addANewUser = "users";
}

class ApiPut {
  static String updateASingleProduct(int id) => 'products/$id';
  static String updateASingleCart(int id) => 'carts/$id';
  static String updateUser(int id) => "users/$id";
}

class ApiPatch {}

class ApiDelet {
  static String deleteAProduct(int id) => 'products/$id';
  static String deleteACart(int id) => 'carts/$id';
  static String deleteAUser(int id) => 'users/$id';
}
