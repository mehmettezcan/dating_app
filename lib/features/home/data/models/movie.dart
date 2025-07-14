class MovieModel {
  final String id;
  final String title;
  final String year;
  final String rated;
  final String released;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final String poster;
  final String metascore;
  final String imdbRating;
  final String imdbVotes;
  final String imdbID;
  final String type;
  final String response;
  final List<String> images;
  final bool comingSoon;
  bool isFavorite; // mutable olabilir çünkü favori güncellenebilir

  MovieModel({
    required this.id,
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
    required this.metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbID,
    required this.type,
    required this.response,
    required this.images,
    required this.comingSoon,
    this.isFavorite = false,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json["id"] ?? json["_id"] ?? "",
      title: json["Title"] ?? "",
      year: json["Year"] ?? "",
      rated: json["Rated"] ?? "",
      released: json["Released"] ?? "",
      runtime: json["Runtime"] ?? "",
      genre: json["Genre"] ?? "",
      director: json["Director"] ?? "",
      writer: json["Writer"] ?? "",
      actors: json["Actors"] ?? "",
      plot: json["Plot"] ?? "",
      language: json["Language"] ?? "",
      country: json["Country"] ?? "",
      awards: json["Awards"] ?? "",
      poster: json["Poster"] ?? "",
      metascore: json["Metascore"] ?? "",
      imdbRating: json["imdbRating"] ?? "",
      imdbVotes: json["imdbVotes"] ?? "",
      imdbID: json["imdbID"] ?? "",
      type: json["Type"] ?? "",
      response: json["Response"] ?? "",
      images: List<String>.from(json["Images"] ?? []),
      comingSoon: json["ComingSoon"] ?? false,
      isFavorite: json["isFavorite"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "Title": title,
      "Year": year,
      "Rated": rated,
      "Released": released,
      "Runtime": runtime,
      "Genre": genre,
      "Director": director,
      "Writer": writer,
      "Actors": actors,
      "Plot": plot,
      "Language": language,
      "Country": country,
      "Awards": awards,
      "Poster": poster,
      "Metascore": metascore,
      "imdbRating": imdbRating,
      "imdbVotes": imdbVotes,
      "imdbID": imdbID,
      "Type": type,
      "Response": response,
      "Images": images,
      "ComingSoon": comingSoon,
      "isFavorite": isFavorite,
    };
  }
}
