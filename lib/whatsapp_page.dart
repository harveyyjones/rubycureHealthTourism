import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'Business_Logic/firestore_database_service.dart';

class WhatsappPage extends StatefulWidget {
  WhatsappPage(this.url);
  String? url;

  @override
  State<WhatsappPage> createState() => _WhatsappPageState();
}

class _WhatsappPageState extends State<WhatsappPage> {
  FirestoreDatabaseService _serviceForSnapshot = FirestoreDatabaseService();

  WebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _serviceForSnapshot.getProfileData(),
      builder: (context, snapshot) => Scaffold(
        appBar: AppBar(actions: []),
        body: Container(
          child: WebView(
            initialUrl: widget.url,
          ),
        ),
      ),
    );
  }
}
