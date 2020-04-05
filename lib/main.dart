import 'package:apiapp/screens/listscreen.dart';
import 'package:flutter/material.dart';

import 'models/post.dart';
import 'utilities/connect.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
//  final Future<Post> post;
//
//  const MyApp({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}




