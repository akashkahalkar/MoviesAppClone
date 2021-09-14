// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) {
  return SearchResponse(
    SearchResults.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'data': instance.results,
    };

SearchResults _$SearchResultsFromJson(Map<String, dynamic> json) {
  return SearchResults(
    (json['list'] as List<dynamic>)
        .map((e) => ItemList.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SearchResultsToJson(SearchResults instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
