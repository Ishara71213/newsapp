import 'package:newsapp/core/constants/sortby.dart';

class Filter {
  final String? category;
  final String? sortBy;
  final String? dateRange;
  final String? searchQuery;
  final String country;
  final String? pageSize;

  const Filter(
      {this.category = "",
      this.sortBy = SortBy.publishedAt,
      this.dateRange = "from=&to=",
      this.searchQuery = "",
      this.pageSize = "100",
      this.country = "us"});

  String queryParamsBuilder() {
    String params =
        'country=$country&q=$searchQuery&category=$category&$dateRange&sortBy=$sortBy&pageSize=$pageSize';
    return params;
  }

  Filter copyWith(
      {String? category,
      String? sortBy,
      String? dateRange,
      String? searchQuery,
      String? country,
      String? pageSize}) {
    return Filter(
        category: category ?? this.category,
        sortBy: sortBy ?? this.sortBy,
        dateRange: dateRange ?? this.dateRange,
        searchQuery: searchQuery ?? this.searchQuery,
        country: country ?? this.country,
        pageSize: pageSize ?? this.pageSize);
  }
}
