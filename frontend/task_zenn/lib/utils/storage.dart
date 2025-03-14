import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_zenn/models/user.dart';

class Storage {
  SharedPreferencesWithCache? _pref;
  // singleton pattern
  Storage._private();
  static final instance = Storage._private();
  factory Storage() => instance;
  //
  createCache() async {
    _pref = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: {"token", "taskListId", "email"},
      ),
    );
  }

  writeUser(User user) {
    write('token', user.token);
    write('taskListId', user.taskListId);
    write('email', user.email);
  }

  getUser() {
    final token = read('token');
    final taskListId = read('taskListId');
    final email = read('email');
    if (token != null && taskListId != null && email != null) {
      return User(token: token, taskListId: taskListId, email: email);
    }
    return null;
  }

  write(String key, String value) async {
    await _pref!.setString(key, value);
  }

  String? read(String key) {
    final result = _pref!.getString(key);
    return result;
  }
}
