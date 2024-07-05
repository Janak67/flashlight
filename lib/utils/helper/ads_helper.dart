
import 'package:flashlight/utils/import.dart';

class AdsHelper {
  static AdsHelper adsHelper = AdsHelper._();

  AdsHelper._();

  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;

  var bannerId = "ca-app-pub-5723608682663955/5442749273";
  var interstitialId = "ca-app-pub-5723608682663955/9669220152";

  void initBanner() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: bannerId,
      listener: const BannerAdListener(),
      request: const AdRequest(),
    );
    bannerAd!.load();
  }

  void interstitialAds() {
    InterstitialAd.load(
      adUnitId: interstitialId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
          print("$error");
        },
      ),
    );
  }
}
