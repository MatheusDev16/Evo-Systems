class Movie {
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String id;

  Movie({
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.id,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? 'Sem título',
      overview: json['overview'] ?? 'Sem descrição',
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'] ?? 'Data desconhecida',
      id: (json['id'] ?? '').toString(),
    );
  }
}
