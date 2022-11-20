// ignore_for_file: constant_identifier_names

abstract class Urls {
  static const String apiKey = '18be70c0-4e4d-44ff-a475-50c51ece99a0';
  static const String baseUrl =
      'https://script.google.com/macros/s/AKfycbyKMZajlE7SLPuToXhU7XX7Arxi7js1o0JWs1Z-Tya0gSjFWl8gNMQ0JaEj3eA5Wpmf/exec'; //'https://ekskul.id/api';
  static const String banners = '$baseUrl/event/list';
  static const String users = '$baseUrl/users';
  static const String userRegister = '$users/registrasi';
  static const String userUpdate = '$users/update';

  static const String exercise = '$baseUrl/exercise';
  static const String couresList = '$exercise/data_course';
}

abstract class Asset {
  static const String LATAR = 'assets/latar/latar.jpeg';
  static const String LOGO = 'assets/logo/logoro.png';
  static const String GOOGLE = 'assets/logo/google.png';
}
