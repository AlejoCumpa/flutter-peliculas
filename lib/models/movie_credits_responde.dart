// To parse this JSON data, do
//
//     final movieCredits = movieCreditsFromMap(jsonString);

import 'dart:convert';
import 'models.dart' show Cast;

class MovieCredits {
  MovieCredits({
    required this.id,
    required this.cast,
    required this.crew,
  });

  int id;
  List<Cast> cast;
  List<Cast> crew;

  factory MovieCredits.fromJson(String str) =>
      MovieCredits.fromMap(json.decode(str));

  factory MovieCredits.fromMap(Map<String, dynamic> json) => MovieCredits(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
      );
}
