import 'package:json_annotation/json_annotation.dart';
part 'EpisodInfo.g.dart';

@JsonSerializable()
class EpisodInfo {
  EpisodesData data;
  EpisodInfo(this.data);

  factory EpisodInfo.fromJson(Map<String, dynamic> json) =>
      _$EpisodInfoFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodInfoToJson(this);
}

@JsonSerializable()
class EpisodesData {
  String title = "";
  String description;
  @JsonKey(name: "img")
  String image;
  @JsonKey(name: "img_large")
  String? largeImage;
  Episodes episodes;

  EpisodesData(
      this.episodes, this.title, this.description, this.image, this.largeImage);

  factory EpisodesData.fromJson(Map<String, dynamic> json) =>
      _$EpisodesDataFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodesDataToJson(this);
}

@JsonSerializable()
class Episodes {
  @JsonKey(name: "list")
  List<Elist> episodList;

  Episodes(this.episodList);
  factory Episodes.fromJson(Map<String, dynamic> json) =>
      _$EpisodesFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodesToJson(this);
}

@JsonSerializable()
class Elist {
  int id;
  String label;

  Elist(this.id, this.label);

  factory Elist.fromJson(Map<String, dynamic> json) => _$ElistFromJson(json);
  Map<String, dynamic> toJson() => _$ElistToJson(this);
}
