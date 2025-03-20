import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_zen/models/user.dart';

class StorageService {
  SharedPreferencesWithCache? _pref;
  // singleton pattern
  StorageService._private();
  static final instance = StorageService._private();
  factory StorageService() => instance;
  //
  createCache() async {
    _pref = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: {"token", "taskListId", "username"},
      ),
    );
  }

  writeUser(User user) {
    write('token', user.token);
    write('taskListId', user.taskListId);
    write('username', user.username);
  }

  readUser() {
    final token = read('token');
    final taskListId = read('taskListId');
    final username = read('username');
    if (token != null && taskListId != null && username != null) {
      return User(token: token, taskListId: taskListId, username: username);
    }
    return null;
  }

  deleteUser() async {
    await delete('token');
    await delete('taskListId');
    await delete('username');
  }

  write(String key, String value) async {
    await _pref!.setString(key, value);
  }

  String? read(String key) {
    final result = _pref!.getString(key);
    return result;
  }

  delete(String key) async {
    await _pref!.remove(key);
  }
}
