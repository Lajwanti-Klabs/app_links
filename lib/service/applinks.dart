import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/cupertino.dart';


class AppLinksDeepLink {
  AppLinksDeepLink._privateConstructor();

  static final AppLinksDeepLink _instance = AppLinksDeepLink._privateConstructor();

  static AppLinksDeepLink get instance => _instance;

  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSubscription;

 //  @override
 // void onInit() {
 //    super.onInit();
 //    _appLinks = AppLinks();
 //    initDeepLinks();
 //  }


  Future<void> initDeepLinks() async {
    // Check initial link if app was in cold state (terminated)
    final appLink = await _appLinks.getInitialLinkString();
    if (appLink != null) {
      var uri = Uri.parse(appLink.toString());
      print(' here you can redirect from url as per your need ');
    }

    // Handle link when app is in warm state (front or background)
    _linkSubscription = _appLinks.uriLinkStream.listen((uriValue) {
      print(' you will listen any url updates ');
      print(' here you can redirect from url as per your need ');
    },onError: (err){
      debugPrint('====>>> error : $err');
    },onDone: () {
      _linkSubscription?.cancel();
    },);
  }
}