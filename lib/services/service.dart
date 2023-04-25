
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_http/models/user_model.dart';

class ApiServices{
  String endpoint='https://dummyjson.com/users';
  Future<List<UserModel>>getUsers() async{
    Response response = await get(Uri.parse(endpoint));
    if(response.statusCode==200){
      final List result=jsonDecode(response.body)['users'];
      return result.map(((e) => UserModel.fromJson(e))).toList();
    }
    else if(response.statusCode==400){
      throw Exception('Internal server error');
    }
    else{
      throw Exception(response.reasonPhrase);
    }
  }
}

//entry point for shared data to maintain state of the injected class
final userProvider=Provider<ApiServices>((ref)=>ApiServices());