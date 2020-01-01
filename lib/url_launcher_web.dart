import 'dart:async';
import 'dart:html' as html;

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

class UrlLauncherPlugin {
  static void registerWith(Registrar reg) {
  	final MethodChannel channel = MethodChannel(
  		'plugins.flutter.io/url_launcher',
  		const StandardMethodCodec(),
  		reg.messenger);
  
    final UrlLauncherPlugin instance = UrlLauncherPlugin();
    channel.setMethodCallHandler(instance.handleMethodCall) ;
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'launch':
        final String url = call.arguments['url'];
        return _launch(url);
      default:
        throw PlatformException(
            code: 'Unimplemented',
            details: "The url_launcher plugin for web doesn't implement "
                "the method '${call.method}'");
    }
  }

  // Experimenting here with passing additional info with the url --  in
  // this case a session id 
  bool _launch(String url) {
    bool ret = false;
    String sessId;

    var arr = url.split('|');
    if (arr.length == 2) {
      sessId = arr[1];
    }
    
    try {
      html.window.location = arr[0]; // go to another url in this tab
    // html.window.open(url, '') != null;

      html.window.sessionStorage['my.session'] = sessId;
      //html.window.cookieStore = html.CookieStore(); // cookieStore is sometimes null
      ret = true;
    } catch (e) {
      print(e);
    }
    return ret;
  }
}
