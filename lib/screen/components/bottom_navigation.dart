import 'package:flutter/material.dart';
import 'package:mirror_wall/provider/google_provider.dart';
import 'package:provider/provider.dart';
import '../../utils/global_var.dart';

Row bottomNavigation(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(
        onPressed: Provider.of<GoogleProvider>(context, listen: true)
                .isButtonEnabled
            ? () {
                (Provider.of<GoogleProvider>(context, listen: false).goBack());
              }
            : null,
        icon: const Icon(Icons.chevron_left),
      ),
      IconButton(
        onPressed:
            Provider.of<GoogleProvider>(context, listen: true).isButtonForward
                ? () {
                    (Provider.of<GoogleProvider>(context, listen: false)
                        .goForward());
                  }
                : null,
        icon: const Icon(Icons.chevron_right),
      ),
      IconButton(
        onPressed: () {
          inAppWebViewController.reload();
        },
        icon: const Icon(Icons.refresh),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.add_box_outlined),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.home),
      ),
    ],
  );
}
