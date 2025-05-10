import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/evo_movie_model.dart';

class EvoMovieService {
  static final String _apiKey = 'be1e115a998c6d5b2a08069394ed6ed2';
  static final String _baseUrl = 'https://api.themoviedb.org/3';

  static Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.parse(
      '$_baseUrl/search/movie?api_key=$_apiKey&language=pt-BR&query=$query',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> results = data['results'] ?? [];

      List<Movie> movies = results.map((json) => Movie.fromJson(json)).toList();

      movies.sort((a, b) {
        int yearComparison = b.releaseDate.compareTo(a.releaseDate);
        if (yearComparison == 0) {
          return a.title.compareTo(b.title);
        }
        return yearComparison;
      });

      return movies;
    } else {
      throw Exception('Falha ao carregar os filmes');
    }
  }
}
