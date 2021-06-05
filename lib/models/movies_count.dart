class MoviesCount {
  final List<dynamic> moviesByYear;
  final int total;

  MoviesCount({
    required this.moviesByYear,
    required this.total,
  });

  factory MoviesCount.fromJson(Map<String, dynamic> json) {
    return MoviesCount(
      moviesByYear: json['moviesByYear'],
      total: json['total'],
    );
  }
}
