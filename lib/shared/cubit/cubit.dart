import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/moduls/business_screen.dart';
import 'package:news_app/moduls/science_screen.dart';
import 'package:news_app/moduls/sports_screen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:http/http.dart' as http;

class AppCubit extends Cubit<CubitStates> {
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void navBarTaped(int index) {
    currentIndex = index;
    emit(NavBarTapedState());
    if (currentIndex == 1) {
      getScienceData();
    } else if (currentIndex == 2) {
      getSportsData();
    }
  }

  List screensList = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),
  ];

  List? businessData;
  List? scienceData;
  List? sportsData;
  List? searchData;

  String baseUrl = 'https://newsapi.org';
  String apiKey = 'd6915a64ebda4592aba0fd80f2cd88dd';

  getBusinessData() async {
    emit(GetBusinessDataLoadingState());
    await http
        .get(Uri.parse(
            '$baseUrl/v2/top-headlines?country=eg&category=business&apiKey=$apiKey'))
        .then((value) {
      var data = jsonDecode(value.body);
      businessData = data['articles'];
      emit(GetBusinessDataSuccesState());
    }).catchError((error) {
      print(error);
      emit(GetBusinessDataErrorState());
    });
  }

  getScienceData() async {
    emit(GetScienceDataLoadingState());
    await http
        .get(Uri.parse(
            '$baseUrl/v2/top-headlines?country=eg&category=science&apiKey=$apiKey'))
        .then((value) {
      var data = jsonDecode(value.body);
      scienceData = data['articles'];
      emit(GetScienceDataSuccesState());
    }).catchError((error) {
      print(error);
      emit(GetScienceDataErrorState());
    });
  }

  getSportsData() async {
    emit(GetSportsDataLoadingState());
    await http
        .get(Uri.parse(
            '$baseUrl/v2/top-headlines?country=eg&category=sports&apiKey=$apiKey'))
        .then((value) {
      var data = jsonDecode(value.body);
      sportsData = data['articles'];
      emit(GetSportsDataSuccesState());
    }).catchError((error) {
      print(error);
      emit(GetSportsDataErrorState());
    });
  }

  getSearchData({required String search}) async {
    emit(GetSearchDataLoadingState());
    await http
        .get(Uri.parse('$baseUrl/v2/everything?q=$search&apiKey=$apiKey'))
        .then((value) {
      var data = jsonDecode(value.body);
      searchData = data['articles'];
      emit(GetSearchDataSuccesState());
    }).catchError((error) {
      print(error);
      emit(GetSearchDataErrorState());
    });
  }

  bool isDarkTheme = false;
  void changeTheme({bool? fromShared}) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    if (fromShared != null) {
      isDarkTheme = fromShared;
      emit(ChangeThemeState());
    } else {
      isDarkTheme = !isDarkTheme;
      shared
          .setBool('isDarkTheme', isDarkTheme)
          .then((value) => emit(ChangeThemeState()));
    }
  }
}
