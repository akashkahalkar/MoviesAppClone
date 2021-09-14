import 'package:json_annotation/json_annotation.dart';
part 'HomeResponse.g.dart';

@JsonSerializable()
class HomeResponse {
  String status;
  int code;
  dynamic message;
  @JsonKey(name: 'data')
  List<HomeResponseData> homeResponseData;

  HomeResponse(this.status, this.code, this.message, this.homeResponseData);
  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}

@JsonSerializable()
class Deeplink {
  String screen;
  @JsonKey(name: 'param_one')
  String paramOne;
  @JsonKey(name: 'param_two')
  String? paramTwo;
  @JsonKey(name: 'param_three')
  String? paramThree;
  @JsonKey(name: 'param_four')
  String? paramFour;

  Deeplink(this.screen, this.paramOne, this.paramTwo, this.paramThree,
      this.paramFour);
  factory Deeplink.fromJson(Map<String, dynamic> json) =>
      _$DeeplinkFromJson(json);
  Map<String, dynamic> toJson() => _$DeeplinkToJson(this);
}

@JsonSerializable()
class ItemList {
  String title;
  String img;
  Deeplink deeplink;
  String slug;

  ItemList(this.title, this.img, this.deeplink, this.slug);
  factory ItemList.fromJson(Map<String, dynamic> json) =>
      _$ItemListFromJson(json);
  Map<String, dynamic> toJson() => _$ItemListToJson(this);
}

@JsonSerializable()
class ViewAll {
  String label;
  Deeplink deeplink;
  ViewAll(this.label, this.deeplink);
  factory ViewAll.fromJson(Map<String, dynamic> json) =>
      _$ViewAllFromJson(json);
  Map<String, dynamic> toJson() => _$ViewAllToJson(this);
}

@JsonSerializable()
class HomeResponseData {
  int type;
  @JsonKey(name: 'view_count')
  int viewCount;
  String title;
  int total;
  List<ItemList> list;
  int offset;
  int limit;
  @JsonKey(name: 'view_all')
  ViewAll viewAll;

  HomeResponseData(this.type, this.viewCount, this.title, this.total, this.list,
      this.offset, this.limit, this.viewAll);
  factory HomeResponseData.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$HomeResponseDataToJson(this);
}
