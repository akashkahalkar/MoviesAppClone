import 'dart:core';
import 'package:http/http.dart';
import 'package:movies_now_clone/models/EpisodInfo.dart';
import 'package:movies_now_clone/models/HomeResponse.dart';
import 'package:movies_now_clone/models/SearchResponse.dart';
import 'package:movies_now_clone/models/ServerUrls.dart';
import 'package:movies_now_clone/models/TokenResponse.dart';
import 'dart:convert';

class Network {
  Uri? uri;
  Map<String, String> headers = Map<String, String>();
  Network(String url) {
    uri = Uri.parse(url);
  }

  Future getData() async {
    print('requesting from url: $uri');
    try {
      if (uri != null) {
        Response response = await get(uri!, headers: headers);
        //print("response -> ${response.body}");
        if (response.statusCode == 200) {
          return jsonDecode(response.body);
        } else {
          print('failed to get response');
          var error = {
            "success": "failed",
            "code": response.statusCode,
            "message": "failed to get response"
          };
          return error;
        }
      } else {
        var error = {
          "success": "failed",
          "code": 500,
          "message": "Invalid url"
        };
        return error;
      }
    } on Error catch (e) {
      var error = {"success": "failed", "code": 500, "message": "$e"};
      return error;
    }
  }
}

class MoviewsNowAPI {
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'User-Agent': 'Mobile-Android',
    'device-id': 'SabaerTroll',
    'api-version': '1',
    'device-details': 'Godzilla_phone',
    'app-version-code': '5',
    'Keep-Alive': 'false',
    'app-version': '1.3'
  };
  Future<TokenResponse> getTokenResponse() async {
    final url =
        'https://watchany.tech/api/v1/server_url?token=abcd:efghijklmnopqrstuvws&id=abcd';

    Network network = Network(url);
    network.headers = requestHeaders;
    var json = await network.getData();

    var tokenResponseObj = TokenResponse.fromJson(json);
    return tokenResponseObj;
  }

  Future<EpisodInfo> getEpisodInfo(String slug) async {
    final url =
        "https://watchany.tech/api/v1/shows/$slug?with_episodes=1&with_genres=1";

    Network network = Network(url);
    network.headers = requestHeaders;
    var json = await network.getData();
    //print("search response - > $json");
    var episodInfo = EpisodInfo.fromJson(json);
    return episodInfo;
  }

  Future<ServerUrls> getServerUrls(String slug, String id) async {
    final url =
        "https://watchany.tech/api/v1/shows/$slug/episodes/$id/urls?to_download=0";

    Network network = Network(url);
    network.headers = requestHeaders;
    var json = await network.getData();
    //print("search response - > $json");
    var serverUrls = ServerUrls.fromJson(json);
    return serverUrls;
  }

  Future<SearchResponse> getSearchResult(String searchString) async {
    final url =
        "https://watchany.tech/api/v1/advanced_search?order_key=last%20updated&order=descending&title=$searchString";

    Network network = Network(url);
    network.headers = requestHeaders;
    var json = await network.getData();
    print("search response - > $json");
    var searchResponse = SearchResponse.fromJson(json);
    return searchResponse;
  }

  Future<HomeResponse> getHomeResponse() async {
    final url = "https://watchany.tech/api/v1/home";

    Network network = Network(url);
    network.headers = requestHeaders;
    var json = await network.getData();
    print("home response - > $json");
    var homeResponse = HomeResponse.fromJson(json);
    return homeResponse;
  }
}
