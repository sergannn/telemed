import '../models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Session {
  
  static late SharedPreferences data; //TODO rename to storagePlace

  static Future init() async {
    //
    data = await SharedPreferences.getInstance(); // TODO as provider

  }

  Future getUser() async {
    data.getBool("isLogin");
    data.getString("user_id");
    data.getString("username");
    data.getString("email");
    data.getString("first_name");
    data.getString("last_name");
    data.getString("photo");
    data.getString("authToken");
  }

  Future saveUser(UserModel user, {String cookie = ''}) async {
    data.setBool('isLogin', true);
    data.setString("user_id", user.patientId!);
    data.setString("username", user.userName!);
    data.setString("email", user.email!);
    data.setString("first_name", user.firstName!);
    data.setString("last_name", user.lastName!);
    data.setString("photo", user.photo ?? '');
    data.setString("authToken", user.authToken!);
    return true;
  }

  void removeUser() async {
    data.setBool('isLogin', false);
    data.remove("id");
    data.remove("user_id");
    data.remove("username");
    data.remove("email");
    data.remove("first_name");
    data.remove("last_name");
    data.remove("photo");
    data.remove("authToken");
  }

  Future<String?> getToken(args) async {
    final SharedPreferences storagePlace = await SharedPreferences.getInstance();
    String? token = storagePlace.getString("authToken");
    return token;
  }


}
