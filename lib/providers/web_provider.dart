import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../model/web_model.dart';

class WebProvider extends ChangeNotifier {
  InAppWebViewController? inAppWebViewController;
  PullToRefreshController? pullToRefreshController;
  SearchController? searchController;

  List<WebModel> GovtList = [
    WebModel(
        webName: 'UIDAI',
        webURL: 'https://uidai.gov.in',
        imgURL:
            'https://ghost.tarento.com/content/images/2022/07/Tarento-Customer-Story-Digital-India-Aadhaar-logo.png'),
    WebModel(
        webName: 'EPFO',
        webURL: 'https://www.epfindia.gov.in/site_en/index.php',
        imgURL:
            'https://www.thestatesman.com/wp-content/uploads/2019/02/epfo.jpg'),
    WebModel(
        webName: 'Niti-Aayog',
        webURL: 'https://niti.gov.in',
        imgURL:
            'https://jobalertshub.com/wp-content/images/org/national-institution-for-transforming-india-200-logo.png'),
    WebModel(
        webName: 'PariVahan',
        webURL: 'https://parivahan.gov.in/parivahan',
        imgURL:
            'https://play-lh.googleusercontent.com/So0m99fV86CHcdh41OR__01BRJT5v6pmi8L6CWwCnzhkzqmdCWfl4E95MD4D9dwa75Q'),
  ];

  List<WebModel> OttList = [
    WebModel(
        webName: 'NetFlix',
        webURL: 'https://www.netflix.com/in',
        imgURL:
            'https://seeklogo.com/images/N/netflix-n-logo-0F1ED3EBEB-seeklogo.com.png'),
    WebModel(
        webName: 'Amazon Prime',
        webURL: 'https://www.primevideo.com',
        imgURL:
            'https://1000logos.net/wp-content/uploads/2022/10/Amazon-Prime-Video-Icon.png'),
    WebModel(
        webName: 'HotStar',
        webURL: 'https://www.hotstar.com/in',
        imgURL:
            'https://ww2.freelogovectors.net/wp-content/uploads/2021/12/disneyplus-hotstar-logo-freelogovectors.net_-400x400.png'),
    WebModel(
        webName: 'Jio Cinema',
        webURL: 'https://www.jiocinema.com/',
        imgURL:
            'https://static.langimg.com/photo/imgsize-118211,msid-101069708/navbharat-times.jpg'),
  ];

  List<WebModel> EduList = [
    WebModel(
        webName: 'Wikipedia',
        webURL: 'https://www.wikipedia.org/',
        imgURL:
            'https://cdn.dribbble.com/userupload/9664228/file/original-b47d13dbbcaa2a939afb725399227e20.png?resize=320x240&vertical=center'),
    WebModel(
        webName: 'W3Schools',
        webURL: 'https://www.w3schools.com/',
        imgURL:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/W3Schools_logo.svg/1088px-W3Schools_logo.svg.png'),
    WebModel(
        webName: 'JavaPoint',
        webURL: 'https://www.javatpoint.com/',
        imgURL: 'https://avatars.githubusercontent.com/u/10328309?v=4.png'),
    WebModel(
        webName: 'Tutorials Point',
        webURL: 'https://www.tutorialspoint.com/index.htm',
        imgURL: 'https://d2un9pqbzgw43g.cloudfront.net/main/download11.png'),
  ];

  List<dynamic> BrowserList = ['brave', 'google', 'duckduckGO', 'Perplexity'];

  void SearchingTaps() {
    Searchtaps braveIsTrue = Searchtaps(
        braveTap: true, googleTap: false, duckTap: false, perplexTap: false);
    Searchtaps GoogleIsTrue = Searchtaps(
        braveTap: false, googleTap: true, duckTap: false, perplexTap: false);
    Searchtaps duckisTrue = Searchtaps(
        braveTap: false, googleTap: false, duckTap: true, perplexTap: false);
    Searchtaps perplexIsTrue = Searchtaps(
        braveTap: false, googleTap: false, duckTap: false, perplexTap: true);
    var isTrue;

    if (BrowserList == 0) {
      isTrue = braveIsTrue;
    } else if (BrowserList == 1) {
      isTrue = GoogleIsTrue;
    } else if (BrowserList == 2) {
      isTrue = duckisTrue;
    } else if (BrowserList == 3) {
      isTrue = perplexIsTrue;
    }

    notifyListeners();
  }

  void initController(controller) {
    inAppWebViewController = controller;
    notifyListeners();
  }

  void initRefresh() {
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () {
        inAppWebViewController!.reload();
      },
    );
    notifyListeners();
  }

  Future<void> homePage(String uri) async {
    await inAppWebViewController!.loadUrl(
      urlRequest: URLRequest(
        url: Uri.parse(uri),
      ),
    );
    notifyListeners();
  }

  Future<void> refresh() async {
    await inAppWebViewController!.reload();
    notifyListeners();
  }

  Future<void> forward() async {
    if (await inAppWebViewController!.canGoForward()) {
      await inAppWebViewController!.goForward();
    }
    notifyListeners();
  }

  Future<void> back() async {
    if (await inAppWebViewController!.canGoBack()) {
      await inAppWebViewController!.goBack();
      notifyListeners();
    }
  }

  void stopRefresh() {
    pullToRefreshController!.endRefreshing();
    notifyListeners();
  }
}
