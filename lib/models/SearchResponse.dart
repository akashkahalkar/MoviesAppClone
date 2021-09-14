import 'package:json_annotation/json_annotation.dart';
import 'HomeResponse.dart';
part 'SearchResponse.g.dart';

@JsonSerializable()
class SearchResponse {
  @JsonKey(name: 'data')
  SearchResults results;

  SearchResponse(this.results);
  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}

@JsonSerializable()
class SearchResults {
  List<ItemList> list;

  SearchResults(this.list);
  factory SearchResults.fromJson(Map<String, dynamic> json) =>
      _$SearchResultsFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResultsToJson(this);
}
