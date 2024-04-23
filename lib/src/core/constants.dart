const String kAccessToken =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzOWUwZjkwMjdlYjEwZWZlMmU1MjUyZjQzZTc3MGJlOCIsInN1YiI6IjYxMzM3NjM0NGEyMjI2MDAyYjZhZGEzYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ukTIVWLfjtyzrbhJueFSy3RrslvVBvEvUQt8ZsYonSI";

const String kMovieDbBaseUrl = 'https://api.themoviedb.org/3/';

const String imgBaseUrl = 'https://image.tmdb.org/t/p/w500';

const Map<String, dynamic> kApiHeader = {
  'Authorization': "Bearer $kAccessToken"
};
