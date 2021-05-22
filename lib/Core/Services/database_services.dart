import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pozitive/Core/Model/apiError.dart';

class DatabaseService {
  final client = http.Client();
  Future<dynamic> getRequest(String path, Function(Response) success) async {
    return _processResponse(
        await client.get(
          '$path',
        ),
        success);
  }

  Future<dynamic> postRequest(String path, Function(Response) success,
      [Map body]) async {
    return _processResponse(
        await client.post(path, body: body != null ? body : null), success);
  }

  Future<dynamic> putRequest(String path, Function(Response) success,
      [Map body]) async {
    return _processResponse(
        await client.put(path,
//            body: body != null ? jsonEncode(body.toJson()) : null
            body: body != null ? body : null),
        success);
  }

  Future<dynamic> deleteRequest(String path, Function(Response) success) async {
    return _processResponse(
        await client.delete(
          path,
        ),
        success);
  }

  dynamic _processResponse(Response response, Function(Response) success) {
    if (200 >= response.statusCode && response.statusCode < 300) {
      return success(response);
    } else {
      return ApiError.fromJson(json.decode(response.body));
    }
  }
}
