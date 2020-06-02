import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Completer<WebViewController> controller = Completer<WebViewController>();
  // static WebViewController weatherController;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      child: WebView(
        onWebViewCreated: (WebViewController c) {
          controller.complete(c);
        },
        initialUrl:
            'https://www.accuweather.com/en/in/mumbai/204842/weather-forecast/204842',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
