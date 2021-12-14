import 'dart:convert';

import 'package:gallery_image/model/result.dart';
import 'package:http/http.dart' as http;

abstract class ApiClientAbstract {
  Future<Result> fetch(String url, Future<Map<String, String>>? authHeaders);
}

class ApiClient implements ApiClientAbstract {

  @override
  Future<Result> fetch(String url, Future<Map<String, String>>? authHeaders) async {
    final response = await http.get(
        Uri.parse(url),
        headers: await authHeaders);
    var body = json.decode(response.body);
    if (response.statusCode == 200) {
      return Result.success(body);
    } else {
      var error = body['error'];
      int code = error['code'];
      String msg = error['message'];
      return Result.failure(code, msg);
    }
  }
}