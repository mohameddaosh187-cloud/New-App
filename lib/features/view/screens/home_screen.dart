import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/network/api_result.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/features/data/api/app_api.dart';
import 'package:news_app/features/data/model/news_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> articles = [];
  bool isLoading = true;
  String? error;
  @override
  void initState() {
    super.initState();
    getAllArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        backgroundColor: Color(0xff1877f2),
        centerTitle: true,
        title: Text(
          "News",
          style: TextStyle(
            fontSize: 25,
            fontWeight: .bold,
            color: Colors.white,
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : error != null
          ? Center(
              child: Text(
                error ?? "",
                style: TextStyle(fontSize: 20, color: Colors.red),
                textAlign: .center,
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) =>
                  NewsItem(article: articles[index]),
              separatorBuilder: (context, index) => SizedBox(height: 15),
              itemCount: articles.length,
            ),
    );
  }

  void getAllArticles() async {
    isLoading = true;
    final result = await AppApi.getNews();

    switch (result) {
      case Success<NewsModel>():
        articles = result.data.articles ?? [];
      case Error<NewsModel>():
        error = result.error;
    }
    isLoading = false;
    setState(() {});
  }
}

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

class CustomImageNews extends StatelessWidget {
  const CustomImageNews({super.key, this.height = 200, required this.image});
  final double height;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(12),
      child: CachedNetworkImage(
        imageUrl: image,
        placeholder: (context, url) => Column(
          mainAxisAlignment: .center,
          children: [CircularProgressIndicator()],
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
        width: double.infinity,
        height: height,
        fit: .cover,
      ),
    );
  }
}

String image =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrSWsuNioXh5BF4h0bc9kXhMJIAOUQPR0cDvPVgsZOfQ&s=10";
