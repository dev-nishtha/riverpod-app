import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_http/models/user_model.dart';
import 'package:riverpod_http/services/service.dart';

//Future provider for asynchronous network calls
final userDataProvider = FutureProvider<List<UserModel>>((ref) async{
  return ref.watch(userProvider).getUsers();
});