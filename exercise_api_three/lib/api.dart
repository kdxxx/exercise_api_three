import 'dart:convert';
import 'package:http/http.dart';
import 'model.dart';

class HttpService {
  final String postsUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<User>> getPosts() async {
    Response response = await get(Uri.parse(postsUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
     // print(response.body);
      List<User> posts = body
          .map(
            (dynamic x) => User.fromJson(x),
          )
          .toList();
      return posts;
    } else {
      throw "unable to retrieve posts";
    }
  }
}
