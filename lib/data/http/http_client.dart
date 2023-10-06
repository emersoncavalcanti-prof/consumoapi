import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract interface class IHttpClient {
  Future get({required String url});
}

class DioClient implements IHttpClient {
  final client = Dio();

  @override
  Future get({required String url}) async {
    return await client.get(url);
  }
}

class HttpClient implements IHttpClient {
  final client = http.Client();

  @override
  Future get({required String url}) async {
    return await client.get(Uri.parse(url));
  }
}
