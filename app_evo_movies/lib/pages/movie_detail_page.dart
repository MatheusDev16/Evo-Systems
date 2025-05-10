import 'package:flutter/material.dart';
import '../models/evo_movie_model.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem do pôster
            Center(
              child:
                  movie.posterPath.isNotEmpty
                      ? Image.network(
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                        height: 400,
                      )
                      : const Icon(Icons.movie, size: 100),
            ),

            const SizedBox(height: 20),

            // Título
            Text(
              movie.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // Data de lançamento
            Text(
              'Lançamento: ${movie.releaseDate}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // Sinopse
            Text(movie.overview, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
