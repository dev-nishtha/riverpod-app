import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_http/models/user_model.dart';
import 'package:riverpod_http/providers/data_provider.dart';

import 'DetailScreen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _data=ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("User data using Riverpod"),
      ),
      body: _data.when(
        data: (_data){
          List<UserModel> userList= _data.map((e) => e).toList();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Expanded(child: ListView.builder(itemCount:userList.length,itemBuilder: (_,index){
                  return InkWell(
                      onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        user: userList[index],
                      ),
                    ),
                  ),
                  child: Card(
                    color: Colors.blue,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(userList[index].firstName+' '+userList[index].lastName, style: const TextStyle(
                        color: Colors.white
                      )),
                      subtitle: Text(userList[index].username, style: const TextStyle(
                  color: Colors.white
                  )),
                      trailing: CircleAvatar(backgroundImage: NetworkImage(userList[index].image),),
                    )
                  ));
                }))
              ],
            ),
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: ()=>const Center(child: CircularProgressIndicator(),),

      ),
    );
  }
}
