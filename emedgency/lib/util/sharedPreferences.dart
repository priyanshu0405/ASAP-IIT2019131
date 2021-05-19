import 'package:emedgency/model/updateModel.dart';
import 'package:emedgency/model/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(Founduser user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("id", user.id);
    prefs.setString("name", user.name);
    prefs.setString("email", user.email);
    prefs.setString("address", user.address);
    prefs.setString("bp", user.history[0].bp);
    prefs.setInt("oxylvl", user.history[0].oxylvl);
    prefs.setInt("heartrate", user.history[0].heartrate);
    prefs.setInt("sugarlevel", user.history[0].sugarlevel);
    prefs.setInt("fever", user.history[0].fever);
    prefs.setString("timestamp", user.history[0].timestamp);
    prefs.setString("username", user.username);
    prefs.setString("dob", user.dob);
    prefs.setInt("v", user.v);
    prefs.setString("phone", user.phone);
    prefs.setString("role", user.role);
    // prefs.setString("token", user.salt);
    // prefs.setString("hash", user.hash);

    print("object prefere");
    // print(user.hash);

    return prefs.commit();
  }

  Future<UserModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String id = prefs.getString("id");
    String name = prefs.getString("name");
    String email = prefs.getString("email");
    String address = prefs.getString("address");
    String bp = prefs.getString("bp");
    int oxylvl = prefs.getInt("oxylvl");
    int heartrate = prefs.getInt("heartrate");
    int sugarlevel = prefs.getInt("sugarlevel");
    int fever = prefs.getInt("fever");
    String dob = prefs.getString("dob");
    int v = prefs.getInt("v");
    String username = prefs.getString("username");
    String phone = prefs.getString("phone");
    String role = prefs.getString("role");
    String salt = prefs.getString("salt");
    String hash = prefs.getString("hash");
    String timestamp = prefs.getString("timestamp");

    return UserModel(
        id: id,
        name: name,
        email: email,
        address: address,
        dob: dob,
        username: username,
        v: v,
        phone: phone,
        role: role,
        salt: salt,
        hash: hash);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    // prefs.remove("name");
    // prefs.remove("email");
    // prefs.remove("phone");
    // prefs.remove("role");
    // prefs.remove("salt");
  }

  Future<String> getToken(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("salt");
    return token;
  }

  Future<bool> saveUserLogin(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("id", user.id);
    prefs.setString("name", user.name);
    prefs.setString("email", user.email);
    prefs.setString("address", user.address);
    prefs.setString("bp", user.history[0].bp);
    prefs.setInt("oxylvl", user.history[0].oxylvl);
    prefs.setInt("heartrate", user.history[0].heartrate);
    prefs.setInt("sugarlevel", user.history[0].sugarlevel);
    prefs.setInt("fever", user.history[0].fever);
    prefs.setString("timestamp", user.history[0].timestamp);
    prefs.setString("username", user.username);
    prefs.setString("dob", user.dob);
    prefs.setInt("v", user.v);
    prefs.setString("phone", user.phone);
    prefs.setString("role", user.role);
    prefs.setString("token", user.salt);
    prefs.setString("hash", user.hash);

    print("object prefere");
    print(user.hash);

    return prefs.commit();
  }
}
