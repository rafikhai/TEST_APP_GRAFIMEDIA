import '../service/base_network.dart';

class BookDataSource {
  static BookDataSource instance = BookDataSource();

  // loadCountries() mengembalikan nilai dari class BaseNetwork dengan method get()
  // diisi dengan parameter “countries” dikarenakan kita ingin mengambil list dari
  // negara-negara.
  Future<Map<String, dynamic>> loadBooks(String text) {
    return BaseNetwork.get(text);
  }
}
