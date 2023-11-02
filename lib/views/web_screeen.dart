import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

import '../model/web_model.dart';
import '../providers/web_provider.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  void initState() {
    super.initState();
    Provider.of<WebProvider>(context, listen: false).initRefresh();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WebModel args = ModalRoute.of(context)!.settings.arguments as WebModel;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: InAppWebView(
        pullToRefreshController:
            Provider.of<WebProvider>(context).pullToRefreshController,
        initialUrlRequest: URLRequest(
          url: Uri.parse(args.webURL),
        ),
        onLoadStart: (controller, uri) {
          Provider.of<WebProvider>(context, listen: false)
              .initController(controller);
        },
        onLoadStop: (controller, uri) {
          Provider.of<WebProvider>(context, listen: false).stopRefresh();
        },
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(0), right: Radius.circular(0))),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () async {
                    await Provider.of<WebProvider>(context, listen: false)
                        .back();
                  },
                  icon: Icon(Icons.arrow_back_outlined)),
              IconButton(
                  onPressed: () async {
                    await Provider.of<WebProvider>(context, listen: false)
                        .forward();
                  },
                  icon: Icon(Icons.arrow_forward_outlined)),
              IconButton(
                  onPressed: () async {
                    await Provider.of<WebProvider>(context, listen: false)
                        .refresh();
                  },
                  icon: Icon(Icons.refresh)),
              IconButton(
                  onPressed: () async {
                    await Provider.of<WebProvider>(context, listen: false)
                        .homePage(args.webURL);
                  },
                  icon: Icon(Icons.home_filled)),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.mobile_screen_share_rounded)),
            ],
          ),
        ),
      ),
    ));
  }
}

