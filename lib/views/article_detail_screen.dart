import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k12bilisimapp/controllers/post_controller.dart';
import 'package:k12bilisimapp/widgets/custom_app_bar.dart';

class ArticleDetailScreen extends StatefulWidget {
  final int postId;
  final Color backgroundColor;

  const ArticleDetailScreen(
      {super.key, required this.postId, required this.backgroundColor});

  @override
  _ArticleDetailScreenState createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  final PostController postController = Get.find();
  bool isExpanded = false;

  static const EdgeInsets paddingValue =
      EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0);

  @override
  Widget build(BuildContext context) {
    final post = postController.posts.firstWhere((p) => p.id == widget.postId);
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: widget.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: SafeArea(
          child: Padding(
            padding: paddingValue,
            child: CustomAppBar(
              actions: [
                Image.asset(
                  "assets/icons/menu.png",
                )
              ],
              showBackButton: true,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 4,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Center(
                      child: Image.network(
                        post.image,
                        width: 250,
                        height: 250,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isExpanded = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 12),
                        ),
                        child: const Text(
                          "Read All",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: isExpanded ? screenHeight * 0.7 : screenHeight * 0.3,
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        post.content,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
