import 'dart:ui';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:k12bilisimapp/models/post_model.dart';
import 'package:k12bilisimapp/services/api_service.dart';
import 'package:k12bilisimapp/utils/color_palette.dart';

class PostController extends GetxController {
  var posts = <Post>[].obs;
  var isLoading = true.obs;
  var selectedCategory = 'All'.obs;
  var searchQuery = ''.obs;
  var filteredPosts = <Post>[].obs;
  var categories = <String>[].obs;
  var postColors = <int, Color>{}.obs;

  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    fetchPosts();
    ever(searchQuery, (_) => filterPosts());
    ever(selectedCategory, (_) => filterPosts());
    secretMessage();
    super.onInit();
  }

  /// API'den postları çeker ve kategori listesini oluşturur
  void fetchPosts() async {
    try {
      isLoading(true);
      var fetchedPosts = await _apiService.fetchPosts();
      posts.assignAll(fetchedPosts);
      for (var post in posts) {
        if (!postColors.containsKey(post.id)) {
          postColors[post.id] = ColorPalette.getRandomPastelColor();
        }
      }

      categories
          .assignAll(['All', ...posts.map((post) => post.category).toSet()]);
      filterPosts();
    } catch (e) {
      print("Error fetching posts: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Seçili kategoriye ve arama sorgusuna göre postları filtreler
  void filterPosts() {
    filteredPosts.assignAll(posts.where((post) {
      bool categoryMatch = selectedCategory.value == 'All' ||
          post.category == selectedCategory.value;
      bool searchMatch = searchQuery.value.isEmpty ||
          post.title.toLowerCase().contains(searchQuery.value.toLowerCase());
      return categoryMatch && searchMatch;
    }).toList());
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
    filterPosts();
  }

  /// İçeriğin uzunluğuna göre tahmini okuma süresini hesaplar (dakika cinsinden)
  int calculateReadTime(String content) {
    int wordsPerMinute = 200;
    int wordCount = content.split(' ').length;
    return (wordCount / wordsPerMinute).ceil();
  }

  /// Tarih formatını "MMM d" (örneğin: Jun 3) olarak dönüştürür
  String formatDate(String dateString) {
    try {
      DateTime date = DateFormat("dd/MM/yyyy HH:mm:ss").parse(dateString);
      return DateFormat("MMM d").format(date);
    } catch (e) {
      return "Unknown Date";
    }
  }

  void secretMessage() {
    print("✨ Developed by Can ✨");
  }
}
