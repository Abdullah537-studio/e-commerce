import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> saveData({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> getData({required String key}) async {
    return await _storage.read(key: key);
  }

  Future<void> removeData({required String key}) async {
    await _storage.delete(key: key);
  }

  Future<void> clearData() async {
    await _storage.deleteAll();
  }
}
