import 'package:json_annotation/json_annotation.dart';
part 'ServerUrls.g.dart';

@JsonSerializable()
class ServerUrls {
  @JsonKey(name: 'data')
  UrlData urlData;

  ServerUrls(this.urlData);

  factory ServerUrls.fromJson(Map<String, dynamic> json) =>
      _$ServerUrlsFromJson(json);
  Map<String, dynamic> toJson() => _$ServerUrlsToJson(this);
}

@JsonSerializable()
class UrlData {
  @JsonKey(name: "last_watch")
  int lastWatch;
  @JsonKey(name: "list")
  List<EpisodUrlListItem> urlList;

  UrlData(this.lastWatch, this.urlList);
  factory UrlData.fromJson(Map<String, dynamic> json) =>
      _$UrlDataFromJson(json);
  Map<String, dynamic> toJson() => _$UrlDataToJson(this);
}

@JsonSerializable()
class EpisodUrlListItem {
  @JsonKey(name: "url_id")
  String urlId;
  String url;
  String quality;
  @JsonKey(name: "episode_id")
  String episodId;
  //String auth;

  EpisodUrlListItem(this.urlId, this.url, this.quality, this.episodId);
  factory EpisodUrlListItem.fromJson(Map<String, dynamic> json) =>
      _$EpisodUrlListItemFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodUrlListItemToJson(this);
}
