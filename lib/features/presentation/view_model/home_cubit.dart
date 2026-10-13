import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/network/api_result.dart';
import 'package:news_app/features/data/api/app_api.dart';
import 'package:news_app/features/data/model/news_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  // hold data
  List<Article> articles = [];
  String? error;

  // handle logic
  void getAllArticles() async {
    emit(HomeLoading());
    final result = await AppApi.getNews();

    switch (result) {
      case Success<NewsModel>():
        articles = result.data.articles ?? [];
        emit(HomeSuccess());
      case Error<NewsModel>():
        error = result.error;
        emit(HomeError());
    }
  }
}
