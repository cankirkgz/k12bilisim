import 'package:get/get.dart';
import 'package:k12bilisimapp/bindings/post_binding.dart';
import 'package:k12bilisimapp/views/article_detail_screen.dart';
import 'package:k12bilisimapp/views/home_screen.dart';
import 'package:k12bilisimapp/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: PostBinding(),
    ),
    GetPage(
      name: AppRoutes.articleDetail,
      page: () {
        final args = Get.arguments as Map<String, dynamic>;
        return ArticleDetailScreen(
          postId: args['postId'],
          backgroundColor: args['backgroundColor'],
        );
      },
      binding: PostBinding(),
    ),
  ];
}
