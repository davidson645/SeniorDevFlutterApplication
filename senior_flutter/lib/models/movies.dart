class Movies {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<dynamic> data;

  Movies({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data: json['data'],
    );
  }
}
