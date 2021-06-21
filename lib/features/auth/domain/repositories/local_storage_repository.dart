
import 'package:flutter_example05/features/auth/domain/entities/user.dart';

abstract class LocalRepository {
  Future<String?> getToken();
  Future<void> clearAllData();
  Future<User> saveUser(User user);
  Future<String?> saveToken(String token);
  Future<User> getUser();
}