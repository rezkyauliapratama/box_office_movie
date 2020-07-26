class MovieModel {
  String _posterPath;
  bool _adult;
  String _overview;
  String _releaseDate;
  List<int> _genreIds;
  int _id;
  String _originalTitle;
  String _originalLanguage;
  String _title;
  String _backdropPath;
  double _popularity;
  int _voteCount;
  bool _video;
  double _voteAverage;

  String get posterPath => _posterPath;

  bool get adult => _adult;

  String get overview => _overview;

  String get releaseDate => _releaseDate;

  List<int> get genreIds => _genreIds;

  int get id => _id;

  String get originalTitle => _originalTitle;

  String get originalLanguage => _originalLanguage;

  String get title => _title;

  String get backdropPath => _backdropPath;

  double get popularity => _popularity;

  int get voteCount => _voteCount;

  bool get video => _video;

  double get voteAverage => _voteAverage;

  MovieModel({String posterPath,
    bool adult,
    String overview,
    String releaseDate,
    List<int> genreIds,
    int id,
    String originalTitle,
    String originalLanguage,
    String title,
    String backdropPath,
    double popularity,
    int voteCount,
    bool video,
    double voteAverage}) {
    _posterPath = posterPath;
    _adult = adult;
    _overview = overview;
    _releaseDate = releaseDate;
    _genreIds = genreIds;
    _id = id;
    _originalTitle = originalTitle;
    _originalLanguage = originalLanguage;
    _title = title;
    _backdropPath = backdropPath;
    _popularity = popularity;
    _voteCount = voteCount;
    _video = video;
    _voteAverage = voteAverage;
  }

  MovieModel.fromJson(dynamic json) {
    _posterPath = json["posterPath"];
    _adult = json["adult"];
    _overview = json["overview"];
    _releaseDate = json["releaseDate"];
    _genreIds = json["genreIds"] != null ? json["genreIds"].cast<int>() : [];
    _id = json["id"];
    _originalTitle = json["originalTitle"];
    _originalLanguage = json["originalLanguage"];
    _title = json["title"];
    _backdropPath = json["backdropPath"];
    _popularity = json["popularity"];
    _voteCount = json["voteCount"];
    _video = json["video"];
    _voteAverage = json["voteAverage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["posterPath"] = _posterPath;
    map["adult"] = _adult;
    map["overview"] = _overview;
    map["releaseDate"] = _releaseDate;
    map["genreIds"] = _genreIds;
    map["id"] = _id;
    map["originalTitle"] = _originalTitle;
    map["originalLanguage"] = _originalLanguage;
    map["title"] = _title;
    map["backdropPath"] = _backdropPath;
    map["popularity"] = _popularity;
    map["voteCount"] = _voteCount;
    map["video"] = _video;
    map["voteAverage"] = _voteAverage;
    return map;
  }
}
