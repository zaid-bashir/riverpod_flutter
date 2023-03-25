import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/usermodel.dart';

class ApiService{
  String apiUrl = "https://reqres.in/api/users?page=1";

  Future<List<UserModel>> getUsers() async {
    http.Response response = await http.get(Uri.parse(apiUrl));
    if(response.statusCode == 200){
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
}