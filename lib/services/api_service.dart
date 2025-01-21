import 'package:dio/dio.dart';
import 'package:k12bilisimapp/models/post_model.dart';

class ApiService {
  static const String baseUrl = "https://jsonplaceholder.org";

  final Dio _dio = Dio();

  /// API'den Post listesini çeker
  Future<List<Post>> fetchPosts() async {
    try {
      Response response = await _dio.get("$baseUrl/posts");

      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        return jsonData.map((json) => Post.fromJSON(json)).toList();
      } else {
        throw Exception("Failed to load posts");
      }
    } catch (e) {
      throw Exception("Failed to load posts");
    }
  }
}
