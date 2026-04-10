import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => LoadingState();
}

class LoadingState extends State<Loading> {

  void getData() async{
      Response response = await get('https://jsonplaceholder.typicode.com/todos/1' as Uri);
       Map data = jsonDecode(response.body);
       print(data);
       print(data['title']);

  }



  @override
  void initState() {
    super.initState();
    getData();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading page'),
    );
  }
}
