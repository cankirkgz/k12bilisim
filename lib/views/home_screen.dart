import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k12bilisimapp/controllers/post_controller.dart';
import 'package:k12bilisimapp/routes/app_routes.dart';
import 'package:k12bilisimapp/widgets/article_card.dart';
import 'package:k12bilisimapp/widgets/custom_app_bar.dart';
import 'package:k12bilisimapp/widgets/profile_avatar.dart';
import 'package:k12bilisimapp/widgets/search_box.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PostController postController = Get.find<PostController>();

  static const EdgeInsets paddingValue =
      EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: SafeArea(
          child: Padding(
            padding: paddingValue,
            child: CustomAppBar(
              actions: [
                ProfileAvatar(
                  imagePath: "assets/images/anime_girl_profile_picture.jpg",
                  size: 45,
                ),
              ],
              leading: Image.asset("assets/icons/menu.png"),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: paddingValue,
            child: SearchBox(
              controller: TextEditingController(),
              onChanged: (query) => postController.updateSearchQuery(query),
            ),
          ),
          Padding(
            padding: paddingValue,
            child: Obx(() {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: postController.categories.map((category) {
                    bool isSelected =
                        category == postController.selectedCategory.value;
                    return GestureDetector(
                      onTap: () {
                        postController.selectedCategory.value = category;
                        postController.filterPosts();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.black : Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            }),
          ),
          Expanded(
            child: Obx(
              () {
                if (postController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                var filteredPosts = postController.filteredPosts;
                return ListView.builder(
                  padding: paddingValue,
                  itemCount: filteredPosts.length,
                  itemBuilder: (context, index) {
                    final post = filteredPosts[index];
                    final Color postColor =
                        postController.postColors[post.id] ??
                            Colors.grey.shade300;

                    return ArticleCard(
                      postId: post.id,
                      imagePath: post.thumbnail,
                      title: post.title,
                      date: postController.formatDate(post.date),
                      readTime:
                          "${postController.calculateReadTime(post.content)} min read",
                      backgroundColor: postColor,
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.articleDetail,
                          arguments: {
                            'postId': post.id,
                            'backgroundColor': postColor,
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
