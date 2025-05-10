import 'package:app_evo_movies/pages/movie_detail_page.dart';
import 'package:flutter/material.dart';
import '../models/evo_movie_model.dart';
import '../services/evo_movies_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> _movies = []; // Classe que vem do Model
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> _searchMovies() async {
    setState(() {
      _isLoading = true; // Ativa o carregamento
      _errorMessage = ''; // Limpa qualquer erro anterior
    });

    try {
      final results = await EvoMovieService.searchMovies(
        _controller.text,
      ); // A função searchMovies vem do Service
      setState(() {
        _movies = results;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Erro ao buscar filmes';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildMovieItem(Movie movie) {
    return ListTile(
      leading:
          movie.posterPath.isNotEmpty
              ? Image.network(
                'https://image.tmdb.org/t/p/w92${movie.posterPath}',
              )
              : const Icon(Icons.movie),
      title: Text(movie.title),
      subtitle: Text('Lançamento: ${movie.releaseDate}'),

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailPage(movie: movie),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Busca de Filmes')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Buscar filme',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchMovies,
                ),
              ),
              onSubmitted: (_) => _searchMovies(),
            ),
            const SizedBox(height: 16),
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_errorMessage.isNotEmpty)
              Text(_errorMessage, style: const TextStyle(color: Colors.red))
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _movies.length,
                  itemBuilder: (context, index) {
                    return _buildMovieItem(_movies[index]);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
