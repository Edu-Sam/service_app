import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import "package:shopi_attendant/models/user.dart";


class UserRepository{
  final String url_fetch_user="https://shopilyv.com/shopiservice/login.php";

  UserRepository(){

  }

  Future<List<User>> fetchUserById(String email,String password) async{
    http.Response response=await http.post(
      url_fetch_user,
      headers: {"Accept":"application/json"},
      body:{
        "email":email,"password":password
      }
    );

    var jsonUsers=jsonDecode(response.body);
    var usersMap=jsonUsers["userdata"] as List;
    List<User> user_list=usersMap.map<User>((x) => User.fromJson(x)).toList();

    return user_list;
  }
}