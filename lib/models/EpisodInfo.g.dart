// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EpisodInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodInfo _$EpisodInfoFromJson(Map<String, dynamic> json) {
  return EpisodInfo(
    EpisodesData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EpisodInfoToJson(EpisodInfo instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

EpisodesData _$EpisodesDataFromJson(Map<String, dynamic> json) {
  return EpisodesData(
    Episodes.fromJson(json['episodes'] as Map<String, dynamic>),
    json['title'] as String,
    json['description'] as String,
    json['img'] as String,
    json['img_large'] as String?,
  );
}

Map<String, dynamic> _$EpisodesDataToJson(EpisodesData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'img': instance.image,
      'img_large': instance.largeImage,
      'episodes': instance.episodes,
    };

Episodes _$EpisodesFromJson(Map<String, dynamic> json) {
  return Episodes(
    (json['list'] as List<dynamic>)
        .map((e) => Elist.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$EpisodesToJson(Episodes instance) => <String, dynamic>{
      'list': instance.episodList,
    };

Elist _$ElistFromJson(Map<String, dynamic> json) {
  return Elist(
    json['id'] as int,
    json['label'] as String,
  );
}

Map<String, dynamic> _$ElistToJson(Elist instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
    };
