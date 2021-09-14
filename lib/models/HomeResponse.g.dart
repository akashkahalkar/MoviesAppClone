// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) {
  return HomeResponse(
    json['status'] as String,
    json['code'] as int,
    json['message'],
    (json['data'] as List<dynamic>)
        .map((e) => HomeResponseData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.homeResponseData,
    };

Deeplink _$DeeplinkFromJson(Map<String, dynamic> json) {
  return Deeplink(
    json['screen'] as String,
    json['param_one'] as String,
    json['param_two'] as String?,
    json['param_three'] as String?,
    json['param_four'] as String?,
  );
}

Map<String, dynamic> _$DeeplinkToJson(Deeplink instance) => <String, dynamic>{
      'screen': instance.screen,
      'param_one': instance.paramOne,
      'param_two': instance.paramTwo,
      'param_three': instance.paramThree,
      'param_four': instance.paramFour,
    };

ItemList _$ItemListFromJson(Map<String, dynamic> json) {
  return ItemList(
    json['title'] as String,
    json['img'] as String,
    Deeplink.fromJson(json['deeplink'] as Map<String, dynamic>),
    json['slug'] as String,
  );
}

Map<String, dynamic> _$ItemListToJson(ItemList instance) => <String, dynamic>{
      'title': instance.title,
      'img': instance.img,
      'deeplink': instance.deeplink,
      'slug': instance.slug,
    };

ViewAll _$ViewAllFromJson(Map<String, dynamic> json) {
  return ViewAll(
    json['label'] as String,
    Deeplink.fromJson(json['deeplink'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ViewAllToJson(ViewAll instance) => <String, dynamic>{
      'label': instance.label,
      'deeplink': instance.deeplink,
    };

HomeResponseData _$HomeResponseDataFromJson(Map<String, dynamic> json) {
  return HomeResponseData(
    json['type'] as int,
    json['view_count'] as int,
    json['title'] as String,
    json['total'] as int,
    (json['list'] as List<dynamic>)
        .map((e) => ItemList.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['offset'] as int,
    json['limit'] as int,
    ViewAll.fromJson(json['view_all'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HomeResponseDataToJson(HomeResponseData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'view_count': instance.viewCount,
      'title': instance.title,
      'total': instance.total,
      'list': instance.list,
      'offset': instance.offset,
      'limit': instance.limit,
      'view_all': instance.viewAll,
    };
