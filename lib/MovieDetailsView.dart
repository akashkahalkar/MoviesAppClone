import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies_now_clone/VideoPlayer.dart';
import 'package:movies_now_clone/models/CustomAppBar.dart';
import 'package:movies_now_clone/models/EpisodInfo.dart';

import 'Netowork.dart';
import 'models/ServerUrls.dart';
import 'models/TokenResponse.dart';

class MediaDetailView extends StatefulWidget {
  MediaDetailView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MediaDetailViewState createState() => _MediaDetailViewState();
}

class _MediaDetailViewState extends State<MediaDetailView> {
  List<Elist> episodList = [];
  List<EpisodUrlListItem> urls = [];
  String image = "";

  @override
  void initState() {
    super.initState();
    _getEpisodInfo();
  }

  Future<EpisodInfo> _getEpisodInfo() async {
    var result = await MoviewsNowAPI().getEpisodInfo(widget.title);
    image = result.data.image;
    //var result = await compute(MoviewsNowAPI().getEpisodInfo, widget.title);
    if (result.data.episodes.episodList.isNotEmpty) {
      episodList = result.data.episodes.episodList;
      final id = result.data.episodes.episodList.first.id.toString();
      _getServerURL(widget.title, id);
    }
    // if (count > 0) {
    //   final id = result.data.episodList.first.id.toString();
    //   _getServerURL(widget.title, id);
    // }
    return result;
  }

  _getServerURL(String slug, String id) async {
    var results = await MoviewsNowAPI().getServerUrls(slug, id);

    results.urlData.urlList.forEach((element) {
      print(element.quality);
      print(element.url);
    });
    setState(() {
      urls = results.urlData.urlList;
    });
  }

  _startPlayer(String url) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return VideoPlayer(url);
    }));
  }

  Widget _getList() {
    if (urls.length > 0) {
      return Expanded(
          child: ListView.builder(
              itemCount: urls.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 4),
                  child: Container(
                    color: Colors.indigoAccent,
                    child: ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(image), fit: BoxFit.cover),
                            color: Colors.amberAccent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                      ),
                      title: Text(urls[index].episodId),
                      trailing: Text(urls[index].quality),
                      onTap: () {
                        print("starting player with url -> ${urls[index].url}");
                        if (urls[index].url != null) {
                          _startPlayer(urls[index].url);
                        }
                      },
                    ),
                  ),
                );
              }));
    } else {
      return CircularProgressIndicator();
    }
  }

  //EpisodInfo info;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(),
      ),
      body: SafeArea(
        child: _getHeaderStack(),
      ),
    );
  }

/*
Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  Spacer(),
                ],
              ),
              InkWell(
                child: Text("play"),
                onTap: () => {_startPlayer(urls[0].url)},
              ),
              _getList()
            ],
          ),
        )
*/
  Widget _getHeaderStack() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250.0,
            child: Image.asset(""),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("1"),
              Text("2"),
              Text("3"),
            ],
          ),
        ),
      ],
    );
  }
}
