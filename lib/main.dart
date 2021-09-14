import 'dart:isolate';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_now_clone/MovieDetailsView.dart';
import 'package:movies_now_clone/Netowork.dart';
import 'package:movies_now_clone/models/HomeResponse.dart';
import 'package:movies_now_clone/models/TokenResponse.dart';

import 'models/SearchResponse.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        // primaryColor: Color(0xff60D394), //CDB4DB
        // accentColor: Color(0xffEE6055), //FFAFCC
        primaryColor: Colors.amber, //CDB4DB
        accentColor: Colors.amber, //FFAFCC

        // Define the default font family.
        fontFamily: 'Roboto',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flixs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController _inputController = TextEditingController();
  final double height = 400;
  final double width = 300;
  List<ItemList> searchedResults = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    //_getHomeResponse();
  }

  Future<TokenResponse> _getResponseToken() async {
    var result = await MoviewsNowAPI().getTokenResponse();
    print(result != null);
    print(result.message);
    print(result.code);
    print(result.data.splashImage);
    return result;
  }

  Future<HomeResponse> _getHomeResponse() async {
    var result = await MoviewsNowAPI().getHomeResponse();
    print(result.message);
    print(result.code);
    return result;
  }

  Future<SearchResponse> _getSearchResponse(String searchString) async {
    var result = await MoviewsNowAPI().getSearchResult(searchString);
    print("results length ${result.results.list.length}");
    setState(() {
      isLoading = false;
      searchedResults = result.results.list;
    });
    return result;
  }

  void _incrementCounter() {
    // setState(() {
    //   _counter++;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_headerView(), _checkStateAndShowResults()],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<ItemList> getMenuList(List<HomeResponseData> list) {
    var element = list.where((element) => element.type == 13);
    return element.first.list;
  }

  Widget _checkStateAndShowResults() {
    if (isLoading) {
      return Flexible(child: CircularProgressIndicator());
    } else if (!isLoading && searchedResults.length > 0) {
      return _searchResultsView(searchedResults);
    } else {
      return Flexible(child: Text("no results found"));
    }
  }

  Widget _searchResultsView(List<ItemList> items) {
    return Flexible(
        child: Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: (width / height),
              crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            MediaDetailView(title: items[index].slug)));
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        items[index].img,
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: index % 2 == 0 ? Colors.redAccent : Colors.amber),
              ),
            );
          }),
    ));
  }

  Widget _headerView() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
              child: TextField(
            controller: _inputController,
          )),
          Padding(
            padding: EdgeInsets.all(16),
            child: InkWell(
              child: Icon(Icons.search),
              onTap: () => _OnSearchTap(_inputController.text),
            ),
          )
        ],
      ),
    );
  }

  _OnSearchTap(String searchString) {
    if (searchString.isNotEmpty) {
      FocusScope.of(context).unfocus();
      _getSearchResponse(searchString);
      _inputController.text = "";
      setState(() {
        isLoading = true;
      });
    }
  }
}
