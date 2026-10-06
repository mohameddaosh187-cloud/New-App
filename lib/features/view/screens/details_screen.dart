import 'package:flutter/material.dart';
import 'package:news_app/features/view/screens/home_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        backgroundColor: Color(0xff1877f2),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "Details News",
          style: TextStyle(
            fontSize: 25,
            fontWeight: .bold,
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: 30),
            CustomImageNews(height: 250),
            SizedBox(height: 30),
            Text(
              "Russian warship: Moskva sinks in Black Sea",
              style: TextStyle(
                fontSize: 18,
                fontWeight: .w400,
                color: Color(0xffE4E6EB),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Europe",
              style: TextStyle(
                fontSize: 18,
                fontWeight: .bold,
                color: Color(0xffB0B3B8),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Russian warship: Moskva sinks in Black Sea",
              style: TextStyle(
                fontSize: 16,
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
