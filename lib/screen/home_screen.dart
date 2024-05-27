import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/provider/google_provider.dart';
import 'package:provider/provider.dart';
import '../utils/global_var.dart';
import 'components/bottom_navigation.dart';
import 'components/net_connection.dart';
import 'components/popmenu_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<GoogleProvider>(context);
    final providerFalse = Provider.of<GoogleProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<GoogleProvider>(context, listen: false)
                  .addToBookMark();
            },
            icon: const Icon(Icons.bookmark_added_sharp),
          ),
          popupmenuButton(providerTrue, providerFalse),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextFormField(
              controller: txtSearch,
              decoration: InputDecoration(
                hintText: 'Search or type address',
                filled: true,
                fillColor: Colors.grey.shade300,
                suffixIcon: IconButton(
                  onPressed: () {
                    providerFalse.search(txtSearch.text);
                    if (providerFalse.uri.toString() ==
                        'https://duckduckgo.com/') {
                      inAppWebViewController.loadUrl(
                          urlRequest: URLRequest(
                              url: WebUri(
                                  '${providerFalse.uri}/?q=${providerFalse.searchText}&sca_esv=453cf80c9d34ac6b&sca_upv=1&rlz=1C1CHBD_enIN1099IN1101&sxsrf=ADLYWILO4ZE1r6P0Ha8wvoqAglAm7r1t5A%3A1716482160781&ei=cHBPZpCsL93V1e8PtZ-C2AM&ved=0ahUKEwiQpNOrmqSGAxXdavUHHbWPADsQ4dUDCBE&uact=5&oq=flutter&gs_lp=Egxnd3Mtd2l6LXNlcnAiB2ZsdXR0ZXIyChAjGIAEGCcYigUyChAjGIAEGCcYigUyBBAjGCcyChAAGIAEGEMYigUyCxAAGIAEGLEDGIMBMggQABiABBixAzILEAAYgAQYsQMYgwEyCxAAGIAEGLEDGIoFMgsQABiABBixAxiDATIIEAAYgAQYsQNIphZQ5wpYnRJwAngBkAEBmAGmAqABug6qAQYwLjEyLjG4AQPIAQD4AQGYAgSgAskCwgIKEAAYsAMY1gQYR8ICDRAAGIAEGLADGEMYigXCAgUQABiABJgDAIgGAZAGCpIHAzIuMqAHgnM&sclient=gws-wiz-serp'),),);
                    } else {
                      inAppWebViewController.loadUrl(
                          urlRequest: URLRequest(
                              url: WebUri(
                                  '${providerFalse.uri}/search?q=${providerFalse.searchText}&sca_esv=453cf80c9d34ac6b&sca_upv=1&rlz=1C1CHBD_enIN1099IN1101&sxsrf=ADLYWILO4ZE1r6P0Ha8wvoqAglAm7r1t5A%3A1716482160781&ei=cHBPZpCsL93V1e8PtZ-C2AM&ved=0ahUKEwiQpNOrmqSGAxXdavUHHbWPADsQ4dUDCBE&uact=5&oq=flutter&gs_lp=Egxnd3Mtd2l6LXNlcnAiB2ZsdXR0ZXIyChAjGIAEGCcYigUyChAjGIAEGCcYigUyBBAjGCcyChAAGIAEGEMYigUyCxAAGIAEGLEDGIMBMggQABiABBixAzILEAAYgAQYsQMYgwEyCxAAGIAEGLEDGIoFMgsQABiABBixAxiDATIIEAAYgAQYsQNIphZQ5wpYnRJwAngBkAEBmAGmAqABug6qAQYwLjEyLjG4AQPIAQD4AQGYAgSgAskCwgIKEAAYsAMY1gQYR8ICDRAAGIAEGLADGEMYigXCAgUQABiABJgDAIgGAZAGCpIHAzIuMqAHgnM&sclient=gws-wiz-serp'),),);
                    }
                  },
                  icon: const Icon(Icons.search),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
        ),
      ),
      body: StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.data!.contains(ConnectivityResult.mobile) ||
              snapshot.data!.contains(ConnectivityResult.wifi)) {
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
          } else {
            return netConnection();
          }
        },
        stream: Connectivity().onConnectivityChanged,
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}
