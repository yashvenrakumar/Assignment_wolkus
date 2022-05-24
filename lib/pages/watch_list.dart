import 'dart:convert';

import 'package:myapp/services/movie_model.dart';
import 'package:myapp/services/response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WatchList {
  static List<MovieModel> watchList = [];
  static SharedPreferences prefs;

  static addToList(MovieModel item) {
    if (!watchList.contains(item))
      watchList.add(item);
    else
      print("already in the list");
  }

  static deleteItem(MovieModel item) {
    watchList.remove(item);
  }

  static saveList() async {
    prefs = await SharedPreferences.getInstance();
    String jsonList = jsonEncode(watchList);
    await prefs.setString("WatchList", jsonList);
  }

  static loadList() async {
    WatchList.prefs = await SharedPreferences.getInstance();

    String savedJson = prefs.getString("WatchList");
    List savedList = jsonDecode(savedJson) as List;
    print(savedJson);
    List<Movie> movieList = List<Movie>.from(
        savedList.map((i) => Movie.fromJson(i as Map<String, dynamic>)));
    List<MovieModel> loadedList =
        movieList.map((movie) => MovieModel.fromResponse(movie)).toList();
    watchList = loadedList;
  }
}
