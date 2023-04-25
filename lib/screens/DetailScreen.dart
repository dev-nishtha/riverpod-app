import 'package:flutter/material.dart';
import 'package:riverpod_http/models/user_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage(user.image),
                ),
              ),
              Text(user.firstName+" "+user.lastName),
              Text(user.email)
            ],
          ),
        ),
      ),
    );
  }
}
