import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k12bilisimapp/views/article_detail_screen.dart';
import 'colored_image_card.dart';

class ArticleCard extends StatelessWidget {
  final int postId;
  final String imagePath;
  final String title;
  final String date;
  final String readTime;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const ArticleCard({
    super.key,
    required this.postId,
    required this.imagePath,
    required this.title,
    required this.date,
    required this.readTime,
    required this.backgroundColor,
    this.onTap,
  });

  static const EdgeInsets paddingValue = EdgeInsets.symmetric(vertical: 10.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Get.to(() => ArticleDetailScreen(
                  postId: postId,
                  backgroundColor: backgroundColor,
                ));
          },
      child: Padding(
        padding: paddingValue,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ColoredImageCard(
              imagePath: imagePath,
              backgroundColor: backgroundColor,
              width: 180,
              height: 150,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 22.0,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "$date • $readTime",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade600,
                          fontSize: 16.0,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
