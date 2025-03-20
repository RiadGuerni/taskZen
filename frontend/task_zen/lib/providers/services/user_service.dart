import 'package:task_zen/models/user.dart';
import 'package:task_zen/providers/services/auth_service.dart';
import 'package:task_zen/providers/services/storage_service.dart';

class UserService {
  // singleton pattern
  UserService._private();
  static final UserService _instance = UserService._private();

  factory UserService() {
    return _instance;
  }
  //
  createUser(String username, String token, String taskListId) {
    final StorageService storage = StorageService();
    final user = User(username: username, token: token, taskListId: taskListId);
    // WARNIINNGGGGGG !! Due to problems with the secure_storage package,
    // we are using shared_preferences to store the token  which is wrong for production x)
    storage.writeUser(user);
    return user;
  }

  Future<void> logout(User user) async {
    final StorageService storage = StorageService();
    await storage.deleteUser();
  }

  getCurrentUser() async {
    AuthService authService = AuthService();
    final StorageService storage = StorageService();
    final User? user = await storage.readUser();
    if (user != null) {
      final isValid = await authService.verifyToken(user.token);
      if (!isValid) {
        await storage.deleteUser();
        return null;
      }
    }
    return user;
  }
}
