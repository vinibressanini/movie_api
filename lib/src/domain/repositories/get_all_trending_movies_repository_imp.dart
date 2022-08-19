import '../../data/datasources/get_all_trending_movies_datasource.dart';
import '../../data/repositories/get_all_trending_movies_repository.dart';
import '../entitites/movie_entity.dart';

class GetAllTrendingMoviesRepositoryImp
    implements GetAllTrendingMoviesRepository {
 final GetAllTrendingMoviesDatasource _datasouce;
 GetAllTrendingMoviesRepositoryImp(this._datasouce);

  @override
  Future<List<MovieEntity>> getAllTrendingMovies(String timeWindow) async{
    return await _datasouce.getAllTrendingMovies(timeWindow);
  }
}
