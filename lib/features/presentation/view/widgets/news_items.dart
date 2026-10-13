import 'package:flutter/material.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/features/data/model/news_model.dart';
import 'package:news_app/features/presentation/view/screens/home_screen.dart';
import 'package:news_app/features/presentation/view/widgets/custom_image_news.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.details, arguments: article);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            CustomImageNews(image: article.urlToImage ?? image),

            SizedBox(height: 8),
            Text(
              article.author ?? "",
              style: TextStyle(
                fontSize: 14,
                fontWeight: .w400,
                color: Color(0xffB0B3B8),
              ),
            ),
            SizedBox(height: 4),
            Text(
              article.title ?? "",
              style: TextStyle(
                fontSize: 18,
                fontWeight: .w400,
                color: Color(0xffE4E6EB),
              ),
              maxLines: 1,
              overflow: .ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
