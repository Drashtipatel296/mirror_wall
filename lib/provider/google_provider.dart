import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../model/bookmark_model.dart';
import '../utils/global_var.dart';

class GoogleProvider extends ChangeNotifier{
  double progress = 0;
  String searchText = '';
  List<BookMarkModal> bookmarkList = [];
  String? currentUrl;
  List<BookMarkModal> historyList =[];
  String? title;
  BookMarkModal? bookMarkModal;
  WebUri uri= WebUri('https://www.google.com');
  bool isButtonEnabled = true;
  bool isButtonForward = false;

  void onProgress(int progress){
    this.progress = progress/100;
    notifyListeners();
  }

  Future<void> goBack() async {
    await inAppWebViewController.goBack();
    notifyListeners();
  }

  Future<void> canGoBack() async {
    isButtonEnabled = await inAppWebViewController.canGoBack();
    notifyListeners();
  }

  Future<void> goForward() async {
    await inAppWebViewController.goForward();
    notifyListeners();
  }

  Future<void> canGoForward()
  async {
    isButtonForward = await inAppWebViewController.canGoForward();
    notifyListeners();
  }

  void search(String searchText){
    this.searchText = searchText;
    notifyListeners();
  }

  Future<void> currentUrlLink(String url) async {
    currentUrl = url.toString();
    title = await inAppWebViewController.getTitle();
    bookMarkModal = BookMarkModal(title: title!, url: currentUrl!);
    historyList.add(bookMarkModal!);
    notifyListeners();
  }

  void addToBookMark(){
    bookmarkList.add(bookMarkModal!);
    notifyListeners();
  }
  void deleteHistory(int index)
  {
    historyList.removeAt(index);
    notifyListeners();
  }

  void deleteBookMark(int index)
  {
    bookmarkList.removeAt(index);
    notifyListeners();
  }

  void openWebsite(url)
  {
    currentUrl = url;
    inAppWebViewController.loadUrl(urlRequest: URLRequest(url: WebUri(currentUrl!)));
    notifyListeners();
  }

  void changeWebView(value)
  {
    uri = WebUri(value);
    inAppWebViewController.loadUrl(urlRequest: URLRequest(url: uri));
    notifyListeners();
  }
}