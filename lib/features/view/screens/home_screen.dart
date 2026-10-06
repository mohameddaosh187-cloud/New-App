import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) => NewsItem(),
        separatorBuilder: (context, index) => SizedBox(height: 15),
        itemCount: 10,
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.details);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            CustomImageNews(),

            SizedBox(height: 8),
            Text(
              "Europe",
              style: TextStyle(
                fontSize: 14,
                fontWeight: .w400,
                color: Color(0xffB0B3B8),
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Russian warship: Moskva sinks in Black Sea",
              style: TextStyle(
                fontSize: 18,
                fontWeight: .w400,
                color: Color(0xffE4E6EB),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomImageNews extends StatelessWidget {
  const CustomImageNews({super.key, this.height = 200});
  final double height;

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
