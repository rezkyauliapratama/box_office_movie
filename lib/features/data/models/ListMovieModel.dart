import 'package:box_office_clean_arch/core/network/base_api/base_api.dart';

import 'MovieModel.dart';

class ListMovieModel extends BaseApi {
  int _page;
  List<MovieModel> _results;
  int _totalResults;
  int _totalPages;

  int get page => _page;

  List<MovieModel> get results => _results;

  int get totalResults => _totalResults;

  int get totalPages => _totalPages;

  ListMovieModel(
      {int page, List<MovieModel> results, int totalResults, int totalPages})
      : super(null) {
    _page = page;
    _results = results;
    _totalResults = totalResults;
    _totalPages = totalPages;
  }

  ListMovieModel.fromJson(dynamic json) : super(json) {
    _page = json["page"];
    if (json["results"] != null) {
      _results = [];
      json["results"].forEach((v) {
        _results.add(MovieModel.fromJson(v));
      });
    }
    _totalResults = json["totalResults"];
    _totalPages = json["totalPages"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["page"] = _page;
    if (_results != null) {
      map["results"] = _results.map((v) => v.toJson()).toList();
    }
    map["totalResults"] = _totalResults;
    map["totalPages"] = _totalPages;
    return map;
  }
}
