import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/presentation/view/widgets/news_items.dart';
import 'package:news_app/features/presentation/view_model/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = HomeCubit();
    cubit.getAllArticles();
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
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is HomeSuccess) {
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) =>
                  NewsItem(article: cubit.articles[index]),
              separatorBuilder: (context, index) => SizedBox(height: 15),
              itemCount: cubit.articles.length,
            );
          }

          if (state is HomeError) {
            return Center(
              child: Text(
                cubit.error ?? "",
                style: TextStyle(fontSize: 20, color: Colors.red),
                textAlign: .center,
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

String image =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrSWsuNioXh5BF4h0bc9kXhMJIAOUQPR0cDvPVgsZOfQ&s=10";
