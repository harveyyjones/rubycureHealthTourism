import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebSitePage extends StatefulWidget {
  WebSitePage({Key? key}) : super(key: key);

  @override
  State<WebSitePage> createState() => _WebSitePageState();
}

class _WebSitePageState extends State<WebSitePage> {
  WebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        // IconButton(
        //     onPressed: () => Navigator.pop(context),
        //     icon: Icon(Icons.arrow_back))
      ]),
      body: Container(
        child: WebView(
          initialUrl: "https://www.oxfordmedicaltravel.com/",
        ),
      ),
    );
  }
}
