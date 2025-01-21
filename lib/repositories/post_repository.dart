import 'package:k12bilisimapp/models/post_model.dart';
import 'package:k12bilisimapp/services/api_service.dart';

class PostRepository {
  final ApiService apiService;

  PostRepository({required this.apiService});

  Future<List<Post>> fetchPosts() async {
    return await apiService.fetchPosts();
  }
}
