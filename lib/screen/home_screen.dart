import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:mirror_wall/provider/google_provider.dart';
import 'package:provider/provider.dart';
import 'components/bottom_navigation.dart';
import 'components/inappwebview_content.dart';
import 'components/net_connection.dart';
import 'components/popmenu_screen.dart';
import 'components/text_field.dart';

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
            child: textFieldBox(providerFalse),
          ),
        ),
      ),
      body: StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.data!.contains(ConnectivityResult.mobile) ||
              snapshot.data!.contains(ConnectivityResult.wifi)) {
            return inAppWebViewContent(context);
          } else {
            return netConnection();
          }
        },
        stream: Connectivity().onConnectivityChanged,
      ),
      bottomNavigationBar: bottomNavigation(context),
    );
  }
}