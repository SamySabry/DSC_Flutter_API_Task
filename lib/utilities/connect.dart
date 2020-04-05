import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:apiapp/models/post.dart';


class Connect {

    Future<List<Post>> fetchPost() async {
      final response =
      await http.get('https://www.json-generator.com/api/json/get/bYKKPeXRcO?indent=2');

      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((post) =>  Post.fromJson(post)).toList();

         //Post.fromJson(json.decode(response.body));
        // print("Status OK");
      } else {
        // If that call was not successful, throw an error.
        throw Exception('Failed to load post');
      }
    }

}