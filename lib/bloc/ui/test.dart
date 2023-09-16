import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<List<dynamic>> fetchUser() {
  const jsonData = '{"name":"aqeeb","age":"27"}';

  final massiveData = List.generate(100, (_) => jsonData).join(',');

  return compute(pasreMassiveData, '[$massiveData]');
}

List<dynamic> pasreMassiveData(String jsonData) {
  return jsonDecode(jsonData);
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Data'),
      ),
      body: FutureBuilder(
        future: fetchUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('error ${snapshot.error}'),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Name : ${snapshot.data?[index]['name']} '),
                  subtitle: Text('Age : ${snapshot.data?[index]['age']} '),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
