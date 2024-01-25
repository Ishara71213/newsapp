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
      this.dateRange = "",
      this.searchQuery = "",
      this.pageSize = "100",
      this.country = "us"});

  String queryParamsBuilder() {
    String params =
        'country=$country&q=$searchQuery&category=$category&from=$dateRange&to=$dateRange&sortBy=$sortBy&pageSize=$pageSize';
    return params;
  }
}
