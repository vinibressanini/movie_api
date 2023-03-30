// @dart=2.9

import 'dart:convert';

import 'package:all_in_one/env/env.dart';
import 'package:all_in_one/src/data/datasources/remote/get_all_trending_movies_remote_datasource_imp.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

@GenerateMocks([DioMock])
void main() {
  final dio = DioMock();
  final GetAllTrendingMoviesRemoteDatasourceImp datasource =
      GetAllTrendingMoviesRemoteDatasourceImp(dio);

  test('WHEN getAllTrendingMovies is called THEN return a list of movies',
      () async {
    when(dio.get("trending/movie/day",
            queryParameters: {'api_key': Env.tmdbApiKey}))
        .thenAnswer((_) async => Response(
            data: jsonDecode(jsonData),
            requestOptions: RequestOptions(path: '/')));

    final list = await datasource.getAllTrendingMovies('day');

    expect(list, isNotEmpty);
    expect(list.first.title, 'John Wick: Chapter 4');
  });
}

String jsonData = '''{
	"page": 1,
	"results": [
		{
			"adult": false,
			"backdrop_path": "/h8gHn0OzBoaefsYseUByqsmEDMY.jpg",
			"id": 603692,
			"title": "John Wick: Chapter 4",
			"original_language": "en",
			"original_title": "John Wick: Chapter 4",
			"overview": "With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes.",
			"poster_path": "/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg",
			"media_type": "movie",
			"genre_ids": [
				28,
				53,
				80
			],
			"popularity": 950.477,
			"release_date": "2023-03-22",
			"video": false,
			"vote_average": 8.5,
			"vote_count": 38
		},
		{
			"adult": false,
			"backdrop_path": "/254iY5CzFzjnjkP0lUkLpOLvXar.jpg",
			"id": 881164,
			"title": "Boston Strangler",
			"original_language": "en",
			"original_title": "Boston Strangler",
			"overview": "Reporters Loretta McLaughlin and Jean Cole bravely pursue the story of the Boston Strangler at great personal risk, putting their own lives on the line in their quest to uncover the truth.",
			"poster_path": "/uVamttI4Bnu7XQQsPX0vpOTolE3.jpg",
			"media_type": "movie",
			"genre_ids": [
				80,
				53,
				18
			],
			"popularity": 254.682,
			"release_date": "2023-03-17",
			"video": false,
			"vote_average": 6.819,
			"vote_count": 124
		},
		{
			"adult": false,
			"backdrop_path": "/wD2kUCX1Bb6oeIb2uz7kbdfLP6k.jpg",
			"id": 980078,
			"title": "Winnie the Pooh: Blood and Honey",
			"original_language": "en",
			"original_title": "Winnie the Pooh: Blood and Honey",
			"overview": "Christopher Robin is headed off to college and he has abandoned his old friends, Pooh and Piglet, which then leads to the duo embracing their inner monsters.",
			"poster_path": "/ewF3IlGscc7FjgGEPcQvZsAsgAW.jpg",
			"media_type": "movie",
			"genre_ids": [
				27,
				53
			],
			"popularity": 541.546,
			"release_date": "2023-01-27",
			"video": false,
			"vote_average": 5.532,
			"vote_count": 95
		},
		{
			"adult": false,
			"backdrop_path": "/6Lw54zxm6BAEKJeGlabyzzR5Juu.jpg",
			"id": 82856,
			"name": "The Mandalorian",
			"original_language": "en",
			"original_name": "The Mandalorian",
			"overview": "After the fall of the Galactic Empire, lawlessness has spread throughout the galaxy. A lone gunfighter makes his way through the outer reaches, earning his keep as a bounty hunter.",
			"poster_path": "/eU1i6eHXlzMOlEq0ku1Rzq7Y4wA.jpg",
			"media_type": "tv",
			"genre_ids": [
				10765,
				10759,
				18
			],
			"popularity": 1600.116,
			"first_air_date": "2019-11-12",
			"vote_average": 8.483,
			"vote_count": 8607,
			"origin_country": [
				"US"
			]
		},
		{
			"adult": false,
			"backdrop_path": "/uDgy6hyPd82kOHh6I95FLtLnj6p.jpg",
			"id": 100088,
			"name": "The Last of Us",
			"original_language": "en",
			"original_name": "The Last of Us",
			"overview": "Twenty years after modern civilization has been destroyed, Joel, a hardened survivor, is hired to smuggle Ellie, a 14-year-old girl, out of an oppressive quarantine zone. What starts as a small job soon becomes a brutal, heartbreaking journey, as they both must traverse the United States and depend on each other for survival.",
			"poster_path": "/uKvVjHNqB5VmOrdxqAt2F7J78ED.jpg",
			"media_type": "tv",
			"genre_ids": [
				18
			],
			"popularity": 3328.708,
			"first_air_date": "2023-01-15",
			"vote_average": 8.778,
			"vote_count": 2854,
			"origin_country": [
				"US"
			]
		},
		{
			"adult": false,
			"backdrop_path": "/q2qzgZnp0cW4D9DJveoQpaJ9U54.jpg",
			"id": 701121,
			"title": "Children of the Corn",
			"original_language": "en",
			"original_title": "Children of the Corn",
			"overview": "A psychopathic twelve-year-old girl in a small town in Nebraska recruits all the other children and goes on a bloody rampage, killing the corrupt adults and anyone else who opposes her. A bright high schooler who won't go along with the plan is the town's only hope of survival.",
			"poster_path": "/9vYJfuYcCrN1GWW8x3MS7To4A3T.jpg",
			"media_type": "movie",
			"genre_ids": [
				27,
				53
			],
			"popularity": 16.824,
			"release_date": "2023-03-03",
			"video": false,
			"vote_average": 5.0,
			"vote_count": 6
		}	
	],
	"total_pages": 1000,
	"total_results": 20000
}''';
