import 'package:flutter/material.dart';

class WebModel {
  String webName;
  String webURL;
  String? imgURL;

  WebModel({
    required this.webName,
    required this.webURL,
    this.imgURL,
  });
}

SearchController searchController = SearchController();

class Searchtaps {
  bool braveTap;
  bool googleTap;
  bool duckTap;
  bool perplexTap;

  Searchtaps({
    required this.braveTap,
    required this.googleTap,
    required this.duckTap,
    required this.perplexTap,
  });
}
