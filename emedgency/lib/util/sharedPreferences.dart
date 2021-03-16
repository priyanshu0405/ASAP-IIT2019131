import 'package:emedgency/model/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("id", user.id);
    prefs.setString("name", user.name);
    prefs.setString("email", user.email);
    prefs.setString("phone", user.phone);
    prefs.setString("role", user.role);
    prefs.setString("token", user.salt);
    prefs.setString("hash", user.hash);

    print("object prefere");
    print(user.hash);

    return prefs.commit();
  }

  Future<UserModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String id = prefs.getString("id");
    String name = prefs.getString("name");
    String email = prefs.getString("email");
    String phone = prefs.getString("phone");
    String role = prefs.getString("role");
    String salt = prefs.getString("salt");
    String hash = prefs.getString("hash");

    return UserModel(
        id: id,
        name: name,
        email: email,
        phone: phone,
        role: role,
        salt: salt,
        hash: hash);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("name");
    prefs.remove("email");
    prefs.remove("phone");
    prefs.remove("role");
    prefs.remove("salt");
  }

  Future<String> getToken(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("salt");
    return token;
  }
}
