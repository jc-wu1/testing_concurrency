// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_remote_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _MoviesRemoteDataSource implements MoviesRemoteDataSource {
  _MoviesRemoteDataSource(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.themoviedb.org/3/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<MoviesResponse> fetchNowPlayingMovies({int page = 1}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page};
    final _headers = <String, dynamic>{
      r'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzOWUwZjkwMjdlYjEwZWZlMmU1MjUyZjQzZTc3MGJlOCIsInN1YiI6IjYxMzM3NjM0NGEyMjI2MDAyYjZhZGEzYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ukTIVWLfjtyzrbhJueFSy3RrslvVBvEvUQt8ZsYonSI'
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MoviesResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'movie/now_playing',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MoviesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MoviesResponse> fetchPopularMovies({int page = 1}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page};
    final _headers = <String, dynamic>{
      r'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzOWUwZjkwMjdlYjEwZWZlMmU1MjUyZjQzZTc3MGJlOCIsInN1YiI6IjYxMzM3NjM0NGEyMjI2MDAyYjZhZGEzYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ukTIVWLfjtyzrbhJueFSy3RrslvVBvEvUQt8ZsYonSI'
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MoviesResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'movie/popular',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MoviesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MoviesResponse> fetchUpcomingMovies({int page = 1}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page};
    final _headers = <String, dynamic>{
      r'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzOWUwZjkwMjdlYjEwZWZlMmU1MjUyZjQzZTc3MGJlOCIsInN1YiI6IjYxMzM3NjM0NGEyMjI2MDAyYjZhZGEzYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ukTIVWLfjtyzrbhJueFSy3RrslvVBvEvUQt8ZsYonSI'
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MoviesResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'movie/upcoming',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MoviesResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
