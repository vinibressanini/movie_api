import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'TMDB_KEY', obfuscate: true)
  static final tmdbApiKey = _Env.tmdbApiKey;
  @EnviedField(varName: 'API_BASE_URL')
  static const tmdbBaseUrl = _Env.tmdbBaseUrl;
  @EnviedField(varName: 'API_IMAGE_URL')
  static const tmdbImageUrl = _Env.tmdbImageUrl;
}
