

import 'package:get/get.dart';
import 'package:news_app/helper/api_helper.dart';
import 'package:news_app/modal/country_modal.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsController extends GetxController {
  var apiHelper = ApiHelper();
  NewsModal? newsModal;
  NewsModal? teslaModal;
  NewsModal? businessModal;
  NewsModal? techModal;
  NewsModal? stockModal;

  Future<NewsModal?> fetchCompanyApiData() async {
    final data = await apiHelper.fetchCompanyApiData();
    newsModal = NewsModal.fromMap(data);
    return newsModal;
  }

  Future<NewsModal?> fetchTeslaApiData() async {
    final data = await apiHelper.fetchTeslaDetails();
    teslaModal = NewsModal.fromMap(data);
    return teslaModal;
  }

  Future<NewsModal?> fetchBusinessApiData() async {
    final data = await apiHelper.fetchBusinessDetails();
    businessModal = NewsModal.fromMap(data);
    return businessModal;
  }

  Future<NewsModal?> fetchTechApiData() async {
    final data = await apiHelper.fetchTechDetails();
    techModal = NewsModal.fromMap(data);
    return techModal;
  }

  Future<NewsModal?> fetchStocksApiData() async {
    final data = await apiHelper.fetchStocksDetails();
    stockModal = NewsModal.fromMap(data);
    return stockModal;
  }

  NewsController() {
    fetchCompanyApiData();
  }
}






class UrlLauncherController extends GetxController{
  void urlLaunch(String url){
    final Uri uri = Uri.parse(url);
    launchUrl(uri);
  }
}