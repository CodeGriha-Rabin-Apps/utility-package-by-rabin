import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  final String bannerAdUnitId;
  final String interstitialAdUnitId;
  final String rewardedAdUnitId;

  static BannerAd? _bannerAd;
  static InterstitialAd? _interstitialAd;
  static RewardedAd? _rewardedAd;

  // Constructor that accepts ad unit IDs
  AdMobService({
    required this.bannerAdUnitId,
    required this.interstitialAdUnitId,
    required this.rewardedAdUnitId,
  });

  Future<void> initialize() async {
    await MobileAds.instance.initialize();
  }

  // Load and show a banner ad
  Future<void> loadBannerAd() async {
    _bannerAd = BannerAd(
      adUnitId: bannerAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) => print('Banner Ad Loaded'),
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('Banner Ad Failed to Load: $error');
        },
      ),
    )..load();
  }

  Widget getBannerAdWidget() {
    if (_bannerAd != null) {
      return Container(
        height: _bannerAd!.size.height.toDouble(),
        width: _bannerAd!.size.width.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      );
    }
    return SizedBox.shrink();
  }

  // Load and show an interstitial ad
  Future<void> loadInterstitialAd() async {
    await InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          print('Interstitial Ad Loaded');
        },
        onAdFailedToLoad: (error) {
          print('Interstitial Ad Failed to Load: $error');
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.show();
      _interstitialAd = null; // Dispose after showing
    }
  }

  // Load and show a rewarded ad
  Future<void> loadRewardedAd() async {
    await RewardedAd.load(
      adUnitId: rewardedAdUnitId,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          print('Rewarded Ad Loaded');
        },
        onAdFailedToLoad: (error) {
          print('Rewarded Ad Failed to Load: $error');
        },
      ),
    );
  }

  Future<void> showRewardedAd(Function onUserEarnedReward) async {
    if (_rewardedAd != null) {
      _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          onUserEarnedReward();
          print('Reward Earned: ${reward.amount}');
        },
      );
      _rewardedAd = null; // Dispose after showing
    }
  }

  // Dispose any ads
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
  }
}
