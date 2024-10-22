# Introduction

This is an utility package that will help with your development, increasing the development speed and getting the most out of your time, especially suitable for indie Developers.  

1. Admob Intergration

# Admob 

## Step 1 : Setup 

Add the dependency: 

```
google_mobile_ads
``` 

Add the following code in manifest file inside <application> </application>
```
 <meta-data
            android:name="com.google.android.gms.ads.APPLICATION_ID"
            android:value=""/>
```

## Step 2:  Integration

This will load the banner ad, it is recommended to use inside a init or build function.

    adMobService.loadBannerAd();  
    adMobService.loadInterstitialAd();
    adMobService.loadRewardedAd();


Load the ads, if you want to pre load any ads. 

 @override
  void initState() {
    super.initState();
    // Load ads.
  }

  ## Step 3 : Showing ads 

  ### Banner Ads 
  
To show banner ads, you must show as widget. 

            adMobService.getBannerAdWidget(), 

To show other ads,  

```
   adMobService.showInterstitialAd();
    adMobService.showRewardedAd((z){});
```




  



