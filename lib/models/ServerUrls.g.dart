// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ServerUrls.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerUrls _$ServerUrlsFromJson(Map<String, dynamic> json) {
  return ServerUrls(
    UrlData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ServerUrlsToJson(ServerUrls instance) =>
    <String, dynamic>{
      'data': instance.urlData,
    };

UrlData _$UrlDataFromJson(Map<String, dynamic> json) {
  return UrlData(
    json['last_watch'] as int,
    (json['list'] as List<dynamic>)
        .map((e) => EpisodUrlListItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$UrlDataToJson(UrlData instance) => <String, dynamic>{
      'last_watch': instance.lastWatch,
      'list': instance.urlList,
    };

EpisodUrlListItem _$EpisodUrlListItemFromJson(Map<String, dynamic> json) {
  return EpisodUrlListItem(
    json['url_id'] as String,
    json['url'] as String,
    json['quality'] as String,
    json['episode_id'] as String,
  );
}

Map<String, dynamic> _$EpisodUrlListItemToJson(EpisodUrlListItem instance) =>
    <String, dynamic>{
      'url_id': instance.urlId,
      'url': instance.url,
      'quality': instance.quality,
      'episode_id': instance.episodId,
    };
