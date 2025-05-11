/* import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAds {
  BannerAd? bannerAd;


  // TODO: replace this test ad unit with your own ad unit.
  final adUnitId = "ca-app-pub-3940256099942544/6300978111";

  /// Loads a banner ad.
  void loadAd(VoidCallback callback) async {


    bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          bannerAd = ad as BannerAd;
          callback();
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {

          ad.dispose();
        },
      ),
    )..load();
  }

} */

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAdsController extends GetxController {
  BannerAd? bannerAd;
  var isAdLoaded = false.obs;


  final adUnitId = "ca-app-pub-3940256099942544/6300978111"; // Test Ad Unit ID

  @override
  void onInit() {
    super.onInit();
    loadAd();
  }

  /// Reklamı yükler.
  void loadAd() async {
    bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd = ad as BannerAd;
          isAdLoaded.value = true;
        },
        onAdFailedToLoad: (ad, err) {
          isAdLoaded.value = false; 
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void onClose() {
    bannerAd?.dispose(); 
    super.onClose();
  }
}
