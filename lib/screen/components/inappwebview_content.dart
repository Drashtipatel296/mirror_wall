import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import '../../provider/google_provider.dart';
import '../../utils/global_var.dart';

Stack inAppWebViewContent(BuildContext context) {
  return Stack(
    children: [
      InAppWebView(
        initialUrlRequest: URLRequest(
            url: WebUri(
                'https://www.google.com/search?q=${Provider.of<GoogleProvider>(context, listen: false).searchText}&sca_esv=453cf80c9d34ac6b&sca_upv=1&rlz=1C1CHBD_enIN1099IN1101&sxsrf=ADLYWILO4ZE1r6P0Ha8wvoqAglAm7r1t5A%3A1716482160781&ei=cHBPZpCsL93V1e8PtZ-C2AM&ved=0ahUKEwiQpNOrmqSGAxXdavUHHbWPADsQ4dUDCBE&uact=5&oq=flutter&gs_lp=Egxnd3Mtd2l6LXNlcnAiB2ZsdXR0ZXIyChAjGIAEGCcYigUyChAjGIAEGCcYigUyBBAjGCcyChAAGIAEGEMYigUyCxAAGIAEGLEDGIMBMggQABiABBixAzILEAAYgAQYsQMYgwEyCxAAGIAEGLEDGIoFMgsQABiABBixAxiDATIIEAAYgAQYsQNIphZQ5wpYnRJwAngBkAEBmAGmAqABug6qAQYwLjEyLjG4AQPIAQD4AQGYAgSgAskCwgIKEAAYsAMY1gQYR8ICDRAAGIAEGLADGEMYigXCAgUQABiABJgDAIgGAZAGCpIHAzIuMqAHgnM&sclient=gws-wiz-serp')),
        onWebViewCreated: (controller) {
          inAppWebViewController = controller;
        },
        onProgressChanged: (controller, progress) {
          Provider.of<GoogleProvider>(context, listen: false)
              .onProgress(progress);
        },
        onLoadStop: (controller, url) {
          Provider.of<GoogleProvider>(context, listen: false)
              .currentUrlLink(url.toString());
          pullToRefreshController.endRefreshing();
        },
        pullToRefreshController: pullToRefreshController,
      ),
      (Provider.of<GoogleProvider>(context).progress < 1)
          ? Align(
        alignment: Alignment.bottomCenter,
        child: LinearProgressIndicator(
          value: Provider.of<GoogleProvider>(context).progress,
        ),
      )
          : const Column(),
    ],
  );
}